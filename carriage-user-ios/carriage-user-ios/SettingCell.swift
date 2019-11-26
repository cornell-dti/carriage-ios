//
//  SettingCell.swift
//  carriage-user-ios
//
//  Created by Kinjal Jasani on 11/25/19.
//  Copyright © 2019 Beth Mieczkowski. All rights reserved.
//

import UIKit
class SettingCell: UICollectionViewCell {
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProText-Regular", size: UIFont.labelFontSize)
        label.font = label.font.withSize(17)
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let borderView : UIView = {
        let border = UIView()
        border.backgroundColor = UIColor(white: 0, alpha: 0.3)
        return border
    }()
    override init(frame: CGRect){
        super.init(frame: frame)
        setUpViews()
    }
    
    func setUpViews(){
        backgroundColor = UIColor.white
        addSubview(nameLabel)
        addSubview(iconImageView)
        addSubview(borderView)
        iconImageView .snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.left.equalTo(self.contentView.snp.left).offset(20)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        nameLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.contentView.snp.top)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(5)
            make.right.equalTo(self.contentView.snp.right)
            make.left.equalTo(iconImageView.snp.right).offset(20)
        }
        borderView.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(self.contentView.snp.bottom)
            make.right.equalTo(self.contentView.snp.right).offset(-17)
            make.left.equalTo(nameLabel.snp.left)
            make.height.equalTo(1)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
