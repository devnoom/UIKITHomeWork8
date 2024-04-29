//
//  CountryViewModelExtension.swift
//  UIKITHomeWork8
//
//  Created by MacBook Air on 29.04.24.
//

import UIKit

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
                    return false // Handle nil case
                }
            }
        }
        
        self.onCountryUpdated?()
    }
}

