import Foundation

import Foundation

protocol LoginPageViewModelDelegate: AnyObject {
    func didSaveImage(success: Bool, errorMessage: String?)
}

class LoginPageViewModel {
    var delegate: LoginPageViewModelDelegate?
    
    
    private let keychainService = KeychainService.shared
    
    func saveCredentials(username: String, password: String) {
        keychainService.save(username: username, password: password)
    }
    
    func validateLogin(username: String, password: String) -> Bool {
        return keychainService.getPassword(username: username) == password
    }
    
    
    
    func getDocumentsDirectory() -> URL {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return paths[0]
        }
    
    func saveImageData(_ imageData: Data, with filename: String) {
            let filePath = getDocumentsDirectory().appendingPathComponent(filename)
            
            do {
                try imageData.write(to: filePath)
                print("Image saved at: \(filePath)")
                delegate?.didSaveImage(success: true, errorMessage: nil)
            } catch {
                print("Error saving image: \(error)")
                delegate?.didSaveImage(success: false, errorMessage: "Failed to save image to documents directory.")
            }
        }
}

