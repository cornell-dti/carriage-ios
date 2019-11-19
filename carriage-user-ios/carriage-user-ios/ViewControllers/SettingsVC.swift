//
//  UserInputForm.swift
//  Carriage
//
//

import UIKit
import SnapKit

class SettingsVC: UIViewController {
    
    //Background colors and boxes
    var whiteBox1: UILabel!
    var whiteBox2: UILabel!
    var whiteBox3: UILabel!
    var whiteBox4: UILabel!
    
    //Elements under "Settings"
    var yourProfileLabel: UILabel!
    var nameLabel: UILabel!
    var phoneNumberLabel: UILabel!
    var cornellMailLabel: UILabel!
    var defaultProfileImage: UIImageView!
    var profileRightChevronButton: UIButton!
    
    //Elements under "Locations"
    var locationsLabel: UILabel!
    var lineBreak1: UILabel!
    
    var addHomeLabel: UILabel!
    var emailIcon: UIImageView!
    var homeRightChevronButton: UIButton!
    
    var addFavoritesLabel: UILabel!
    var phoneIcon: UIImageView!
    var favRightChevronButton: UIButton!
    
    //Elements under "Privacy"
    var privacyLabel: UILabel!
    var chooseDataLabel: UILabel!
    var privacyRightChevronButton: UIButton!
    var legalLabel: UILabel!
    var termsOfServiceLabel: UILabel!
    var legalRightChevronButton: UIButton!
    
    var signOutButton: UIButton!
    
    var newUser: ProfileModel!
    
    let backgroundGray: UIColor = UIColor(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 0.9)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barTintColor =  backgroundGray
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Schedule", style: .done, target: self, action: #selector(returnToSchedule))
        self.view.backgroundColor = backgroundGray
        
        createBackground()
        createProfileSection()
        createLocationSection()
        createPrivacySection()
        
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
        yourProfileLabel.text = "Settings"
        yourProfileLabel.textColor = .black
        yourProfileLabel.font = UIFont(name: "SFProDisplay-Bold", size: 34)
        self.view.addSubview(yourProfileLabel)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Aiden Kim" //TODO: make name from user
        nameLabel.textColor = .black
        nameLabel.font = UIFont(name: "SFProDisplay-Bold", size: 22)
        nameLabel.textAlignment = .left
        self.view.addSubview(nameLabel)
        
        phoneNumberLabel = UILabel()
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.text = "+1 657-500-1311" //TODO: make num from user
        phoneNumberLabel.textColor = UIColor(red: 0.51764, green: 0.51764, blue: 0.51764, alpha: 1.0)
        phoneNumberLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        phoneNumberLabel.textAlignment = .left
        self.view.addSubview(phoneNumberLabel)
        
        cornellMailLabel = UILabel()
        cornellMailLabel.translatesAutoresizingMaskIntoConstraints = false
        cornellMailLabel.text = "yk568@cornell.edu" //TODO: make email from user
        cornellMailLabel.textColor = UIColor(red: 0.51764, green: 0.51764, blue: 0.51764, alpha: 1.0)
        cornellMailLabel.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        cornellMailLabel.textAlignment = .left
        self.view.addSubview(cornellMailLabel)
        
        defaultProfileImage = UIImageView()
        defaultProfileImage.translatesAutoresizingMaskIntoConstraints = false
        defaultProfileImage.image = UIImage(named: "default-user")
        defaultProfileImage.backgroundColor = UIColor(red: 0.803921, green: 0.803921, blue: 0.82353, alpha: 1.0)
        defaultProfileImage.layer.cornerRadius = 50
        defaultProfileImage.contentMode = .scaleAspectFit
        defaultProfileImage.clipsToBounds = true
        self.view.addSubview(defaultProfileImage)
        
        profileRightChevronButton = UIButton()
        profileRightChevronButton.translatesAutoresizingMaskIntoConstraints = false
        profileRightChevronButton.setImage(UIImage(named: "chevron-right"), for: .normal)
        self.view.addSubview(profileRightChevronButton)
        
    }
    
    func createLocationSection() {
        
        locationsLabel = UILabel()
        locationsLabel.translatesAutoresizingMaskIntoConstraints = false
        locationsLabel.text = "Locations"
        locationsLabel.textColor = .black
        locationsLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        self.view.addSubview(locationsLabel)
        
        addHomeLabel = UILabel()
        addHomeLabel.translatesAutoresizingMaskIntoConstraints = false
        addHomeLabel.text = "Add Home"
        addHomeLabel.textColor = UIColor(red: 0.2902, green: 0.2902, blue: 0.2902, alpha: 1.0)
        addHomeLabel.font = UIFont(name: "SFProText-Regular", size: 17)
        self.view.addSubview(addHomeLabel)
        
        emailIcon = UIImageView()
        emailIcon.translatesAutoresizingMaskIntoConstraints = false
        emailIcon.image = UIImage(named: "mail")
        emailIcon.contentMode = .scaleAspectFill
        self.view.addSubview(emailIcon)
        
        homeRightChevronButton = UIButton()
        homeRightChevronButton.translatesAutoresizingMaskIntoConstraints = false
        homeRightChevronButton.setImage(UIImage(named: "chevron-right"), for: .normal)
        self.view.addSubview(homeRightChevronButton)
        
        lineBreak1 = UILabel()
        lineBreak1.translatesAutoresizingMaskIntoConstraints = false
        lineBreak1.backgroundColor = backgroundGray
        self.view.addSubview(lineBreak1)
        
        addFavoritesLabel = UILabel()
        addFavoritesLabel.translatesAutoresizingMaskIntoConstraints = false
        addFavoritesLabel.text = "Add Favorites" //TODO: make phone from user
        addFavoritesLabel.textColor = UIColor(red: 0.2902, green: 0.2902, blue: 0.2902, alpha: 1.0)
        addFavoritesLabel.font = UIFont(name: "SFProText-Regular", size: 17)
        self.view.addSubview(addFavoritesLabel)
        
        phoneIcon = UIImageView()
        phoneIcon.translatesAutoresizingMaskIntoConstraints = false
        phoneIcon.image = UIImage(named: "phone")
        phoneIcon.contentMode = .scaleAspectFill
        self.view.addSubview(phoneIcon)
        
        favRightChevronButton = UIButton()
        favRightChevronButton.translatesAutoresizingMaskIntoConstraints = false
        favRightChevronButton.setImage(UIImage(named: "chevron-right"), for: .normal)
        self.view.addSubview(favRightChevronButton)
    }
    
    func createPrivacySection() {
        
        privacyLabel = UILabel()
        privacyLabel.translatesAutoresizingMaskIntoConstraints = false
        privacyLabel.text = "Privacy"
        privacyLabel.textColor = .black
        privacyLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        self.view.addSubview(privacyLabel)
        
        chooseDataLabel = UILabel()
        chooseDataLabel.translatesAutoresizingMaskIntoConstraints = false
        chooseDataLabel.text = "Choose what data you share with us."
        chooseDataLabel.textColor = UIColor(red: 0.2902, green: 0.2902, blue: 0.2902, alpha: 1.0)
        chooseDataLabel.font = UIFont(name: "SFProText-Regular", size: 17)
        self.view.addSubview(chooseDataLabel)
        
        privacyRightChevronButton = UIButton()
        privacyRightChevronButton.translatesAutoresizingMaskIntoConstraints = false
        privacyRightChevronButton.setImage(UIImage(named: "chevron-right"), for: .normal)
        self.view.addSubview(privacyRightChevronButton)
        
        legalLabel = UILabel()
        legalLabel.translatesAutoresizingMaskIntoConstraints = false
        legalLabel.text = "Legal"
        legalLabel.textColor = .black
        legalLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 20)
        self.view.addSubview(legalLabel)
        
        termsOfServiceLabel = UILabel()
        termsOfServiceLabel.translatesAutoresizingMaskIntoConstraints = false
        termsOfServiceLabel.text = "Terms of service & Privacy Policy"
        termsOfServiceLabel.textColor = UIColor(red: 0.2902, green: 0.2902, blue: 0.2902, alpha: 1.0)
        termsOfServiceLabel.font = UIFont(name: "SFProText-Regular", size: 16)
        self.view.addSubview(termsOfServiceLabel)
        
        legalRightChevronButton = UIButton()
        legalRightChevronButton.translatesAutoresizingMaskIntoConstraints = false
        legalRightChevronButton.setImage(UIImage(named: "chevron-right"), for: .normal)
        self.view.addSubview(legalRightChevronButton)
        
        signOutButton = UIButton()
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        signOutButton.setTitle("Sign Out", for: .normal)
        //TODO: set proper font for sign out button
//        signOutButton.titleLabel?.font = UIFont(name: "SFProText-Bold", size: 16)
        signOutButton.setTitleColor(.black, for: .normal)
        self.view.addSubview(signOutButton)
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
            make.leading.equalTo(defaultProfileImage).offset(112)
            make.top.equalTo(whiteBox1).offset(51)
            make.height.equalTo(26)
            make.width.equalTo(102)
        }
        
        phoneNumberLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(nameLabel).offset(28)
            make.height.equalTo(16)
            make.width.equalTo(150)
        }
        
        cornellMailLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(phoneNumberLabel).offset(23)
            make.height.equalTo(16)
            make.width.equalTo(150)
        }
        
        defaultProfileImage.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(16)
            make.top.equalTo(whiteBox1).offset(24)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        profileRightChevronButton.snp.makeConstraints { (make) -> Void in
            make.trailing.equalTo(-24)
            make.top.equalTo(whiteBox1).offset(57)
            make.height.equalTo(25)
            make.width.equalTo(24)
        }
        
        locationsLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(16)
            make.top.equalTo(whiteBox2).offset(24)
            make.height.equalTo(24)
            make.width.equalTo(113)
        }
        
        addHomeLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(56)
            make.top.equalTo(locationsLabel).offset(43)
            make.height.equalTo(19)
            make.width.equalTo(150)
        }
        
        emailIcon.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(17)
            make.top.equalTo(addHomeLabel)
            make.height.equalTo(25)
            make.width.equalTo(24)
        }
        
        homeRightChevronButton.snp.makeConstraints { (make) -> Void in
            make.trailing.equalTo(-24)
            make.top.equalTo(addHomeLabel)
            make.height.equalTo(25)
            make.width.equalTo(24)
        }
        
        lineBreak1.snp.makeConstraints{ (make) -> Void in
            make.leading.equalTo(56)
            make.trailing.equalTo(-16)
            make.height.equalTo(5)
            make.top.equalTo(addHomeLabel.snp_bottomMargin).offset(18)
        }
        
        addFavoritesLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(56)
            make.top.equalTo(addHomeLabel).offset(55)
            make.height.equalTo(19)
            make.width.equalTo(135)
        }
        
        phoneIcon.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(17)
            make.top.equalTo(addFavoritesLabel)
            make.height.equalTo(25)
            make.width.equalTo(24)
        }
        
        favRightChevronButton.snp.makeConstraints { (make) -> Void in
            make.trailing.equalTo(-24)
            make.top.equalTo(addFavoritesLabel)
            make.height.equalTo(25)
            make.width.equalTo(24)
        }
        
        privacyLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(16)
            make.top.equalTo(whiteBox3).offset(24)
            make.height.equalTo(24)
            make.width.equalTo(116)
        }
        
        chooseDataLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(privacyLabel)
            make.top.equalTo(privacyLabel).offset(32)
            make.height.equalTo(19)
            make.trailing.equalTo(view)
        }
        
        privacyRightChevronButton.snp.makeConstraints { (make) -> Void in
            make.trailing.equalTo(-24)
            make.top.equalTo(chooseDataLabel)
            make.height.equalTo(25)
            make.width.equalTo(24)
        }
        
        legalLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(16)
            make.top.equalTo(chooseDataLabel).offset(36)
            make.height.equalTo(24)
            make.width.equalTo(116)
        }
        
        termsOfServiceLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(legalLabel)
            make.top.equalTo(legalLabel).offset(32)
            make.height.equalTo(19)
            make.trailing.equalTo(view)
        }
        
        legalRightChevronButton.snp.makeConstraints { (make) -> Void in
            make.trailing.equalTo(-24)
            make.top.equalTo(termsOfServiceLabel)
            make.height.equalTo(25)
            make.width.equalTo(24)
        }
        
        signOutButton.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.top.equalTo(whiteBox4).offset(24)
            make.height.equalTo(20)
            make.width.equalTo(70)
        }
        
    }
    
    @objc func returnToSchedule() {
        //TODO
    }
    
}
