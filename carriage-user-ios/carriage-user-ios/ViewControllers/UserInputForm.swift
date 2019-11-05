//
//  UserInputForm.swift
//  Carriage
//
//

import UIKit
import SnapKit

class UserInputForm: UIViewController {
    
    //Background colors and boxes
    var whiteBox1: UILabel!
    var whiteBox2: UILabel!
    var whiteBox3: UILabel!
    var whiteBox4: UILabel!
    
    //Elements under "Your Profile"
    var yourProfileLabel: UILabel!
    var nameLabel: UILabel!
    var joinedLabel: UILabel!
    
    //Elements under "Account Info"
    var accountInfoLabel: UILabel!
    var emailLabel: UILabel!
    var phoneLabel: UILabel!
    
    //Elements under "Personal Info"
    var personalInfoLabel: UILabel!
    var pronounsLabel: UILabel!
    var accessLabel: UILabel!
    
    var newUser: UserInputModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor =  UIColor(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 0.9)
        self.view.backgroundColor = UIColor(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 0.9)
    
        createBackground()
        createProfileSection()
        createAccountInfoSection()
        createPersonalInfoSection()
        
        setUpConstraints()
        
    }
    
    func createBackground() {
        
        whiteBox1 = UILabel()
        whiteBox1.translatesAutoresizingMaskIntoConstraints = false
        whiteBox1.backgroundColor = .white
        self.view.addSubview(whiteBox1)
        
        whiteBox2 = UILabel()
        whiteBox2.translatesAutoresizingMaskIntoConstraints = false
        whiteBox2.backgroundColor = .white
        self.view.addSubview(whiteBox2)
        
        whiteBox3 = UILabel()
        whiteBox3.translatesAutoresizingMaskIntoConstraints = false
        whiteBox3.backgroundColor = .white
        self.view.addSubview(whiteBox3)
        
        whiteBox4 = UILabel()
        whiteBox4.translatesAutoresizingMaskIntoConstraints = false
        whiteBox4.backgroundColor = .white
        self.view.addSubview(whiteBox4)
        
    }
    
    func createProfileSection() {
        
        yourProfileLabel = UILabel()
        yourProfileLabel.translatesAutoresizingMaskIntoConstraints = false
        yourProfileLabel.text = "Your Profile"
        yourProfileLabel.textColor = .black
        yourProfileLabel.font = UIFont(name: "SFProDisplay-Bold", size: 34)
        self.view.addSubview(yourProfileLabel)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Aiden Kim" //TODO: make name from user
        nameLabel.textColor = .black
        nameLabel.font = UIFont(name: "SFProDisplay-Bold", size: 22)
        self.view.addSubview(nameLabel)
        
        joinedLabel = UILabel()
        joinedLabel.translatesAutoresizingMaskIntoConstraints = false
        joinedLabel.text = "Joined 06/2019" //TODO: make date from user
        joinedLabel.textColor = UIColor(red: 0.60784, green: 0.60784, blue: 0.60784, alpha: 1.0)
        joinedLabel.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        self.view.addSubview(joinedLabel)
    }
    
    func createAccountInfoSection() {
        
        accountInfoLabel = UILabel()
        accountInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        accountInfoLabel.text = "Account Info"
        accountInfoLabel.textColor = .black
        accountInfoLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        self.view.addSubview(accountInfoLabel)
        
        emailLabel = UILabel()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "yk568@cornell.edu" //TODO: make phone from user
        emailLabel.textColor = UIColor(red: 0.2902, green: 0.2902, blue: 0.2902, alpha: 1.0)
        emailLabel.font = UIFont(name: "SFProText-Regular", size: 16)
        self.view.addSubview(emailLabel)
        
        phoneLabel = UILabel()
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.text = "+1 657-500-1311" //TODO: make phone from user
        phoneLabel.textColor = UIColor(red: 0.2902, green: 0.2902, blue: 0.2902, alpha: 1.0)
        phoneLabel.font = UIFont(name: "SFProText-Regular", size: 16)
        self.view.addSubview(phoneLabel)
    }
    
    func createPersonalInfoSection() {
        
        personalInfoLabel = UILabel()
        personalInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        personalInfoLabel.text = "Personal Info"
        personalInfoLabel.textColor = .black
        personalInfoLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        self.view.addSubview(personalInfoLabel)
        
        pronounsLabel = UILabel()
        pronounsLabel.translatesAutoresizingMaskIntoConstraints = false
        pronounsLabel.text = "He/Him/His" //TODO: make pronouns from user
        pronounsLabel.textColor = UIColor(red: 0.2902, green: 0.2902, blue: 0.2902, alpha: 1.0)
        pronounsLabel.font = UIFont(name: "SFProText-Regular", size: 16)
        self.view.addSubview(pronounsLabel)
        
        accessLabel = UILabel()
        accessLabel.translatesAutoresizingMaskIntoConstraints = false
        accessLabel.text = "Accessibility"
        accessLabel.textColor = UIColor(red: 0.2902, green: 0.2902, blue: 0.2902, alpha: 1.0)
        accessLabel.font = UIFont(name: "SFProText-Regular", size: 16)
        self.view.addSubview(accessLabel)
    }
    
    func setUpConstraints() {
        
        whiteBox1.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(153)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.top.equalTo(140)
            make.centerX.equalTo(self.view)
        }
        
        whiteBox2.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(160)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.top.equalTo(299)
            make.centerX.equalTo(self.view)
        }
        
        whiteBox3.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(161)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.top.equalTo(465)
            make.centerX.equalTo(self.view)
        }
        
        whiteBox4.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(UIScreen.main.bounds.maxY)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.top.equalTo(632)
            make.centerX.equalTo(self.view)
        }
        
        yourProfileLabel.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(41)
            make.leading.equalTo(16)
            make.width.equalTo(182)
            make.top.equalTo(91)
        }
        
        nameLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view)
            make.top.equalTo(whiteBox1).offset(51)
            make.height.equalTo(26)
            make.width.equalTo(102)
        }
        
        joinedLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view)
            make.top.equalTo(nameLabel).offset(30)
            make.height.equalTo(16)
            make.width.equalTo(104)
        }
        
        accountInfoLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(16)
            make.top.equalTo(whiteBox2).offset(24)
            make.height.equalTo(24)
            make.width.equalTo(113)
        }
        
        emailLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(56)
            make.top.equalTo(accountInfoLabel).offset(43)
            make.height.equalTo(19)
            make.width.equalTo(150)
        }
        
        phoneLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(56)
            make.top.equalTo(emailLabel).offset(56)
            make.height.equalTo(19)
            make.width.equalTo(150)
        }
        
        personalInfoLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(16)
            make.top.equalTo(whiteBox3).offset(24)
            make.height.equalTo(24)
            make.width.equalTo(116)
        }
        
        pronounsLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(56)
            make.top.equalTo(personalInfoLabel).offset(43)
            make.height.equalTo(19)
            make.width.equalTo(150)
        }
        
        accessLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(56)
            make.top.equalTo(pronounsLabel).offset(56)
            make.height.equalTo(19)
            make.width.equalTo(150)
        }
        
    }
    
}
