import UIKit

class CustomFileManager {
    
    let imageUrl = URL(string: "https://picsum.photos/200/300")
    let manager = FileManager.default
    var documentsDirectoryPath = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first
    
    func saveImageInfo(_ info: String) {
       
    }
}
