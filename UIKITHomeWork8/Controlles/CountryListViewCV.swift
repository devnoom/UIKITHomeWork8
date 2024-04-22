import UIKit

class CountryListViewCV: UIViewController {
    let countryTableView = UITableView()
    var countriesData: [countries] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCountryTableView()
        
        fetchCountriesData { [weak self] (countriesData, error) in
            guard let self = self else { return }
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            if let countriesData = countriesData {
                DispatchQueue.main.async {
                    self.countriesData = countriesData
                    self.countryTableView.reloadData()
                }
            }
        }
    }
    
    func configureCountryTableView() {
        view.addSubview(countryTableView)
        setCountryTableDelegates()
        
        countryTableView.register(CountryTableViewCell.self, forCellReuseIdentifier: "CountryTableViewCell")
        countryTableView.separatorStyle = .none
        countryTableView.pin(to: view)
    }
    
    func setCountryTableDelegates() {
        countryTableView.delegate = self
        countryTableView.dataSource = self
    }
}

extension CountryListViewCV: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(countriesData.count)
        return countriesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
        let country = countriesData[indexPath.row]
        cell.titleForTableRow.text = country.name?.common
        cell.accessoryType = .disclosureIndicator

        if let flags = country.flags, let pngURLString = flags.png, let url = URL(string: pngURLString) {
            loadImage(from: url) { (image, error) in
                DispatchQueue.main.async {
                    if let image = image {
                        cell.flagForTableRow.image = image
                    } else {
                        print("Error loading image:", error?.localizedDescription ?? "Unknown error")
                    }
                }
            }
        } else {
            print("Invalid or missing image URL for country at index:", indexPath.row)
        }
        return cell
    }
}

extension CountryListViewCV: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row \(indexPath.row.description)")
        
        guard let navigationController = navigationController else {
            print("Navigation controller is nil")
            return
        }
        
        guard indexPath.row < countriesData.count else {
            print("Index out of range")
            return
        }
        
        let detailsVC = CountryDetailsViewCV()
        detailsVC.country = countriesData[indexPath.row]
        
        navigationController.pushViewController(detailsVC, animated: true)
    }
}

