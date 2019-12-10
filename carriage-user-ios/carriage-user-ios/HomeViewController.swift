//
//  HomeViewController.swift
//  carriage-user-ios
//
// 
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    var settingsShowing = false
    let greetingLabel = UILabel()
    let nextRideLabel = UILabel()
    let etaLabel = UILabel()
    let nextRideView = UIView()
    let fromLabel = UILabel()
    let fromLocation = UILabel()
    let moreButton = UIButton()
    let requestRideButton = UIButton()
    let rideHistoryLabel = UILabel()
    let requestRideButtonBackgroundView = UIView()
    let upcomingRidesLabel = UILabel()
    let driverPhone = UILabel()
    let driverName = UILabel()
    var driverPic = UIImageView()
    var statusArrow = UIImageView()
    let toLabel = UILabel()
    let toLocation = UILabel()
    
    @objc func transitionToRequestRide(){
        let requestRideViewController: RequestRideViewController = RequestRideViewController()
        self.scrollView.removeFromSuperview()
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        let backButton = UIBarButtonItem()
        backButton.title = "Schedule"
        backButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        navigationController?.viewControllers[0].navigationItem.backBarButtonItem = backButton
        self.navigationController?.pushViewController(requestRideViewController, animated: true)
    }
    let settingsLauncher = SettingsLauncher()
    @objc func showSettings(){
        if (settingsShowing == false){
        settingsLauncher.showOptionsMenu()
        settingsShowing = true
        }
        else{
            settingsLauncher.handleDismiss()
            settingsShowing = false
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rideHistory.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.rideHistoryTable.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! RideHistoryCell
        cell.layer.masksToBounds = false
        cell.rideDate.text = rideHistory[indexPath.row].rideDate
        cell.rideTime.text = rideHistory[indexPath.row].rideTime
        cell.fromLocation.text = rideHistory[indexPath.row].fromLocation
        cell.toLocation.text = rideHistory[indexPath.row].toLocation
        return cell
    }
    
    var upcomingRides = [upcomingRidesObject]()
    var rideHistory = [rideHistoryObject]()
    
    var upcomingRidesTable = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let scrollView = UIScrollView(frame: UIScreen.main.bounds)

    let flowLayout = UICollectionViewFlowLayout()
    
    var rideHistoryTable = UITableView()
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
     }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upcomingRides.count
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
    

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        setUpScrollView()
        setUpLayout()
        getUpcomingRides()
        getRideHistory()
        upcomingRidesTable.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = UIView(frame: UIScreen.main.bounds)
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        setUpScrollView()
        setUpLayout()
        getUpcomingRides()
        getRideHistory()
        upcomingRidesTable.reloadData()
        
        // Do any additional setup after loading the view.
    }
    func getUpcomingRides(){
        let nextRide = upcomingRidesObject(name: "Adam Denisov", picture: "upcoming_driver_sample_pic", phone: " +1 123-456-7890", status: "Ride Confirmed", to: "Cascadilla Hall", from: "Uris Hall", date: "OCT 18th", time: "12:00 PM")
        upcomingRides.append(nextRide)
        let secondRide = upcomingRidesObject(name: "Adam Denisov", picture: "upcoming_driver_sample_pic", phone: " +1 123-456-7890", status: "Ride Confirmed", to: "Cascadilla Hall", from: "Uris Hall", date: "OCT 18th", time: "12:00 PM")
        upcomingRides.append(secondRide)
    }
    func getRideHistory(){
        let oldestRide = rideHistoryObject(date: "OCT 16th", time: "12:00 PM", from: "Location A", to: "Location B")
        rideHistory.append(oldestRide)
        let olderRide = rideHistoryObject(date: "OCT 18th", time: "12:00 PM", from: "Location A", to: "Location B")
        rideHistory.append(olderRide)
        let latestRide = rideHistoryObject(date: "OCT 19th", time: "12:00 PM", from: "Location A", to: "Location B")
        rideHistory.append(latestRide)
        self.rideHistoryTable.reloadData()
    }
    func setUpScrollView(){
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp.top).offset(120)
            make.left.equalTo(self.view.snp.left)
            make.width.equalTo(self.view.frame.width)
            make.height.equalTo(self.view.frame.height-100)
        }
    }
    func setUpLayout(){
        self.view.addSubview(greetingLabel)
        greetingLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp.top).offset(50)
            make.left.equalTo(self.view.snp.left).offset(30)
        }
        greetingLabel.text = "Hi Aiden! ☀️"
        greetingLabel.font = UIFont(name: "SFProDisplay-Bold", size: UIFont.labelFontSize)
        greetingLabel.font = greetingLabel.font.withSize(34)
        greetingLabel.font = greetingLabel.font.bold()
        
        self.view.addSubview(nextRideLabel)
        nextRideLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp.bottom).offset(30)
            make.left.equalTo(self.view.snp.left).offset(30)
        }
       nextRideLabel.text = "Next Ride"
       nextRideLabel.font = UIFont(name: "SFProDisplay-Semibold", size:UIFont.labelFontSize)
       nextRideLabel.font = nextRideLabel.font.withSize(20)
       nextRideLabel.font = nextRideLabel.font.bold()
       nextRideLabel.textColor = .darkGray
        
       
        self.scrollView.addSubview(nextRideView)
        nextRideView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(scrollView.snp.top)
            make.left.equalTo(scrollView.snp.left).offset(30)
            make.right.equalTo(self.view.snp.right).offset(-30)
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
        
        
        nextRideView.addSubview(etaLabel)
        etaLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(nextRideView.snp.top)
            make.left.equalTo(nextRideView.snp.left)
            make.right.equalTo(nextRideView.snp.right)
            make.height.equalTo(30)
               }
        etaLabel.backgroundColor = .black
        etaLabel.textColor = .white
        etaLabel.text = "ETA: 5 minutes"
        etaLabel.textAlignment = .center
        etaLabel.font = UIFont(name: "SFProText-Medium", size:UIFont.labelFontSize)
        etaLabel.font = greetingLabel.font.withSize(12)
        
        
        nextRideView.addSubview(fromLabel)
        fromLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(etaLabel.snp.bottom).offset(20)
            make.left.equalTo(nextRideView.snp.left).offset(20)
            }
        fromLabel.textColor = .darkGray
        fromLabel.text = "From"
        fromLabel.textAlignment = .center
        fromLabel.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
        fromLabel.font = fromLabel.font.withSize(11)
        
        fromLocation.text = "Upson Hall"
        fromLocation.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
         fromLocation.font = fromLocation.font.withSize(17)
               nextRideView.addSubview(fromLocation)
               fromLocation.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(fromLabel.snp.bottom)
                make.left.equalTo(nextRideView.snp.left).offset(20)
                make.width.equalTo(fromLocation.intrinsicContentSize.width)
                   }
        
                toLocation.text = "Uris Hall"
                       toLocation.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
                        toLocation.font = fromLocation.font.withSize(17)
               nextRideView.addSubview(toLocation)
               toLocation.snp.makeConstraints { (make) -> Void in
                make.right.equalTo(nextRideView.snp.right).offset(-20)
                make.width.equalTo(toLocation.intrinsicContentSize.width)
                   }
       
        
       
        nextRideView.addSubview(toLabel)
        toLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(etaLabel.snp.bottom).offset(20)
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
        
        statusArrow.image = UIImage(named: "arrow")
        nextRideView.addSubview(statusArrow)
        statusArrow.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(nextRideView.snp.centerY).offset(-35)
            make.left.equalTo(fromLocation.snp.right).offset(20)
            make.right.equalTo(toLocation.snp.left).offset(-20)
            make.height.equalTo(20)
        }
            statusArrow.layer.masksToBounds = true
            
       
        driverPic.image = UIImage(named: "driver_sample_pic")
        nextRideView.addSubview(driverPic)
        driverPic.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(fromLocation.snp.bottom).offset(25)
            make.left.equalTo(fromLocation.snp.left)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
            driverPic.layer.masksToBounds = false
            driverPic.layer.cornerRadius = 20
            driverPic.clipsToBounds = true
            
             nextRideView.addSubview(driverName)
            driverName.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(driverPic.snp.top)
                make.left.equalTo(driverPic.snp.right).offset(20)
            }
            driverName.text = "Davea Butler"
            driverName.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
            driverName.font = driverName.font.withSize(15)
            
            
                        nextRideView.addSubview(driverPhone)
                       driverPhone.snp.makeConstraints { (make) -> Void in
                        make.top.equalTo(driverName.snp.bottom)
                        make.left.equalTo(driverPic.snp.right).offset(20)
                       }
            driverPhone.text = "+1 323-231-5234"
            driverPhone.font = UIFont(name: "SFProText-Regular", size:UIFont.labelFontSize)
            driverPhone.font = driverPhone.font.withSize(15)
            driverPhone.textColor = .darkGray
            
            
             scrollView.addSubview(upcomingRidesLabel)
             upcomingRidesLabel.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(nextRideView.snp.bottom).offset(40)
                make.left.equalTo(scrollView.snp.left).offset(30)
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
            make.top.equalTo(upcomingRidesLabel.snp.bottom).offset(10)
                make.left.equalTo(upcomingRidesLabel.snp.left).offset(-10)
            make.height.equalTo(290)
            make.right.equalTo(self.view.snp.right).offset(-10)
            }
            
       
        self.view.addSubview(moreButton)
        moreButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(greetingLabel.snp.top)
            make.right.equalTo(self.view.snp.right).offset(-20)
        make.height.equalTo(40)
        make.width.equalTo(40)
        }
        moreButton.setImage(UIImage(named: "menu"), for: .normal)
        moreButton.addTarget(self, action: #selector(showSettings), for: .touchUpInside)
        
        
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
        requestRideButton.backgroundColor = UIColor.black
        requestRideButton.setTitle("+ Request Ride", for: .normal)
        requestRideButton.titleLabel?.font = UIFont(name: "SFProText-Bold", size: 17.0)
        requestRideButton.titleLabel?.font = requestRideButton.titleLabel?.font.bold()
        requestRideButton.backgroundColor = UIColor.black
        requestRideButton.titleLabel?.textColor = UIColor.white
        requestRideButton.addTarget(self, action: #selector(transitionToRequestRide), for: .touchUpInside)
        requestRideButton.layer.cornerRadius = 5
        
        
         scrollView.addSubview(rideHistoryLabel)
         rideHistoryLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(upcomingRidesTable.snp.bottom).offset(10)
            make.left.equalTo(upcomingRidesLabel.snp.left)
         }
        rideHistoryLabel.text = "Ride History"
        rideHistoryLabel.font = UIFont(name: "SFProDisplay-Semibold", size:UIFont.labelFontSize)
        rideHistoryLabel.font = rideHistoryLabel.font.withSize(20)
        rideHistoryLabel.font = rideHistoryLabel.font.bold()
        rideHistoryLabel.textColor = .darkGray
        
        scrollView.addSubview(rideHistoryTable)
        rideHistoryTable.dataSource = self
        rideHistoryTable.delegate = self
        rideHistoryTable.backgroundColor = .white
        rideHistoryTable.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(rideHistoryLabel.snp.bottom).offset(10)
            make.left.equalTo(rideHistoryLabel.snp.left).offset(-15)
            make.right.equalTo(self.view.snp.right).offset(-10)
            make.height.equalTo(260)
            make.bottom.equalTo(scrollView.snp.bottom).offset(-100)
        }
        rideHistoryTable.register(RideHistoryCell.self, forCellReuseIdentifier: "HistoryCell")

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
