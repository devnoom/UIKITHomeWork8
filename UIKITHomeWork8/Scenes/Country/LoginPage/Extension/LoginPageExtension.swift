//
//  LoginPageExtension.swift
//  UIKITHomeWork8
//
//  Created by MacBook Air on 30.04.24.
//

import UIKit

extension LoginPageViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            imageView.image = pickedImage
            if let imageData = pickedImage.pngData() {
                viewModel.saveImageData(imageData, with: "gallery_image.png")
                        } else {
                           print("ერორი")
                        }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
