import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customTabBarController: CustomTabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialTab()
        customTab()
    }
    
    @objc func homeViewClick() {
        activateTab(view: customTabBarController.homeView, imageView: customTabBarController.homeImage, selectedImage: UIImage(named: "homeAnimate"), bgColor: UIColor.white)
        print("HOME---")
    }
    
    @objc func settingViewClick() {
        activateTab(view: customTabBarController.settingView, imageView: customTabBarController.settingImage, selectedImage: UIImage(named: "settingAnimate"), bgColor: UIColor.white)
        print("Setting---")
    }
    
    @objc func userViewClick() {
        activateTab(view: customTabBarController.userView, imageView: customTabBarController.userImage, selectedImage: UIImage(named: "userAnimate"), bgColor: UIColor.white)
        print("User---")
    }
    
    @objc func saveViewClick() {
        activateTab(view: customTabBarController.saveView, imageView: customTabBarController.saveImage, selectedImage: UIImage(named: "saveAnimate"), bgColor: UIColor.white)
        print("Save----")
    }
}

extension ViewController {
    
    func customTab() {
        // Define an array of view and selector pairs
        let viewActions: [(UIView?, Selector)] = [
            (customTabBarController.homeView, #selector(homeViewClick)),
            (customTabBarController.settingView, #selector(settingViewClick)),
            (customTabBarController.userView, #selector(userViewClick)),
            (customTabBarController.saveView, #selector(saveViewClick))
        ]
        
        // Iterate through each pair and add the tap gesture
        for (view, action) in viewActions {
            if let validView = view {
                customTabBarController.addTapGesture(to: validView, target: self, action: action)
            }
        }
    }
    
    func activateTab(view: UIView?, imageView: UIImageView?, selectedImage: UIImage?, bgColor: UIColor) {
        guard let view = view, let imageView = imageView, let selectedImage = selectedImage else { return }
        
        // Animate changes
        UIView.animate(withDuration: 0.3) {
            // Reset other tabs' states
            self.resetOtherTabs()
            
            // Apply background color and corner radius
            view.backgroundColor = bgColor
            view.layer.cornerRadius = 30
            view.layer.masksToBounds = true
            
            // Change image with animation
            UIView.transition(with: imageView, duration: 0.3, options: .transitionCrossDissolve, animations: {
                imageView.image = selectedImage
            }, completion: nil)
        }
    }
    
    func resetOtherTabs() {
        // List of all tabs and their default images
        let tabs: [(UIView?, UIImageView?, String)] = [
            (customTabBarController.homeView, customTabBarController.homeImage, "home"),
            (customTabBarController.settingView, customTabBarController.settingImage, "settings"),
            (customTabBarController.userView, customTabBarController.userImage, "user"),
            (customTabBarController.saveView, customTabBarController.saveImage, "save")
        ]
        
        for (view, imageView, defaultImageName) in tabs {
            if let view = view, let imageView = imageView {
                UIView.transition(with: imageView, duration: 0.3, options: .transitionCrossDissolve, animations: {
                    imageView.image = UIImage(named: defaultImageName)
                }, completion: nil)
                
                view.backgroundColor = UIColor.clear
                view.layer.cornerRadius = 0
                view.layer.masksToBounds = false
            }
        }
    }

    
    func setupInitialTab() {
        // Activate the home tab on initial load
        activateTab(view: customTabBarController.homeView, imageView: customTabBarController.homeImage, selectedImage: UIImage(named: "homeAnimate"), bgColor: UIColor.white)
    }
}
