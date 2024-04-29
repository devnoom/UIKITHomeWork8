//
//  CountryTableView.swift
//  UIKITHomeWork8
//
//  Created by MacBook Air on 28.04.24.
//

import UIKit


extension CountryMainPageController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfCountries
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell

        let countryCellViewModel = viewModel.countryTableViewCellViewModel[indexPath.row]
        cell.updateCell(with: countryCellViewModel)
        return cell
    }
}

extension CountryMainPageController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.navigateToCountryDetails(index: indexPath.row)
    }
}

