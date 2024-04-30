import UIKit
import SafariServices

class CountryDetailsViewCV: UIViewController {
    // MARK: - Properties
    private var viewModel: CountryDetailsViewModel
    
    // MARK: - Init
    init(viewModel: CountryDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - UI Components
    let countryFlag = UIImageView()
    let nativeNameKey = UILabel()
    let spellingKey = UILabel()
    let capitalKey = UILabel()
    let statusKey = UILabel()
    let regionKey = UILabel()
    let postalCodeKey = UILabel()
    
    let nativeNameValue = UILabel()
    let spellingValue = UILabel()
    let capitalValue = UILabel()
    let statusValue = UILabel()
    let regionValue = UILabel()
    let postalCodeValue = UILabel()
    
    private let AboutLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let TextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
   
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    private lazy var aboutStack: UIStackView = {
        let aboutStack = UIStackView(arrangedSubviews: [AboutLabel, TextLabel])
        aboutStack.axis = .vertical
        aboutStack.alignment = .leading
        aboutStack.distribution = .equalCentering
        return aboutStack
    }()
    
    private lazy var infoKeyStack: UIStackView = {
        let infoKeyStack = UIStackView(arrangedSubviews: [nativeNameKey, spellingKey, capitalKey, statusKey, regionKey, postalCodeKey])
        infoKeyStack.translatesAutoresizingMaskIntoConstraints = false
        infoKeyStack.axis = .vertical
        infoKeyStack.spacing = 5
        infoKeyStack.distribution = .equalSpacing
        infoKeyStack.alignment = .leading
        return infoKeyStack
    }()
    
    private lazy var infoValueStack: UIStackView = {
        let infoValueStack = UIStackView(arrangedSubviews: [nativeNameValue, spellingValue, capitalValue, statusValue, regionValue, postalCodeValue])
        infoValueStack.translatesAutoresizingMaskIntoConstraints = false
        infoValueStack.axis = .vertical
        infoValueStack.spacing = 5
        infoValueStack.distribution = .equalSpacing
        infoValueStack.alignment = .trailing
        return infoValueStack
    }()
    
    let bottomStack: UIStackView = {
        let bottomStack = UIStackView()
        bottomStack.translatesAutoresizingMaskIntoConstraints = false
        return bottomStack
    }()
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadFlag()
        loadFlag()
        setupUI()
        configureBottomStack()
        
        
    }
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = .white
        
        self.navigationItem.title = viewModel.commonCountryNameTitle
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: nil, action: nil)
        
        self.regionKey.text = "region:"
        self.postalCodeKey.text = "postal:"
        self.statusKey.text = "status:"
        self.capitalKey.text = "capital:"
        self.nativeNameKey.text = "native:"
        self.spellingKey.text = "spelling:"
        
        
        self.regionValue.text = viewModel.countryRegion
        self.postalCodeValue.text = viewModel.countryRegion
        self.statusValue.text =  viewModel.countryRegion
        self.capitalValue.text = viewModel.countryRegion
        self.nativeNameValue.text = viewModel.countryRegion
        self.spellingValue.text = viewModel.countryRegion
        
        self.AboutLabel.text = "About the flag"
        self.TextLabel.text = viewModel.countryIndependenceDescription
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(countryFlag)
        contentView.addSubview(aboutStack)
        contentView.addSubview(infoKeyStack)
        contentView.addSubview(infoValueStack)
        contentView.addSubview(bottomStack)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        countryFlag.translatesAutoresizingMaskIntoConstraints = false
        aboutStack.translatesAutoresizingMaskIntoConstraints = false
        infoKeyStack.translatesAutoresizingMaskIntoConstraints = false
        bottomStack.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            scrollView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            contentView.topAnchor.constraint(equalTo:scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1.3),
            
            countryFlag.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            countryFlag.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            countryFlag.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            countryFlag.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            countryFlag.heightAnchor.constraint(equalToConstant: 200),
            
            
            
            aboutStack.topAnchor.constraint(equalTo: countryFlag.bottomAnchor, constant: 20),
            aboutStack.heightAnchor.constraint(equalToConstant: 150),
            aboutStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  20),
            aboutStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            infoKeyStack.topAnchor.constraint(equalTo: aboutStack.bottomAnchor, constant: 40),
            infoKeyStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            infoKeyStack.widthAnchor.constraint(equalToConstant: 180),
            infoKeyStack.heightAnchor.constraint(equalToConstant: 400),
            
            infoValueStack.topAnchor.constraint(equalTo: aboutStack.bottomAnchor, constant: 40),
            infoValueStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            infoValueStack.widthAnchor.constraint(equalToConstant: 180),
            infoValueStack.heightAnchor.constraint(equalToConstant: 400),
            
            bottomStack.topAnchor.constraint(equalTo: infoValueStack.bottomAnchor, constant: 20),
            bottomStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bottomStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bottomStack.heightAnchor.constraint(equalToConstant: 200)
        ])
        
    }
    
    // MARK: - Configure Bottom Stack
    func configureBottomStack() {
        let googleMapsImage = UIImage(named: "google")
        let googleMapsImageView = UIImageView(image: googleMapsImage)
        googleMapsImageView.contentMode = .scaleAspectFit
        googleMapsImageView.isUserInteractionEnabled = true
        let googleMapsTapGesture = UITapGestureRecognizer(target: self, action: #selector(openGoogleMaps))
        googleMapsImageView.addGestureRecognizer(googleMapsTapGesture)
        googleMapsImageView.heightAnchor.constraint(equalToConstant: (googleMapsImage?.size.height ?? 0) * 3).isActive = true
        googleMapsImageView.widthAnchor.constraint(equalToConstant: (googleMapsImage?.size.width ?? 0) * 3).isActive = true
        
        let openStreetMapsImage = UIImage(named: "map")
        let openStreetMapsImageView = UIImageView(image: openStreetMapsImage)
        openStreetMapsImageView.contentMode = .scaleAspectFit
        openStreetMapsImageView.isUserInteractionEnabled = true
        let openStreetMapsTapGesture = UITapGestureRecognizer(target: self, action: #selector(openOpenStreetMaps))
        openStreetMapsImageView.addGestureRecognizer(openStreetMapsTapGesture)
        openStreetMapsImageView.heightAnchor.constraint(equalToConstant: (openStreetMapsImage?.size.height ?? 0) * 3).isActive = true
        openStreetMapsImageView.widthAnchor.constraint(equalToConstant: (openStreetMapsImage?.size.width ?? 0) * 3).isActive = true
        
        bottomStack.axis = .horizontal
        bottomStack.alignment = .center
        bottomStack.distribution = .fillEqually
        
        bottomStack.addArrangedSubview(googleMapsImageView)
        bottomStack.addArrangedSubview(openStreetMapsImageView)
    }

    
    // MARK: - Load Flag
    func loadFlag(){
        viewModel.onFetchImage = {[weak self] image in
            let image = UIImage(data: image)
            DispatchQueue.main.async {
                self?.countryFlag.image = image
            }
        }
    }
    // MARK: - Navigation To Safari
    @objc func openOpenStreetMaps() {
        UIApplication.shared.open(viewModel.openStreetMapsUrl!, options: [:], completionHandler: nil)
    }
    
    @objc func openGoogleMaps() {
        UIApplication.shared.open(viewModel.googleMapsUrl!, options: [:], completionHandler: nil)
    }
    }

