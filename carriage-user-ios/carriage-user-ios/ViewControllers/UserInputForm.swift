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
    var profileImage: UIImageView!
    
    var changeProfileImageButton: UIButton!
    var changeNameButton: UIButton!
    
    //Elements under "Account Info"
    var accountInfoLabel: UILabel!
    var lineBreak1: UILabel!
    
    var emailLabel: UILabel!
    var emailIcon: UIImageView!
    var emailRightChevronButton: UIButton!
    var emailVerifiedLabel: UILabel!
    
    var phoneLabel: UILabel!
    var phoneIcon: UIImageView!
    var phoneRightChevronButton: UIButton!
    var phoneVerifiedLabel: UILabel!
    
    //Elements under "Personal Info"
    var personalInfoLabel: UILabel!
    
    var pronounsLabel: UILabel!
    var pronounsIcon: UIImageView!
    var pronounsRightChevronButton: UIButton!
    
    var accessLabel: UILabel!
    var accessIcon: UIImageView!
    var accessRightChevronButton: UIButton!
    
    var user: ProfileModel!
    
    init(user: ProfileModel) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // COLORS
    let backgroundGray: UIColor = UIColor(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 0.9)
    let lightTextGray: UIColor = UIColor(red: 0.2902, green: 0.2902, blue: 0.2902, alpha: 1.0)
    let verifiedGreen: UIColor = UIColor(red: 0.29804, green: 0.68627, blue: 0.31372, alpha: 1.0)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barTintColor =  backgroundGray
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< Schedule", style: .done, target: self, action: #selector(returnToSchedule))
        self.view.backgroundColor = backgroundGray
    
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
        nameLabel.textColor = .black
        nameLabel.text = user.userName
        nameLabel.font = UIFont(name: "SFProDisplay-Bold", size: 22)
        self.view.addSubview(nameLabel)
        
        joinedLabel = UILabel()
        joinedLabel.translatesAutoresizingMaskIntoConstraints = false
        joinedLabel.text = "Joined 06/2019" //TODO: make date from user
        joinedLabel.textColor = UIColor(red: 0.60784, green: 0.60784, blue: 0.60784, alpha: 1.0)
        joinedLabel.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        self.view.addSubview(joinedLabel)
        
        profileImage = UIImageView()
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.layer.cornerRadius = 50
        profileImage.contentMode = .scaleToFill
        
        let url = user.photoURL
        if let data = try? Data(contentsOf: url) {
            let image: UIImage = UIImage(data: data)!
            profileImage.image = image
        } else {
            profileImage.image = UIImage(named: "stockphoto")
        }
        
        self.view.addSubview(profileImage)
        
        changeProfileImageButton = UIButton()
        changeProfileImageButton.translatesAutoresizingMaskIntoConstraints = false
        changeProfileImageButton.backgroundColor = .black
        changeProfileImageButton.layer.cornerRadius = 20
        changeProfileImageButton.setImage(UIImage(named: "pencil"), for: .normal) //TODO: fix this image
        changeProfileImageButton.imageView?.contentMode = .scaleToFill
        changeProfileImageButton.imageView?.layer.cornerRadius = 20
        self.view.addSubview(changeProfileImageButton)
        
        changeNameButton = UIButton()
        changeNameButton.translatesAutoresizingMaskIntoConstraints = false
        changeNameButton.setImage(UIImage(named: "pencilonpaper"), for: .normal) //TODO: fix this image
        changeNameButton.imageView?.contentMode = .scaleToFill
        self.view.addSubview(changeNameButton)
        
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
        emailLabel.text = user.email
        emailLabel.textColor = lightTextGray
        emailLabel.font = UIFont(name: "SFProText-Regular", size: 16)
        self.view.addSubview(emailLabel)
        
        emailIcon = UIImageView()
        emailIcon.translatesAutoresizingMaskIntoConstraints = false
        emailIcon.image = UIImage(named: "mail")
        emailIcon.contentMode = .scaleAspectFill
        self.view.addSubview(emailIcon)
        
        emailRightChevronButton = UIButton()
        emailRightChevronButton.translatesAutoresizingMaskIntoConstraints = false
        emailRightChevronButton.setImage(UIImage(named: "chevron-right"), for: .normal)
        self.view.addSubview(emailRightChevronButton)
        
        emailVerifiedLabel = UILabel()
        emailVerifiedLabel.translatesAutoresizingMaskIntoConstraints = false
        emailVerifiedLabel.text = "verified" //TODO: make only appear if verified
        emailVerifiedLabel.textColor = verifiedGreen
        emailVerifiedLabel.font = UIFont(name: "SFProText-Regular", size: 14)
        self.view.addSubview(emailVerifiedLabel)
        
        lineBreak1 = UILabel()
        lineBreak1.translatesAutoresizingMaskIntoConstraints = false
        lineBreak1.backgroundColor = backgroundGray
        self.view.addSubview(lineBreak1)
        
        phoneLabel = UILabel()
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.text = "+1 657-500-1311" //TODO: make phone from user
        phoneLabel.textColor = lightTextGray
        phoneLabel.font = UIFont(name: "SFProText-Regular", size: 16)
        self.view.addSubview(phoneLabel)
        
        phoneIcon = UIImageView()
        phoneIcon.translatesAutoresizingMaskIntoConstraints = false
        phoneIcon.image = UIImage(named: "phone")
        phoneIcon.contentMode = .scaleAspectFill
        self.view.addSubview(phoneIcon)
        
        phoneRightChevronButton = UIButton()
        phoneRightChevronButton.translatesAutoresizingMaskIntoConstraints = false
        phoneRightChevronButton.setImage(UIImage(named: "chevron-right"), for: .normal)
        self.view.addSubview(phoneRightChevronButton)
        
        phoneVerifiedLabel = UILabel()
        phoneVerifiedLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneVerifiedLabel.text = "verified" //TODO: make only appear if verified
        phoneVerifiedLabel.textColor = verifiedGreen
        phoneVerifiedLabel.font = UIFont(name: "SFProText-Regular", size: 14)
        self.view.addSubview(phoneVerifiedLabel)
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
        pronounsLabel.textColor = lightTextGray
        pronounsLabel.font = UIFont(name: "SFProText-Regular", size: 16)
        self.view.addSubview(pronounsLabel)
        
        pronounsIcon = UIImageView()
        pronounsIcon.translatesAutoresizingMaskIntoConstraints = false
        pronounsIcon.contentMode = .scaleToFill
        pronounsIcon.image = UIImage(named: "user")
        self.view.addSubview(pronounsIcon)
        
        pronounsRightChevronButton = UIButton()
        pronounsRightChevronButton.translatesAutoresizingMaskIntoConstraints = false
        pronounsRightChevronButton.setImage(UIImage(named: "chevron-right"), for: .normal)
        self.view.addSubview(pronounsRightChevronButton)
        
        accessLabel = UILabel()
        accessLabel.translatesAutoresizingMaskIntoConstraints = false
        accessLabel.text = "Accessibility"
        accessLabel.textColor = lightTextGray
        accessLabel.font = UIFont(name: "SFProText-Regular", size: 16)
        self.view.addSubview(accessLabel)
        
        accessIcon = UIImageView()
        accessIcon.translatesAutoresizingMaskIntoConstraints = false
        accessIcon.image = UIImage(named: "wheelchair")
        accessIcon.contentMode = .scaleAspectFill
        self.view.addSubview(accessIcon)
        
        accessRightChevronButton = UIButton()
        accessRightChevronButton.translatesAutoresizingMaskIntoConstraints = false
        accessRightChevronButton.setImage(UIImage(named: "chevron-right"), for: .normal)
        self.view.addSubview(accessRightChevronButton)
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
        
        joinedLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view)
            make.top.equalTo(nameLabel).offset(30)
            make.height.equalTo(16)
            make.width.equalTo(104)
        }
        
        profileImage.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(16)
            make.top.equalTo(whiteBox1).offset(24)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(joinedLabel)
            make.top.equalTo(whiteBox1).offset(51)
            make.height.equalTo(26)
            make.trailing.equalTo(self.view)
        }
        
        changeProfileImageButton.snp.makeConstraints { (make) -> Void in
            make.trailing.equalTo(profileImage)
            make.top.equalTo(profileImage).offset(66)
            make.height.equalTo(39)
            make.width.equalTo(39)
        }
        
        changeNameButton.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(nameLabel.snp_trailingMargin).offset(12)
            make.centerY.equalTo(nameLabel)
            make.height.equalTo(15)
            make.width.equalTo(15)
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
        
        emailIcon.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(17)
            make.top.equalTo(emailLabel)
            make.height.equalTo(25)
            make.width.equalTo(24)
        }
        
        emailRightChevronButton.snp.makeConstraints { (make) -> Void in
            make.trailing.equalTo(-24)
            make.top.equalTo(emailLabel)
            make.height.equalTo(25)
            make.width.equalTo(24)
        }
        
        emailVerifiedLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(emailLabel.snp_trailingMargin).offset(8)
            make.top.equalTo(emailLabel)
            make.height.equalTo(emailLabel)
            make.width.equalTo(51)
        }
        
        lineBreak1.snp.makeConstraints{ (make) -> Void in
            make.leading.equalTo(56)
            make.trailing.equalTo(-16)
            make.height.equalTo(5)
            make.top.equalTo(emailLabel.snp_bottomMargin).offset(18)
        }
        
        phoneLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(56)
            make.top.equalTo(emailLabel).offset(55)
            make.height.equalTo(19)
            make.width.equalTo(135)
        }
        
        phoneIcon.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(17)
            make.top.equalTo(phoneLabel)
            make.height.equalTo(25)
            make.width.equalTo(24)
        }
        
        phoneRightChevronButton.snp.makeConstraints { (make) -> Void in
            make.trailing.equalTo(-24)
            make.top.equalTo(phoneLabel)
            make.height.equalTo(25)
            make.width.equalTo(24)
        }
        
        phoneVerifiedLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(phoneLabel.snp_trailingMargin).offset(8)
            make.top.equalTo(phoneLabel)
            make.height.equalTo(phoneLabel)
            make.width.equalTo(51)
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
        
        pronounsIcon.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(19)
            make.top.equalTo(pronounsLabel)
            make.height.equalTo(25)
            make.width.equalTo(24)
        }
        
        pronounsRightChevronButton.snp.makeConstraints { (make) -> Void in
            make.trailing.equalTo(-24)
            make.top.equalTo(pronounsLabel)
            make.height.equalTo(25)
            make.width.equalTo(24)
        }
        
        accessLabel.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(56)
            make.top.equalTo(pronounsLabel).offset(55)
            make.height.equalTo(19)
            make.width.equalTo(150)
        }
        
        accessIcon.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(16)
            make.top.equalTo(accessLabel)
            make.height.equalTo(25)
            make.width.equalTo(24)
        }
        
        accessRightChevronButton.snp.makeConstraints { (make) -> Void in
            make.trailing.equalTo(-24)
            make.top.equalTo(accessLabel)
            make.height.equalTo(25)
            make.width.equalTo(24)
        }
        
    }
    
    @objc func returnToSchedule() {
        //TODO
    }
    
}
