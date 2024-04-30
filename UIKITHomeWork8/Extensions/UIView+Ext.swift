//
//  UIView+Ext.swift
//  UIKITHomeWork8
//
//  Created by MacBook Air on 21.04.24.
//

import UIKit


extension UIView {
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints                              = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive            = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive    = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive  = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive      = true
    }
}

extension UIImageView {
    func fetchImage(url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, _ , _ in
            guard let data = data, let image = UIImage(data: data)
            else {return}
            DispatchQueue.main.async {
                self?.image = image
            }
        }.resume()
    }
}



