import UIKit

class ICTabBarController: UITabBarController {

    var stTabbar: STTabbar?
    
    var tabbarHidden: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hidesBottomBarWhenPushed = true
        if let myTabbar = tabBar as? STTabbar {
            myTabbar.centerButtonActionHandler = {
                print("Center Button Tapped")
                self.selectedIndex = 2
                self.hideTabBar()
            }
            stTabbar = myTabbar
        }
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        debugPrint(item.tag)
    }
    
    func hideTabBar() {
        guard !tabbarHidden else {return}
        var frame = tabBar.frame
        frame.origin.y = frame.origin.y + frame.size.height
        UIView.animate(withDuration: 0.5, delay: 0.2) {
            self.stTabbar?.frame = frame
            self.stTabbar?.layoutIfNeeded()
        } completion: { (_) in
            debugPrint("now hidden")
            self.tabbarHidden = true
        }
    }

    func showTabBar() {
        guard tabbarHidden else {return}
        var frame = tabBar.frame
        frame.origin.y = frame.origin.y - frame.size.height
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseInOut) {
            self.stTabbar?.frame = frame
        } completion: { (_) in
            debugPrint("now show")
            self.tabbarHidden = false
        }
    }
}

