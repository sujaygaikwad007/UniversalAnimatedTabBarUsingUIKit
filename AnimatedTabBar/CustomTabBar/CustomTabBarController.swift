import UIKit

class CustomTabBarController: UIView {
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var homeView : UIView!
    @IBOutlet weak var homeImage : UIImageView!
    
    @IBOutlet weak var settingView : UIView!
    @IBOutlet weak var settingImage : UIImageView!
    
    @IBOutlet weak var userView : UIView!
    @IBOutlet weak var userImage : UIImageView!
    
    @IBOutlet weak var saveView : UIView!
    @IBOutlet weak var saveImage : UIImageView!
    
    
    
    var contentView:UIView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
        
        
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CustomTabBarController", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
  
    }
    
    func addTapGesture(to view:UIView ,target:Any?,action:Selector){
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
        
    }
    
    
    
    
}
