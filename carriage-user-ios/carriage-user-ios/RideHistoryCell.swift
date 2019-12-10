//
//  RideHistoryCell.swift
//  carriage-user-ios
//
//

import UIKit

class RideHistoryCell: UITableViewCell {
    var rideDate = UILabel()
    var rideTime = UILabel()
    var toLocation = UILabel()
    var fromLocation = UILabel()
    var containerView = UIView()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.isUserInteractionEnabled = false
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(containerView)
        containerView.snp.makeConstraints({ (make) -> Void in
            make.height.equalTo(self.contentView.snp.height).inset(10)
            make.width.equalTo(self.contentView.snp.width).inset(20)
            make.left.equalTo(self.contentView.snp.left).inset(15)
            make.top.equalTo(self.contentView.snp.top).inset(10)
            
        })
         
        containerView.addSubview(rideDate)
        containerView.addSubview(rideTime)
        containerView.backgroundColor = .white
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.7
        containerView.layer.shadowRadius = 5.0
        containerView.layer.masksToBounds = false
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowColor = UIColor.lightGray.cgColor
    }
    override func layoutSubviews() {
            
        
        
        rideDate.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(containerView).offset(10)
            make.left.equalTo(containerView).offset(12.5)
                   }
        rideDate.font = UIFont(name: "SFProDisplay-Bold", size:UIFont.labelFontSize)
        rideDate.font = rideDate.font.withSize(22)
        
        rideTime.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(rideDate.snp.top)
            make.left.equalTo(rideDate.snp.right).offset(5)
                   }
        rideTime.font = UIFont(name: "SFProDisplay-Bold", size:UIFont.labelFontSize)
        rideTime.font = rideTime.font.withSize(22)
        rideTime.textColor = UIColor(red: 132/255, green: 132/255, blue: 132/255, alpha: 1.0)
        
        let fromLabel = UILabel()
               containerView.addSubview(fromLabel)
               fromLabel.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(rideDate.snp.bottom).offset(20)
                make.left.equalTo(rideDate.snp.left)
                   }
               fromLabel.textColor = .darkGray
               fromLabel.text = "From"
               fromLabel.textAlignment = .center
               fromLabel.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
               fromLabel.font = fromLabel.font.withSize(11)
               
        
                     containerView.addSubview(fromLocation)
                fromLocation.snp.makeConstraints { (make) -> Void in
                    make.top.equalTo(fromLabel.snp.bottom)
                    make.left.equalTo(fromLabel.snp.left)
                    }
               
               fromLocation.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
                fromLocation.font = fromLocation.font.withSize(17)
                       
        
                      containerView.addSubview(toLocation)
                      toLocation.snp.makeConstraints { (make) -> Void in
                      make.left.equalTo(self.fromLocation.snp.right).offset(150)
                    }
             
               toLocation.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
               toLocation.font = fromLocation.font.withSize(17)
               
        let toLabel = UILabel()
               containerView.addSubview(toLabel)
               toLabel.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(rideDate.snp.bottom).offset(20)
                make.left.equalTo(toLocation.snp.left)
                   }
               toLabel.textColor = .darkGray
               toLabel.text = "To"
               toLabel.textAlignment = .center
               toLabel.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
               toLabel.font = fromLabel.font.withSize(11)

               toLocation.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(toLabel.snp.bottom)
               }
               var statusArrow = UIImageView()
               statusArrow.image = UIImage(named: "arrow")
               containerView.addSubview(statusArrow)
               statusArrow.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(fromLabel.snp.top).offset(15)
                make.left.equalTo(fromLocation.snp.right).offset(20)
                make.right.equalTo(toLocation.snp.left).offset(-20)
                   make.height.equalTo(20)
               }
                   statusArrow.layer.masksToBounds = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
