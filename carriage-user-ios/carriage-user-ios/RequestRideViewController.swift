//
//  RequestRideViewController.swift
//  carriage-user-ios
//
// 
//

import UIKit

class RequestRideViewController: UIViewController {
    
    let scrollView = UIScrollView(frame: UIScreen.main.bounds)
    let requestRideTitleView = UIView()
    let requestRideTitleLabel = UILabel()
    let requestRideButton = UIButton()
    let requestRideButtonBackgroundView = UIView()
    let locationView = UIView()
    let locationTitleLabel = UILabel()
    let pickupView = UIView()
    let dropoffView = UIView()
    let dateAndTimeView = UIView()
    let dateAndTimeTitleLabel = UILabel()
    let dateView = UIView()
    let timeView = UIView()
    let accessibilityView = UIView()
    let accessibilityTitleLabel = UILabel()
    let wheelchairTitleLabel = UILabel()
    let wheelchairCheckBox = checkBox()
    let additionalNotesView = UIView()
    let additionalNotesTitle = UILabel()
    let additionalNotesTextField = UITextField()
    let pickupLabel = UILabel()
    let dropoffLabel = UILabel()
    let dateLabel = UILabel()
    let timeLabel = UILabel()
    let airplaneImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.view = UIView(frame: UIScreen.main.bounds)
        self.view.backgroundColor = .white
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        setUpScrollView()
        setUpConstraints()
        // Do any additional setup after loading the view.
    }
    func setUpConstraints(){
        self.view.addSubview(requestRideTitleView)
        requestRideTitleView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.width.equalTo(self.view.snp.width)
            make.height.equalTo(70)
        }
        requestRideTitleView.backgroundColor = UIColor.black
        
        requestRideTitleView.addSubview(requestRideTitleLabel)
        requestRideTitleLabel.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self.view.snp.left).offset(16)
            make.centerY.equalTo(requestRideTitleView.snp.centerY)
        }
        requestRideTitleLabel.textColor = .white
        requestRideTitleLabel.text = "Request Ride"
        requestRideTitleLabel.textAlignment = .center
        requestRideTitleLabel.font = UIFont(name: "SFProDisplay-Bold", size:UIFont.labelFontSize)
        requestRideTitleLabel.font = requestRideTitleLabel.font.withSize(34)
        requestRideTitleLabel.font = requestRideTitleLabel.font.bold()
        
        self.view.addSubview(requestRideButtonBackgroundView)
        requestRideButtonBackgroundView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.view.snp.bottom)
            make.right.equalTo(self.view.snp.right)
            make.left.equalTo(self.view.snp.left)
        make.height.equalTo(100)
        }
        requestRideButtonBackgroundView.backgroundColor = .white
        requestRideButtonBackgroundView.layer.borderColor = UIColor.lightGray.cgColor
        requestRideButtonBackgroundView.clipsToBounds = true
        requestRideButtonBackgroundView.layer.shadowOpacity = 0.7
        requestRideButtonBackgroundView.layer.shadowRadius = 10.0
        requestRideButtonBackgroundView.layer.masksToBounds = false
        requestRideButtonBackgroundView.layer.shadowOffset = CGSize.zero
        requestRideButtonBackgroundView.layer.shadowColor = UIColor.lightGray.cgColor
        
        
        requestRideButtonBackgroundView.addSubview(requestRideButton)
        requestRideButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(requestRideButtonBackgroundView.snp.top).offset(20)
            make.right.equalTo(requestRideButtonBackgroundView.snp.right).offset(-60)
            make.left.equalTo(requestRideButtonBackgroundView.snp.left).offset(60)
            make.height.equalTo(50)
               }
        requestRideButton.setTitle("Send Requst", for: .normal)
        requestRideButton.titleLabel?.font = UIFont(name: "SFProText-Bold", size: 17.0)
        requestRideButton.titleLabel?.font = requestRideButton.titleLabel?.font.bold()
        requestRideButton.backgroundColor = UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1.0)
        requestRideButton.titleLabel?.textColor = UIColor.white
        requestRideButton.layer.cornerRadius = 5
        
        self.scrollView.addSubview(locationView)
        locationView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(scrollView.snp.top).offset(20)
            make.left.equalTo(scrollView.snp.left).offset(16)
            make.right.equalTo(self.view.snp.right).offset(-16)
            make.height.equalTo(156)
        }
        locationView.backgroundColor = .white
        locationView.layer.borderColor = UIColor.lightGray.cgColor
        locationView.clipsToBounds = true
        locationView.layer.shadowOpacity = 0.7
        locationView.layer.shadowRadius = 5.0
        locationView.layer.masksToBounds = false
        locationView.layer.shadowOffset = CGSize.zero
        locationView.layer.shadowColor = UIColor.lightGray.cgColor
        
        self.locationView.addSubview(locationTitleLabel)
        locationTitleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(locationView).offset(16)
            make.left.equalTo(locationView.snp.left).offset(16)
            make.width.equalTo(80)
        }
        locationTitleLabel.text = "Location"
        locationTitleLabel.font = UIFont(name: "SFProText-Bold", size:UIFont.labelFontSize)
        locationTitleLabel.font = locationTitleLabel.font.withSize(17)
        locationTitleLabel.font = locationTitleLabel.font.bold()
        
        self.locationView.addSubview(pickupView)
               pickupView.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(locationTitleLabel.snp.bottom).offset(16)
                   make.left.equalTo(locationView.snp.left).offset(16)
                   make.right.equalTo(locationView.snp.right).offset(-30)
                   make.height.equalTo(40)
               }
        pickupView.layer.backgroundColor = UIColor.white.cgColor
        pickupView.layer.borderWidth = 1.0
        pickupView.layer.borderColor = UIColor.lightGray.cgColor
        
        self.pickupView.addSubview(pickupLabel)
        pickupLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(pickupView.snp.centerY)
            make.left.equalTo(pickupView.snp.left).offset(16)
        }
       pickupLabel.text = "Pickup*"
       pickupLabel.textColor = UIColor.lightGray
       pickupLabel.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
       pickupLabel.font = pickupLabel.font.withSize(14)
        
        self.locationView.addSubview(dropoffView)
               dropoffView.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(pickupView.snp.bottom).offset(8)
                   make.left.equalTo(locationView.snp.left).offset(16)
                   make.right.equalTo(locationView.snp.right).offset(-30)
                   make.height.equalTo(40)
               }
        dropoffView.layer.backgroundColor = UIColor.white.cgColor
        dropoffView.layer.borderWidth = 1.0
        dropoffView.layer.borderColor = UIColor.lightGray.cgColor
        
         self.dropoffView.addSubview(dropoffLabel)
         dropoffLabel.snp.makeConstraints { (make) -> Void in
             make.centerY.equalTo(dropoffView.snp.centerY)
             make.left.equalTo(dropoffView.snp.left).offset(16)
         }
        dropoffLabel.text = "Drop-off*"
        dropoffLabel.textColor = UIColor.lightGray
        dropoffLabel.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
        dropoffLabel.font = dropoffLabel.font.withSize(14)
        
        self.scrollView.addSubview(dateAndTimeView)
        dateAndTimeView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(locationView.snp.bottom).offset(24)
            make.left.equalTo(scrollView.snp.left).offset(16)
            make.right.equalTo(self.view.snp.right).offset(-16)
            make.height.equalTo(156)
        }
        dateAndTimeView.backgroundColor = .white
        dateAndTimeView.layer.borderColor = UIColor.lightGray.cgColor
        dateAndTimeView.clipsToBounds = true
        dateAndTimeView.layer.shadowOpacity = 0.7
        dateAndTimeView.layer.shadowRadius = 5.0
        dateAndTimeView.layer.masksToBounds = false
        dateAndTimeView.layer.shadowOffset = CGSize.zero
        dateAndTimeView.layer.shadowColor = UIColor.lightGray.cgColor
        
        self.dateAndTimeView.addSubview(dateAndTimeTitleLabel)
        dateAndTimeTitleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(dateAndTimeView).offset(16)
            make.left.equalTo(dateAndTimeView.snp.left).offset(16)
            make.width.equalTo(150)
        }
        dateAndTimeTitleLabel.text = "Date & Time"
        dateAndTimeTitleLabel.font = UIFont(name: "SFProText-Bold", size:UIFont.labelFontSize)
        dateAndTimeTitleLabel.font = dateAndTimeTitleLabel.font.withSize(17)
        dateAndTimeTitleLabel.font = dateAndTimeTitleLabel.font.bold()
        
        self.dateAndTimeView.addSubview(dateView)
               dateView.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(dateAndTimeTitleLabel.snp.bottom).offset(16)
                   make.left.equalTo(dateAndTimeView.snp.left).offset(16)
                   make.right.equalTo(dateAndTimeView.snp.right).offset(-30)
                   make.height.equalTo(40)
               }
        dateView.layer.backgroundColor = UIColor.white.cgColor
        dateView.layer.borderWidth = 1.0
        dateView.layer.borderColor = UIColor.lightGray.cgColor
        
        self.dateView.addSubview(dateLabel)
               dateLabel.snp.makeConstraints { (make) -> Void in
                   make.centerY.equalTo(dateView.snp.centerY)
                   make.left.equalTo(dateView.snp.left).offset(16)
               }
              dateLabel.text = "Date*"
              dateLabel.textColor = UIColor.lightGray
              dateLabel.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
              dateLabel.font = dateLabel.font.withSize(14)
        
        self.dateAndTimeView.addSubview(timeView)
               timeView.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(dateView.snp.bottom).offset(8)
                   make.left.equalTo(dateAndTimeView.snp.left).offset(16)
                   make.right.equalTo(dateAndTimeView.snp.right).offset(-30)
                   make.height.equalTo(40)
               }
        timeView.layer.backgroundColor = UIColor.white.cgColor
        timeView.layer.borderWidth = 1.0
        timeView.layer.borderColor = UIColor.lightGray.cgColor
        
        self.timeView.addSubview(timeLabel)
                      timeLabel.snp.makeConstraints { (make) -> Void in
                          make.centerY.equalTo(timeView.snp.centerY)
                          make.left.equalTo(timeView.snp.left).offset(16)
                      }
                     timeLabel.text = "Drop-off Time*"
                     timeLabel.textColor = UIColor.lightGray
                     timeLabel.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
                     timeLabel.font = timeLabel.font.withSize(14)
        
        self.scrollView.addSubview(accessibilityView)
        accessibilityView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(dateAndTimeView.snp.bottom).offset(24)
            make.left.equalTo(scrollView.snp.left).offset(16)
            make.right.equalTo(self.view.snp.right).offset(-16)
            make.height.equalTo(84)
        }
        accessibilityView.backgroundColor = .white
        accessibilityView.layer.borderColor = UIColor.lightGray.cgColor
        accessibilityView.clipsToBounds = true
        accessibilityView.layer.shadowOpacity = 0.7
        accessibilityView.layer.shadowRadius = 5.0
        accessibilityView.layer.masksToBounds = false
        accessibilityView.layer.shadowOffset = CGSize.zero
        accessibilityView.layer.shadowColor = UIColor.lightGray.cgColor
        
        self.accessibilityView.addSubview(accessibilityTitleLabel)
        accessibilityTitleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(accessibilityView.snp.top).offset(16)
            make.left.equalTo(accessibilityView.snp.left).offset(16)
            make.width.equalTo(150)
        }
        accessibilityTitleLabel.text = "Accessibility"
        accessibilityTitleLabel.font = UIFont(name: "SFProText-Bold", size:UIFont.labelFontSize)
        accessibilityTitleLabel.font = accessibilityTitleLabel.font.withSize(17)
        accessibilityTitleLabel.font = accessibilityTitleLabel.font.bold()
        
        self.accessibilityView.addSubview(wheelchairCheckBox)
                       wheelchairCheckBox.snp.makeConstraints { (make) -> Void in
                                 make.top.equalTo(accessibilityTitleLabel.snp.bottom).offset(16)
                                 make.left.equalTo(accessibilityTitleLabel.snp.left)
                                 make.width.equalTo(16)
                                 make.height.equalTo(16)
                             }
        wheelchairCheckBox.layer.borderWidth = 1.0
        wheelchairCheckBox.layer.borderColor = UIColor.lightGray.cgColor
        wheelchairCheckBox.layer.cornerRadius = 2
        
        self.accessibilityView.addSubview(wheelchairTitleLabel)
               wheelchairTitleLabel.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(accessibilityTitleLabel.snp.bottom).offset(17)
                make.left.equalTo(wheelchairCheckBox.snp.right).offset(8)
                make.width.equalTo(120)
               }
        wheelchairTitleLabel.text = "Wheelchair"
        wheelchairTitleLabel.textColor = UIColor.lightGray
       wheelchairTitleLabel.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
        wheelchairTitleLabel.font = wheelchairTitleLabel.font.withSize(12)
        
       self.scrollView.addSubview(additionalNotesView)
       additionalNotesView.snp.makeConstraints { (make) -> Void in
        make.top.equalTo(accessibilityView.snp.bottom).offset(24)
           make.left.equalTo(scrollView.snp.left).offset(16)
           make.right.equalTo(self.view.snp.right).offset(-16)
           make.height.equalTo(166)
        make.bottom.equalTo(self.scrollView.snp.bottom).offset(-20)
       }
       additionalNotesView.backgroundColor = .white
       additionalNotesView.layer.borderColor = UIColor.lightGray.cgColor
       additionalNotesView.clipsToBounds = true
       additionalNotesView.layer.shadowOpacity = 0.7
       additionalNotesView.layer.shadowRadius = 5.0
       additionalNotesView.layer.masksToBounds = false
       additionalNotesView.layer.shadowOffset = CGSize.zero
       additionalNotesView.layer.shadowColor = UIColor.lightGray.cgColor
       
       self.additionalNotesView.addSubview(additionalNotesTitle)
       additionalNotesTitle.snp.makeConstraints { (make) -> Void in
           make.top.equalTo(additionalNotesView).offset(16)
           make.left.equalTo(additionalNotesView.snp.left).offset(16)
           make.width.equalTo(150)
       }
       additionalNotesTitle.text = "Additional Notes"
       additionalNotesTitle.font = UIFont(name: "SFProText-Bold", size:UIFont.labelFontSize)
       additionalNotesTitle.font = dateAndTimeTitleLabel.font.withSize(17)
       additionalNotesTitle.font = dateAndTimeTitleLabel.font.bold()
        
        self.additionalNotesView.addSubview(additionalNotesTextField)
                      additionalNotesTextField.snp.makeConstraints { (make) -> Void in
                       make.top.equalTo(additionalNotesTitle.snp.bottom).offset(16)
                          make.left.equalTo(additionalNotesView.snp.left).offset(16)
                          make.right.equalTo(additionalNotesView.snp.right).offset(-14)
                          make.height.equalTo(98)
                      }
               additionalNotesTextField.layer.backgroundColor = UIColor.white.cgColor
               additionalNotesTextField.layer.borderWidth = 1.0
               additionalNotesTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        self.requestRideButtonBackgroundView.addSubview(airplaneImageView)
       airplaneImageView.snp.makeConstraints { (make) -> Void in
        make.centerY.equalTo(requestRideButton.snp.centerY)
        make.right.equalTo((requestRideButton.titleLabel?.snp.left)!).offset(-10)
        make.height.equalTo(25)
        make.width.equalTo(25)
        }
        airplaneImageView.image = UIImage(named: "airplane")
        
    }
    func setUpScrollView(){
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp.top).offset(70)
            make.left.equalTo(self.view.snp.left)
            make.width.equalTo(self.view.frame.width)
            make.height.equalTo(self.view.frame.height-250)
        }
        
    }
    @objc func keyboardDidShow(notification: NSNotification) {
        let bottomOffset = CGPoint(x: 0, y: 300)
        scrollView.setContentOffset(bottomOffset, animated: true)
    }

    @objc func keyboardDidHide(notification: NSNotification) {
        let bottomOffset = CGPoint(x: 0, y: 0)
        scrollView.setContentOffset(bottomOffset, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
