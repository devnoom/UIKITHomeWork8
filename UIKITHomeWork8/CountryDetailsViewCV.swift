import UIKit

class CountryDetailsViewCV: UIViewController {
    var country: countries?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        // Configure the user interface to display country details
        guard let country = country else {
            // Handle case where country object is nil
            return
        }
        
        // Example: Display country name in the navigation bar title
        title = country.name?.common
        
        // Example: Display country information in labels
        let nameLabel = UILabel(frame: CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 30))
        nameLabel.text = "Name: \(country.name?.common ?? "")"
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)
        
        // Add more labels or other UI elements to display additional country details
    }
}
