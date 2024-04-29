

import Foundation

class CountryDetailsViewModel {
//    MARK: - Properties
    private let country: Country
    var officialCountryNameTitle: String {
        country.name?.official ?? ""
    }
    var commonCountryNameTitle: String {
        country.name?.common ?? ""
    }
    var countryIndependenceDescription: String {
        country.independent?.description ?? "unavailable"
    }
    var countryRegion: String {
        country.region ?? "unavailable"
    }
    var countryFlag: String {
        country.flags?.alt ?? "not available"
    }
    var spelling: String {
        country.altSpellings?.description ?? "nothing"
    }
    var openStreetMapsUrl: URL? {
        URL(string: country.maps?.openStreetMaps ?? "google.com")
    }
    var googleMapsUrl: URL? {
        URL(string: country.maps?.googleMaps ?? "google.com")
    }
    var onFetchImage: ((Data) -> Void)?
    init(country: Country) {
        self.country = country
    }
    private func fetchCountryFlag() {
        if let imageUrl = URL(string: country.flags?.png ?? "") {
            URLSession.shared.dataTask(with: imageUrl) { data, _ , _ in
                guard let data
                else {
                    return
                }
                self.onFetchImage?(data)
            }.resume()
        }
    }
    func loadFlag() {
        fetchCountryFlag()
    }
}
