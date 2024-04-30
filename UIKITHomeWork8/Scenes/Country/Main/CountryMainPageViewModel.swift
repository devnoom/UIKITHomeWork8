//
//  CountryMainPageViewModel.swift
//  UIKITHomeWork8
//
//  Created by MacBook Air on 28.04.24.
//

import Foundation

class CountryMainPageViewModel {
    
    // MARK: - Properties
    let urlString = "https://restcountries.com/v3.1/all"
    var countriesArray: [Country] = [] {
        didSet { onCountryUpdated?() }
    }
    
     var filteredCountries: [Country]
 = []
    var countryTableViewCellViewModel: [CountryTableViewCellViewModel] = [] {
        didSet { onCountryUpdated?() }
    }
    
    var numberOfCountries: Int {
        countriesArray.count
    }
    var onCountryUpdated: (()-> Void)?
    var onCountriesSelected: ((Country)-> Void)?
    
    // MARK: - LifeCycles
    func didLoad() {
        getCountries()
    }
    
    // MARK: - Child Method
    func getCountries() {
        getData()
    }
    
    //    MARK: - Requests
        private func getData() {
            NetworkService.networkService.getData(urlString: urlString) { (result: Result<[Country], Error>) in
                switch result {
                case .success(let success):
                    self.countriesArray = success
                    self.countryTableViewCellViewModel = success.map{
                        CountryTableViewCellViewModel(country: $0)
                    }
                case .failure(let failure):
                    //ერორის პრინტვა
                    print(failure.localizedDescription)
                }
            }
        }
    //    MARK: - Navigation
        func navigateToCountryDetails(index: Int) {
            self.onCountriesSelected?(countriesArray[index])
        }
}
