//
//  HomeViewController.swift
//  carriage-user-ios
//
//  Created by Kinjal Jasani on 11/5/19.
//  Copyright © 2019 Beth Mieczkowski. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate {
    var upcomingRides = [upcomingRidesObject]()
    
    var upcomingRidesTable = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let scrollView: UIScrollView = {
                     let v = UIScrollView()
                     v.translatesAutoresizingMaskIntoConstraints = false
                     v.backgroundColor = .white
                     return v
                 }()
    let flowLayout = UICollectionViewFlowLayout()
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
     }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        upcomingRides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = upcomingRidesTable.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! UpcomingRidesCell
        cell.driverProfile.image = UIImage(named: upcomingRides[indexPath.row].driverPic)
        cell.driverName.text = upcomingRides[indexPath.row].driverName
        cell.driverPhone.text = upcomingRides[indexPath.row].driverPhone
        cell.rideStatus.text = upcomingRides[indexPath.row].rideStatus
        cell.fromLocation.text = upcomingRides[indexPath.row].fromLocation
        cell.toLocation.text = upcomingRides[indexPath.row].toLocation
        cell.rideDate.text = upcomingRides[indexPath.row].rideDate
        cell.rideTime.text = upcomingRides[indexPath.row].rideTime
        return cell
    }
    
    
    func  setUpUpcomingRidesTable(collectionView: UICollectionView){
      
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.minimumLineSpacing = 30.0
        flowLayout.itemSize = CGSize(width: 295, height: 240)
        upcomingRidesTable.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 20, height: 240)
        upcomingRidesTable.collectionViewLayout = flowLayout
        upcomingRidesTable.dataSource = self
        upcomingRidesTable.delegate = self
        upcomingRidesTable.register(UpcomingRidesCell.self, forCellWithReuseIdentifier: "Cell")
        
    }
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = UIView()
        self.view.backgroundColor = .white
        self.view.addSubview(scrollView)
        scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8.0).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8.0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -8.0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -8.0).isActive = true
        setUpLayout()
        getUpcomingRides()
        upcomingRidesTable.reloadData()
        // Do any additional setup after loading the view.
    }
    func getUpcomingRides(){
        let nextRide = upcomingRidesObject(name: "Adam Denisov", picture: "upcoming_driver_sample_pic", phone: " +1 123-456-7890", status: "Ride Confirmed", to: "Cascadilla Hall", from: "Uris Hall", date: "OCT 18th", time: "12:00 PM")
        upcomingRides.append(nextRide)
        let secondRide = upcomingRidesObject(name: "Adam Denisov", picture: "upcoming_driver_sample_pic", phone: " +1 123-456-7890", status: "Ride Confirmed", to: "Cascadilla Hall", from: "Uris Hall", date: "OCT 18th", time: "12:00 PM")
        upcomingRides.append(secondRide)
    }
    
    func setUpLayout(){
    
        let greetingLabel = UILabel()
        scrollView.addSubview(greetingLabel)
        greetingLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp_top).offset(80)
            make.left.equalTo(self.view.snp_left).offset(30)
        }
        greetingLabel.text = "Hi Aiden! ☀️"
        greetingLabel.font = UIFont(name: "SFProDisplay-Bold", size: UIFont.labelFontSize)
        greetingLabel.font = greetingLabel.font.withSize(34)
        greetingLabel.font = greetingLabel.font.bold()
        
        let nextRideLabel = UILabel()
        scrollView.addSubview(nextRideLabel)
        nextRideLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(greetingLabel.snp_bottom).offset(30)
            make.left.equalTo(self.view.snp_left).offset(30)
        }
       nextRideLabel.text = "Next Ride"
       nextRideLabel.font = UIFont(name: "SFProDisplay-Semibold", size:UIFont.labelFontSize)
       nextRideLabel.font = nextRideLabel.font.withSize(20)
       nextRideLabel.font = nextRideLabel.font.bold()
       nextRideLabel.textColor = .darkGray
        
        let nextRideView = UIView()
        scrollView.addSubview(nextRideView)
        nextRideView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(nextRideLabel.snp_bottom).offset(20)
            make.left.equalTo(self.view.snp_left).offset(30)
            make.right.equalTo(self.view.snp_right).offset(-30)
            make.height.equalTo(175)
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
        etaLabel.text = "ETA: 5 minutes"
        etaLabel.textAlignment = .center
        etaLabel.font = UIFont(name: "SFProText-Medium", size:UIFont.labelFontSize)
        etaLabel.font = greetingLabel.font.withSize(12)
        
        let fromLabel = UILabel()
        nextRideView.addSubview(fromLabel)
        fromLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(etaLabel.snp_bottom).offset(20)
            make.left.equalTo(nextRideView.snp_left).offset(20)
            }
        fromLabel.textColor = .darkGray
        fromLabel.text = "From"
        fromLabel.textAlignment = .center
        fromLabel.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
        fromLabel.font = fromLabel.font.withSize(11)
        
        let fromLocation = UILabel()
               nextRideView.addSubview(fromLocation)
               fromLocation.snp.makeConstraints { (make) -> Void in
                   make.top.equalTo(fromLabel.snp_bottom)
                   make.left.equalTo(fromLabel.snp_left)
                   }
        fromLocation.text = "Upson Hall"
        fromLocation.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
         fromLocation.font = fromLocation.font.withSize(17)
                
        let toLocation = UILabel()
               nextRideView.addSubview(toLocation)
               toLocation.snp.makeConstraints { (make) -> Void in
                make.right.equalTo(nextRideView.snp_right).offset(-20)
                   }
        toLocation.text = "Uris Hall"
        toLocation.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
         toLocation.font = fromLocation.font.withSize(17)
        
        let toLabel = UILabel()
        nextRideView.addSubview(toLabel)
        toLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(etaLabel.snp_bottom).offset(20)
            make.left.equalTo(toLocation.snp_left)
            }
        toLabel.textColor = .darkGray
        toLabel.text = "To"
        toLabel.textAlignment = .center
        toLabel.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
        toLabel.font = fromLabel.font.withSize(11)

        toLocation.snp.makeConstraints { (make) -> Void in
        make.top.equalTo(toLabel.snp_bottom)
        }
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
            make.top.equalTo(fromLocation.snp_bottom).offset(25)
            make.left.equalTo(fromLocation.snp_left)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
            driverPic.layer.masksToBounds = false
            driverPic.layer.cornerRadius = 20
            driverPic.clipsToBounds = true
            
            
            
            
            let driverName = UILabel()
             nextRideView.addSubview(driverName)
            driverName.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(driverPic.snp_top)
                make.left.equalTo(driverPic.snp_right).offset(20)
            }
            driverName.text = "Davea Butler"
            driverName.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
            driverName.font = driverName.font.withSize(15)
            
            let driverPhone = UILabel()
                        nextRideView.addSubview(driverPhone)
                       driverPhone.snp.makeConstraints { (make) -> Void in
                        make.top.equalTo(driverName.snp_bottom)
                        make.left.equalTo(driverPic.snp_right).offset(20)
                       }
            driverPhone.text = "+1 323-231-5234"
            driverPhone.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
            driverPhone.font = driverPhone.font.withSize(15)
            driverPhone.textColor = .darkGray
            
            let upcomingRidesLabel = UILabel()
             scrollView.addSubview(upcomingRidesLabel)
             upcomingRidesLabel.snp.makeConstraints { (make) -> Void in
                 make.top.equalTo(nextRideView.snp_bottom).offset(40)
                 make.left.equalTo(self.view.snp_left).offset(30)
             }
            upcomingRidesLabel.text = "Upcoming Rides"
            upcomingRidesLabel.font = UIFont(name: "SFProDisplay-Semibold", size:UIFont.labelFontSize)
            upcomingRidesLabel.font = upcomingRidesLabel.font.withSize(20)
            upcomingRidesLabel.font = upcomingRidesLabel.font.bold()
            upcomingRidesLabel.textColor = .darkGray
            
           
            setUpUpcomingRidesTable(collectionView: upcomingRidesTable)
            upcomingRidesTable.backgroundColor = UIColor.white
            scrollView.addSubview(upcomingRidesTable)
            upcomingRidesTable.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(upcomingRidesLabel.snp_bottom).offset(10)
            make.left.equalTo(upcomingRidesLabel.snp_left)
            make.height.equalTo(290)
            make.right.equalTo(self.view.snp_right).offset(-10)
            }
            
        let moreButton = UIButton()
        scrollView.addSubview(moreButton)
        moreButton.snp.makeConstraints { (make) -> Void in
        make.top.equalTo(greetingLabel.snp_top)
        make.right.equalTo(self.view.snp_right).offset(-20)
        make.height.equalTo(40)
        make.width.equalTo(40)
        }
        moreButton.setImage(UIImage(named: "menu"), for: .normal)
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
