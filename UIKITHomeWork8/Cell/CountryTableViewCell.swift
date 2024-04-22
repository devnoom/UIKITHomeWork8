//
//  CountryTableViewCell.swift
//  UIKITHomeWork8
//
//  Created by MacBook Air on 21.04.24.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    let flagForTableRow = UIImageView()
    let titleForTableRow = UILabel()
    
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
    
    func setCellUI() {
        addSubview(flagForTableRow)
        addSubview(titleForTableRow)
        
        self.contentView.layer.borderWidth = 2
        self.contentView.layer.borderColor = UIColor.gray.cgColor
        self.contentView.layer.cornerRadius = 20
        self.contentView.layer.masksToBounds = true
        flagForTableRow.clipsToBounds = true
        flagForTableRow.layer.cornerRadius = 5
        
        flagForTableRow.translatesAutoresizingMaskIntoConstraints = false
        titleForTableRow.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            flagForTableRow.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            flagForTableRow.centerYAnchor.constraint(equalTo: centerYAnchor),
            flagForTableRow.widthAnchor.constraint(equalToConstant: 25),
            flagForTableRow.heightAnchor.constraint(equalToConstant: 25),
    
            titleForTableRow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45),
            titleForTableRow.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
