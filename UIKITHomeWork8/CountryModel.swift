import UIKit

struct Map: Codable {
    let googleMaps: String?
    let openStreetMaps: String?

    enum CodingKeys: String, CodingKey {
        case googleMaps = "googleMaps"
        case openStreetMaps = "openStreetMaps"
    }
}


struct Flags: Codable {
    let png: String?
    let svg: String?
    let alt: String?

}

struct postalCode: Codable {
    let format: String?
    let regex: String?
}

struct capitalInfo: Codable {
    let latlng: [Double]?
}
struct Name: Codable {
        let common: String?
        let official: String?
    }

struct countries: Codable {
    let name: Name?
    let altSpellings: [String]?
    let region: String?
    let subregion: String?
    let independent: Bool?
    let status: String?
    let capital: [String]?
    let maps: Map?
    let flags: Flags?
    let capitalInfo: capitalInfo?
    let postalCode: postalCode?
}


func fetchCountriesData(completion: @escaping ([countries]?, Error?) -> Void) {
    let url = URL(string: "https://restcountries.com/v3.1/all")!
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        if let error = error {
            completion(nil, error)
            return
        }
        
        guard let data = data else {
            completion(nil, NSError(domain: "Data not found", code: 404, userInfo: nil))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let countriesData = try decoder.decode([countries].self, from: data)
            completion(countriesData, nil)
        } catch {
            completion(nil, error)
        }
    }
    
    task.resume()
}

func loadImage(from url: URL, completion: @escaping (UIImage?, Error?) -> Void) {
    URLSession.shared.dataTask(with: url) { data, response, error in
        guard let data = data, let image = UIImage(data: data), error == nil else {
            completion(nil, error ?? NSError(domain: "Image loading error", code: -1, userInfo: nil))
            return
        }
        completion(image, nil)
    }.resume()
}



