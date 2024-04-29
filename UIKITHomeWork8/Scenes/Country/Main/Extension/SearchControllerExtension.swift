//
//  SearchControllerExtension.swift
//  UIKITHomeWork8
//
//  Created by MacBook Air on 29.04.24.
//

import Foundation
import UIKit

extension CountryMainPageController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        self.viewModel.updateSearchController(searchBarText: searchController.searchBar.text)
    }
    
    
}
