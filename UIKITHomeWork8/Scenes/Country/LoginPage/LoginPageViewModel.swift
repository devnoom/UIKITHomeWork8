import Foundation

import Foundation

class LoginPageViewModel {
    private let customFileManager = CustomFileManager() // Assuming CustomFileManager is your custom file manager class
    private let keychainService = KeychainService.shared
    
    // Function to save username and password to Keychain
    func saveCredentials(username: String, password: String) {
        keychainService.save(username: username, password: password)
    }
    
    // Function to check if the user is new
    func isNewUser() -> Bool {
        return keychainService.getPassword(username: "username") == nil
    }
    
    // Function to validate login credentials
    func validateLogin(username: String, password: String) -> Bool {
        return keychainService.getPassword(username: username) == password
    }
    
    // Function to save image information to CustomFileManager
    func saveImageInfo(_ info: String) {
        customFileManager.saveImageInfo(info)
    }
}

