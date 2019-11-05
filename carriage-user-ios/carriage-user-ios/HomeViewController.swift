//
//  HomeViewController.swift
//  carriage-user-ios
//
//  Created by Kinjal Jasani on 11/5/19.
//  Copyright © 2019 Beth Mieczkowski. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = UIView()
        self.view.backgroundColor = .white
        setUpLayout()
        // Do any additional setup after loading the view.
    }
    func setUpLayout(){
        let greetingLabel = UILabel()
        self.view.addSubview(greetingLabel)
        greetingLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp_top).offset(80)
            make.left.equalTo(self.view.snp_left).offset(40)
        }
        greetingLabel.text = "Hi Aiden!"
        greetingLabel.font = greetingLabel.font.withSize(35)
        greetingLabel.font = greetingLabel.font.bold()
        
        let nextRideLabel = UILabel()
        self.view.addSubview(nextRideLabel)
        nextRideLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(greetingLabel.snp_bottom).offset(30)
            make.left.equalTo(self.view.snp_left).offset(30)
        }
       nextRideLabel.text = "Next Ride"
       nextRideLabel.font = nextRideLabel.font.withSize(22)
        nextRideLabel.font = nextRideLabel.font.bold()
        nextRideLabel.textColor = .darkGray
        
        let nextRideView = UIView()
        self.view.addSubview(nextRideView)
        nextRideView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(nextRideLabel.snp_bottom).offset(20)
            make.left.equalTo(self.view.snp_left).offset(30)
            make.right.equalTo(self.view.snp_right).offset(-30)
            make.height.equalTo(200)
        }
        nextRideView.backgroundColor = .white
        nextRideView.layer.borderColor = UIColor.lightGray.cgColor
        nextRideView.clipsToBounds = true
        nextRideView.layer.shadowOpacity = 0.7
        nextRideView.layer.shadowRadius = 10.0
        nextRideView.layer.masksToBounds = false
        nextRideView.layer.shadowOffset = CGSize.zero
        nextRideView.layer.shadowColor = UIColor.lightGray.cgColor
        
        let etaLabel = UILabel()
        nextRideView.addSubview(etaLabel)
        etaLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(nextRideView.snp_top)
            make.left.equalTo(nextRideView.snp_left)
            make.right.equalTo(nextRideView.snp_right)
            make.height.equalTo(30)
               }
        etaLabel.backgroundColor = .black
        etaLabel.textColor = .white
        etaLabel.text = "ETA: 5 mins"
        etaLabel.textAlignment = .center
        
        let fromLabel = UILabel()
        nextRideView.addSubview(fromLabel)
        fromLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(etaLabel.snp_bottom).offset(20)
            make.left.equalTo(nextRideView.snp_left).offset(20)
            }
        fromLabel.textColor = .darkGray
        fromLabel.text = "From"
        fromLabel.textAlignment = .center
        fromLabel.font = fromLabel.font.withSize(15)
        
        let fromLocation = UILabel()
               nextRideView.addSubview(fromLocation)
               fromLocation.snp.makeConstraints { (make) -> Void in
                   make.top.equalTo(fromLabel.snp_bottom)
                   make.left.equalTo(fromLabel.snp_left)
                   }
        fromLocation.text = "Upson Hall"
         fromLocation.font = fromLocation.font.withSize(20)
                
        let toLocation = UILabel()
               nextRideView.addSubview(toLocation)
               toLocation.snp.makeConstraints { (make) -> Void in
                make.right.equalTo(nextRideView.snp_right).offset(-20)
                   }
        toLocation.text = "Uris Hall"
         toLocation.font = fromLocation.font.withSize(20)
        
        let toLabel = UILabel()
        nextRideView.addSubview(toLabel)
        toLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(etaLabel.snp_bottom).offset(20)
            make.left.equalTo(toLocation.snp_left)
            }
        toLabel.textColor = .darkGray
        toLabel.text = "To"
        toLabel.textAlignment = .center
        toLabel.font = fromLabel.font.withSize(15)

        toLocation.snp.makeConstraints { (make) -> Void in
        make.top.equalTo(toLabel.snp_bottom)
            
        var statusArrow = UIImageView()
        statusArrow.image = UIImage(named: "arrow")
        nextRideView.addSubview(statusArrow)
        statusArrow.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(nextRideView.snp_centerY).offset(-35)
            make.left.equalTo(fromLocation.snp_right).offset(20)
            make.right.equalTo(toLocation.snp_left).offset(-20)
            make.height.equalTo(20)
        }
            statusArrow.layer.masksToBounds = true
            
        var driverPic = UIImageView()
        driverPic.image = UIImage(named: "driver_sample_pic")
        nextRideView.addSubview(driverPic)
        driverPic.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(fromLocation.snp_bottom).offset(30)
            make.left.equalTo(fromLocation.snp_left)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
            driverPic.layer.masksToBounds = true
            driverPic.layer.cornerRadius = driverPic.frame.width/2
            
            let driverName = UILabel()
             nextRideView.addSubview(driverName)
            driverName.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(driverPic.snp_top)
                make.left.equalTo(driverPic.snp_right).offset(20)
            }
            driverName.text = "Davea Butler"
            driverName.font = driverName.font.withSize(18)
            
            let driverPhone = UILabel()
                        nextRideView.addSubview(driverPhone)
                       driverPhone.snp.makeConstraints { (make) -> Void in
                        make.top.equalTo(driverName.snp_bottom)
                        make.left.equalTo(driverPic.snp_right).offset(20)
                       }
                       driverPhone.text = "323-231-5234"
                       driverPhone.font = driverPhone.font.withSize(18)
                        driverPhone.textColor = .lightGray
        }
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
extension UIFont {

    func withTraits(traits:UIFontDescriptor.SymbolicTraits...) -> UIFont {
        let descriptor = self.fontDescriptor
            .withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits))
        return UIFont(descriptor: descriptor!, size: 0)
    }

    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }
}
