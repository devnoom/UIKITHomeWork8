import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        let rootViewController = determineRootViewController()
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
    func determineRootViewController() -> UIViewController {
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "Key")
        if isUserLoggedIn {
            return CountryMainPageController()
        } else {
            let loginViewController = LoginPageViewController()
            let navigationController = UINavigationController(rootViewController: loginViewController)
            return navigationController
        }
    }
}
