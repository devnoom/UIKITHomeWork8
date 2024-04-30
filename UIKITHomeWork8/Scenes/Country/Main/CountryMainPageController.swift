import UIKit

class CountryMainPageController: UIViewController {
    // MARK: - Properties
    let viewModel = CountryMainPageViewModel()
    
    // MARK: - UI Components
    let countryTableView: UITableView = {
        let countryTableView = UITableView()
        countryTableView.translatesAutoresizingMaskIntoConstraints = false
        
        return countryTableView
    }()
    
     let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        title = "Countries"
        configureCountryTableView()
        viewModel.didLoad()
        reloadData()
        navigateToDetails()
    }
    // MARK: - UI Setup
    func configureCountryTableView() {
        view.backgroundColor = .blue
        view.addSubview(countryTableView)
     
        
        countryTableView.register(CountryTableViewCell.self, forCellReuseIdentifier: "CountryTableViewCell")
        countryTableView.dataSource = self
        countryTableView.delegate = self
        countryTableView.separatorStyle = .none
        countryTableView.pin(to: view)
    }
   
    // MARK: - Search Controller Functions
    private func setupSearchController() {
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.placeholder = "Countries"
        
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = false
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    // MARK: - Reload Data
    private func reloadData() {
        viewModel.onCountryUpdated = { [weak self ] in
            DispatchQueue.main.async {
                self?.countryTableView.reloadData()
            }
        }
    }
    
    // MARK: - Navigation To Details
    func navigateToDetails() {
        viewModel.onCountriesSelected = { [weak self] country in
            let CountryDetailsViewModel = CountryDetailsViewModel(country: country)
            let countryDetailsViewController = CountryDetailsViewCV(viewModel: CountryDetailsViewModel)
            self?.navigationController?.pushViewController(countryDetailsViewController, animated: false)
        }
    }
}


