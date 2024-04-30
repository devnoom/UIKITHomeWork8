//
//  CountryTableViewCell.swift
//  UIKITHomeWork8
//
//  Created by MacBook Air on 21.04.24.
//

import UIKit


class CountryTableViewCell: UITableViewCell {
    // MARK: - Properties
    static let identifier = "CountryTableViewCell"
  
    let countryTitle = UILabel()
    let countryFlag = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
              super.layoutSubviews()
              contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
          }
    
    // MARK: - UI Setup
    func setCellUI() {
        addSubview(countryTitle)
        addSubview(countryFlag)
        
        self.contentView.layer.borderWidth = 2
        self.contentView.layer.borderColor = UIColor.gray.cgColor
        self.contentView.layer.cornerRadius = 20
        self.contentView.layer.masksToBounds = true
        countryFlag.clipsToBounds = true
        countryFlag.layer.cornerRadius = 5
        
        countryFlag.translatesAutoresizingMaskIntoConstraints = false
        countryTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            countryFlag.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            countryFlag.centerYAnchor.constraint(equalTo: centerYAnchor),
            countryFlag.widthAnchor.constraint(equalToConstant: 25),
            countryFlag.heightAnchor.constraint(equalToConstant: 25),
    
            countryTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
            countryTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    // MARK: - Reload Data
    func updateCell(with item: CountryTableViewCellViewModel) {
        countryTitle.text = item.countryName
        countryFlag.fetchImage(url: item.flagUrl!)
    }
    
}
