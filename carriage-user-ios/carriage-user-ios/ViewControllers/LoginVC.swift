//
//  LoginVC.swift
//  carriage-user-ios
//
//

import UIKit
import SnapKit
import GoogleSignIn

class LoginVC: UIViewController {
    
    var newUser: ProfileModel!
    var googleSignInButton: GIDSignInButton!
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    let backgroundGray: UIColor = UIColor(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 0.9)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = backgroundGray
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        // Automatically restore the previous Google user session
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
        googleSignInButton = GIDSignInButton()
        googleSignInButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(googleSignInButton)
        
        setUpConstraints()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didSignIn), name: NSNotification.Name("SuccessfulSignInNotification"), object: nil)
        
    }
    
    @objc func didSignIn()  {
        newUser = delegate.googleUser
        navigationController?.pushViewController(UserInputForm(user: newUser), animated: true)
    }
    
    func setUpConstraints() {
        googleSignInButton.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view)
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.centerY.equalTo(self.view)
        }
    }

}
