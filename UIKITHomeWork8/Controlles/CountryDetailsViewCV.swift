import UIKit
import SafariServices

class CountryDetailsViewCV: UIViewController {
    var country: countries?
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isDirectionalLockEnabled = true
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    let headerStack: UIStackView = {
        let headerStack = UIStackView()
        headerStack.translatesAutoresizingMaskIntoConstraints = false
        return headerStack
    }()
    let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        return contentView
    }()
    let aboutStack: UIStackView = {
        let aboutStack = UIStackView()
        aboutStack.translatesAutoresizingMaskIntoConstraints = false
        return aboutStack
    }()
    let uiView = UIView()
    let infoKeyStack: UIStackView = {
        let infoKeyStack = UIStackView()
        infoKeyStack.translatesAutoresizingMaskIntoConstraints = false
        return infoKeyStack
    }()
    let infoValueStack: UIStackView = {
        let infoValueStack = UIStackView()
        infoValueStack.translatesAutoresizingMaskIntoConstraints = false
        return infoValueStack
    }()
    let bottomStack: UIStackView = {
        let bottomStack = UIStackView()
        bottomStack.translatesAutoresizingMaskIntoConstraints = false
        return bottomStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerStack)
        contentView.addSubview(aboutStack)
        contentView.addSubview(infoKeyStack)
        contentView.addSubview(infoValueStack)
        contentView.addSubview(bottomStack)
        
        configureHeaderStack()
        configureInfoKeyStack()
        configureAboutStack()
        configureInfoValueStack()
        configureBottomStack()
        setConstraints()
    }
    
    func configureBottomStack() {
            let googleMapsImageView = UIImageView(image: UIImage(named: "google"))
            googleMapsImageView.contentMode = .scaleAspectFit
            googleMapsImageView.isUserInteractionEnabled = true
            let googleMapsTapGesture = UITapGestureRecognizer(target: self, action: #selector(openGoogleMaps))
            googleMapsImageView.addGestureRecognizer(googleMapsTapGesture)
            
            let openStreetMapsImageView = UIImageView(image: UIImage(named: "map"))
            openStreetMapsImageView.contentMode = .scaleAspectFit
            openStreetMapsImageView.isUserInteractionEnabled = true
            let openStreetMapsTapGesture = UITapGestureRecognizer(target: self, action: #selector(openOpenStreetMaps))
            openStreetMapsImageView.addGestureRecognizer(openStreetMapsTapGesture)
            
            bottomStack.axis = .horizontal
            bottomStack.alignment = .center
            bottomStack.distribution = .fillEqually
            
            bottomStack.addArrangedSubview(googleMapsImageView)
            bottomStack.addArrangedSubview(openStreetMapsImageView)
        }
        
        @objc func openGoogleMaps() {
            if let googleMapsURL = URL(string: "https://maps.google.com") {
                let safariViewController = SFSafariViewController(url: googleMapsURL)
                present(safariViewController, animated: true, completion: nil)
            }
        }
        
        @objc func openOpenStreetMaps() {
            if let openStreetMapsURL = URL(string: "https://www.openstreetmap.org") {
                let safariViewController = SFSafariViewController(url: openStreetMapsURL)
                present(safariViewController, animated: true, completion: nil)
            }
        }
    
    func configureHeaderStack() {
        let countryName = UILabel()
        countryName.translatesAutoresizingMaskIntoConstraints = false
        countryName.text = country?.name?.common
        headerStack.axis = .vertical
        headerStack.alignment = .center
        headerStack.addArrangedSubview(countryName)
   
        let countryFlag = UIImageView()
        countryFlag.translatesAutoresizingMaskIntoConstraints = false
        countryFlag.contentMode = .scaleAspectFit // Adjust the content mode for proper image display
        headerStack.addArrangedSubview(countryFlag)
        
        if let flags = country?.flags, let pngURLString = flags.png, let url = URL(string: pngURLString) {
            loadImage(from: url) { (image, error) in
                DispatchQueue.main.async {
                    if let image = image {
                        countryFlag.image = image
                    } else {
                        print("Error loading image:", error?.localizedDescription ?? "Unknown error")
                    }
                }
            }
        } else {
            print("Invalid or missing image URL for country flag")
        }
    }
    
    func configureAboutStack() {
        let aboutTitle = UILabel()
        aboutTitle.text = "about this country"
        let descriptionAbout = UITextView()
        descriptionAbout.text = "asdnaosndalsnflanslkfnaksnfalksnfklansfi;lnaSIFIUWBEFKNJSIBHUVDBAHINJSDAIHBUGVYCFGVJKNHGUVYCFTDXRCFGHVBJKNIHUGYFTCRDFHVA BJDHUAGYBHJSNFIAUSHYFVABHSFKNJASNIFHUASF"
        descriptionAbout.isEditable = false
        aboutStack.axis = .vertical
        aboutStack.alignment = .leading

        aboutStack.addArrangedSubview(aboutTitle)
        aboutStack.addArrangedSubview(descriptionAbout)
    }

    func configureInfoKeyStack() {
        let nativeNameKey = UILabel()
        nativeNameKey.text = "native name"
        let spellingKey = UILabel()
        spellingKey.text = "spelling"
        let capitalKey = UILabel()
        capitalKey.text = "capital"
        let currencyKey = UILabel()
        currencyKey.text = "currency"
        let regionKey = UILabel()
        regionKey.text = "region"
        let neightborsKey = UILabel()
        neightborsKey.text = "neighbors"
        
        infoKeyStack.axis = .vertical
        infoKeyStack.distribution = .equalSpacing
        
        infoKeyStack.addArrangedSubview(nativeNameKey)
        infoKeyStack.addArrangedSubview(spellingKey)
        infoKeyStack.addArrangedSubview(capitalKey)
        infoKeyStack.addArrangedSubview(currencyKey)
        infoKeyStack.addArrangedSubview(regionKey)
        infoKeyStack.addArrangedSubview(neightborsKey)
        
    }
    
    func configureInfoValueStack() {
        let nativeNameValue = UILabel()
        nativeNameValue.text = country?.region
        let spellingValue = UILabel()
        spellingValue.text =  country?.altSpellings?.description
        let capitalValue = UILabel()
        capitalValue.text =  country?.capital?.first
        let currencyValue = UILabel()
        currencyValue.text = country?.capitalInfo.debugDescription
        let regionValue = UILabel()
        regionValue.text = country?.region?.lowercased()
        let neightborsValue = UILabel()
        neightborsValue.text = country?.subregion
        
        infoValueStack.axis = .vertical
        infoValueStack.distribution = .equalSpacing
        
        infoValueStack.addArrangedSubview(nativeNameValue)
        infoValueStack.addArrangedSubview(spellingValue)
        infoValueStack.addArrangedSubview(capitalValue)
        infoValueStack.addArrangedSubview(currencyValue)
        infoValueStack.addArrangedSubview(regionValue)
        infoValueStack.addArrangedSubview(neightborsValue)
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo:scrollView.topAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor, multiplier: 1.6),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            headerStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            headerStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            headerStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            headerStack.heightAnchor.constraint(equalToConstant: 300),
            
            aboutStack.topAnchor.constraint(equalTo: headerStack.bottomAnchor, constant: 30),
            aboutStack.heightAnchor.constraint(equalToConstant: 150),
            aboutStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  15),
            aboutStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            infoKeyStack.topAnchor.constraint(equalTo: aboutStack.bottomAnchor, constant: 30),
            infoKeyStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            infoKeyStack.widthAnchor.constraint(equalToConstant: 180),
            infoKeyStack.heightAnchor.constraint(equalToConstant: 400),
            
            infoValueStack.topAnchor.constraint(equalTo: aboutStack.bottomAnchor, constant: 30),
            infoValueStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            infoValueStack.widthAnchor.constraint(equalToConstant: 180),
            infoValueStack.heightAnchor.constraint(equalToConstant: 400),
            
            bottomStack.topAnchor.constraint(equalTo: infoValueStack.bottomAnchor, constant: 30),
            bottomStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            bottomStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            bottomStack.heightAnchor.constraint(equalToConstant: 200)
            
        ])
    }
}
