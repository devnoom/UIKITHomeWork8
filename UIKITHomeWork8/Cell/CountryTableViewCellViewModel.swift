//
//  CountryTableViewCellViewModel.swift
//  UIKITHomeWork8
//
//  Created by MacBook Air on 28.04.24.
//

import Foundation

struct CountryTableViewCellViewModel {
    private var country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    var flagUrl: URL? {
        URL(string: country.flags?.png ?? "")
    }
    
    var countryName: String {
        country.name?.common ?? ""
    }
}
