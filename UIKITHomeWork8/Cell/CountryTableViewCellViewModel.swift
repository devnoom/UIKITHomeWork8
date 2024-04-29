//
//  CountryTableViewModelCell.swift
//  UIKITHomeWork8
//
//  Created by MacBook Air on 28.04.24.
//

import Foundation

struct CountryTableViewModelCell {
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
    
//    var onFetchImage: ((Data)->Void)?
//    
//    func setFlag() {
//        ImageService.imageService.loadImageFromURL(flagUrl){ image in
//            if let image = image {
//                self.onFetchImage
//            }
//        }
//        
//    }
}
