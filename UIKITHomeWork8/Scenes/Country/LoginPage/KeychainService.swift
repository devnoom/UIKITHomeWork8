import Foundation

class KeychainService {
    
    enum KeyChainError: Error {
        case sameItemFound
        case unknown
        case nosuchDataFound
        case KCErrorWithCode(Int)
    }
    
    static let shared = KeychainService()
    
    private init() {}
    
    func save(username: String, password: String) {
        do {
            try save(
                service: "your_service_identifier", // Change this to your service identifier
                account: username,
                password: password.data(using: .utf8) ?? Data()
            )
        } catch {
            print(error)
        }
    }
    
    func getPassword(username: String) -> String? {
        guard let data = get(service: "your_service_identifier", account: username) else {
            return nil
        }
        return String(decoding: data, as: UTF8.self)
    }
    
    private func save(
        service: String,
        account: String,
        password: Data
    ) throws {
        let query: [String: AnyObject] = [
            kSecClass as String         : kSecClassGenericPassword,
            kSecAttrService as String   : service as AnyObject,
            kSecAttrAccount as String   : account as AnyObject,
            kSecValueData as String     : password as AnyObject,
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status != errSecDuplicateItem else {
            throw KeyChainError.sameItemFound
        }
        
        guard status == errSecSuccess else {
            throw KeyChainError.unknown
        }
        
        print("saved")
    }
    
    private func get(
        service: String,
        account: String
    ) -> Data? {
        let query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecReturnData as String: kCFBooleanTrue as AnyObject,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        print("read status \(status)")
        return result as? Data
    }
}
