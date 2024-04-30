//
//  CountryTableView.swift
//  UIKITHomeWork8
//
//  Created by MacBook Air on 28.04.24.
//

import UIKit

// MARK: - Data Source
extension CountryMainPageController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let inSearchMode = self.viewModel.inSearchMode(searchController)
        
        return inSearchMode ? self.viewModel.filteredCountries.count: self.viewModel.countriesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let inSearchMode = self.viewModel.inSearchMode(searchController)
        _ = inSearchMode ? self.viewModel.filteredCountries[indexPath.row] :
        self.viewModel.countriesArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell

        let countryCellViewModel = viewModel.countryTableViewCellViewModel[indexPath.row]
        cell.updateCell(with: countryCellViewModel)
        return cell
    }
}

// MARK: - Delegate
extension CountryMainPageController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.navigateToCountryDetails(index: indexPath.row)
        
        let inSearchMode = self.viewModel.inSearchMode(searchController)
        _ = inSearchMode ? self.viewModel.filteredCountries[indexPath.row] :
        self.viewModel.countriesArray[indexPath.row]
    }
}

extension CountryMainPageController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        self.viewModel.updateSearchController(searchBarText: searchController.searchBar.text)
    }
}
// MARK: - View Model Extension
extension CountryMainPageViewModel {
    public func inSearchMode(_ searchController: UISearchController) -> Bool {
        let isActive = searchController.isActive
        let searchText = searchController.searchBar.text ?? ""
        
        return isActive && !searchText.isEmpty
    }
    
    public func updateSearchController(searchBarText: String?) {
        self.filteredCountries = countriesArray
        
        if let searchText = searchBarText?.lowercased(), !searchText.isEmpty {
            self.filteredCountries = self.filteredCountries.filter { country in
                if let commonName = country.name?.common {
                    return commonName.lowercased().contains(searchText)
                } else {
                    return false
                }
            }
        }
        
        self.onCountryUpdated?()
    }
}
