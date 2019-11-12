//
//  UpcomingRidesCell.swift
//  carriage-user-ios
//
//  Created by Kinjal Jasani on 11/5/19.
//  Copyright © 2019 Beth Mieczkowski. All rights reserved.
//

import UIKit

class UpcomingRidesCell: UICollectionViewCell {
    var driverProfile = UIImageView()
    var driverName = UILabel()
    var driverPhone = UILabel()
    var rideStatus = UILabel()
    var toLabel = UILabel()
    var fromLabel = UILabel()
    var toLocation = UILabel()
    var fromLocation = UILabel()
    var rideDate = UILabel()
    var rideTime = UILabel()
    var editButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .white
       
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
        self.contentView.clipsToBounds = true
        self.contentView.layer.shadowOpacity = 0.7
        self.contentView.layer.shadowRadius = 8.0
        self.contentView.layer.masksToBounds = false
        self.contentView.layer.shadowOffset = CGSize.zero
        self.contentView.layer.shadowColor = UIColor.lightGray.cgColor
        self.contentView.frame = CGRect(x: 0, y: 0, width: 295, height: 240)
        driverProfile = UIImageView()
        driverProfile.contentMode = .scaleAspectFill
        driverProfile.isUserInteractionEnabled = false
        contentView.addSubview(driverProfile)
        contentView.addSubview(driverName)
        contentView.addSubview(driverPhone)
        contentView.addSubview(rideStatus)
        contentView.addSubview(toLabel)
        contentView.addSubview(toLocation)
        contentView.addSubview(fromLabel)
        contentView.addSubview(fromLocation)
        contentView.addSubview(rideDate)
        contentView.addSubview(rideTime)
        contentView.addSubview(editButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        driverProfile.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.contentView.snp_bottom).offset(-20)
            make.left.equalTo(self.contentView.snp_left).offset(20)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        driverProfile.layer.masksToBounds = false
        driverProfile.layer.cornerRadius = 20
        driverProfile.clipsToBounds = true
        
        
        driverName.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(driverProfile.snp_top)
            make.left.equalTo(driverProfile.snp_right).offset(20)
        }
        driverName.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
        driverName.font = driverName.font.withSize(15)
        
        
        driverPhone.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(driverName.snp_bottom)
            make.left.equalTo(driverProfile.snp_right).offset(20)
                   }
        driverPhone.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
        driverPhone.font = driverPhone.font.withSize(15)
        driverPhone.textColor = .darkGray
        
        
        rideStatus.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(driverName.snp_top).offset(-15)
            make.left.equalTo(driverProfile.snp_left)
                   }
        rideStatus.font = UIFont(name: "SFProText-Medium", size:UIFont.labelFontSize)
        rideStatus.font = rideStatus.font.withSize(10)
        rideStatus.textColor = UIColor(red: 76/255, green: 175/255, blue: 80/255, alpha: 1.0)
        
        toLocation.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(rideStatus.snp_top).offset(-20)
            make.left.equalTo(rideStatus.snp_left)
                   }
        toLocation.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
        toLocation.font = toLocation.font.withSize(17)
        
        
        toLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(toLocation.snp_top)
            make.left.equalTo(rideStatus.snp_left)
                   }
        toLabel.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
        toLabel.font = toLabel.font.withSize(11)
        toLabel.textColor = UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1.0)
        toLabel.text = "To"
        
        fromLocation.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(toLabel.snp_top).offset(-20)
            make.left.equalTo(rideStatus.snp_left)
                   }
        fromLocation.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
        fromLocation.font = fromLocation.font.withSize(17)
        
        
        fromLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(fromLocation.snp_top)
            make.left.equalTo(rideStatus.snp_left)
                   }
        fromLabel.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
        fromLabel.font = fromLabel.font.withSize(11)
        fromLabel.textColor = UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1.0)
        fromLabel.text = "From"
        
        rideDate.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(fromLabel.snp_top).offset(-10)
            make.left.equalTo(rideStatus.snp_left)
                   }
        rideDate.font = UIFont(name: "SFProDisplay-Bold", size:UIFont.labelFontSize)
        rideDate.font = rideDate.font.withSize(22)
        
        
        rideTime.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(fromLabel.snp_top).offset(-10)
            make.left.equalTo(rideDate.snp_right).offset(5)
                   }
        rideTime.font = UIFont(name: "SFProDisplay-Bold", size:UIFont.labelFontSize)
        rideTime.font = rideTime.font.withSize(22)
        rideTime.textColor = UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1.0)
        
        
        editButton.isHidden = false
        editButton.backgroundColor = .white
        editButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView.snp_top)
            make.left.equalTo(rideTime.snp_right).offset(50)
            make.height.equalTo(30)
            make.width.equalTo(30)
                   }
        editButton.setImage(UIImage(named: "edit"), for: .normal)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
