import UIKit

class CountryMainPageController: UIViewController {
    // MARK: - Properties
    let viewModel = CountryMainPageViewModel()
    
    // MARK: - UI Components
    let countryTableView: UITableView = {
        let countryTableView = UITableView()
        countryTableView.translatesAutoresizingMaskIntoConstraints = false
        //countryTableView.dataSource = self
        //countryTableView.delegate = self
        return countryTableView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getCountries()
        configureCountryTableView()
        
        
    }
    // MARK: - UI Setup
    func configureCountryTableView() {
        view.addSubview(countryTableView)
     
        
        countryTableView.register(CountryTableViewCell.self, forCellReuseIdentifier: "CountryTableViewCell")
        countryTableView.separatorStyle = .none
        countryTableView.pin(to: view)
    }
    
    // MARK: - Reload Data
    private func reloadData() {
        viewModel.onCountryUpdated = { [weak self ] in
            DispatchQueue.main.async {
                self?.countryTableView.reloadData()
            }
        }
    }
   
}


