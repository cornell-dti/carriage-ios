//
//  SettingsLauncher.swift
//  carriage-user-ios
//
//  
//

import UIKit
class SettingsLauncher: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {
    let cellID = "settingsCell"
    var settingsLabels = ["Profile", "Settings", "Notifications"]
    var settingsImages = ["user", "settings", "user"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SettingCell
        cell.nameLabel.text = settingsLabels[indexPath.row]
        cell.iconImageView.image = UIImage(named: settingsImages[indexPath.row])        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    override init() {
        super.init()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(SettingCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "settingsHeader")
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    func showOptionsMenu(){
        if let window = UIApplication.shared.keyWindow{
        
       
        blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        let swipedDown = UIPanGestureRecognizer(target: self, action: #selector(handleDismiss))
        swipedDown.delegate = self
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            collectionView.addGestureRecognizer(swipedDown)
        window.addSubview(blackView)
        window.addSubview(collectionView)
        
        let height: CGFloat = 300
        let y = window.frame.height - height
            collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
        blackView.frame = window.frame
        blackView.alpha = 0
            self.collectionView.layer.cornerRadius =  20
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                 self.blackView.alpha = 1
                           self.collectionView.frame = CGRect(x: 0, y: y, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
                
            }, completion: nil)
            
        }
    }
    
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:collectionView.frame.size.width, height:30.0)
     }


     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

         switch kind {

         case UICollectionView.elementKindSectionHeader:

             let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "settingsHeader", for: indexPath)
             
             let scrollDownRectangle = UIView()
             scrollDownRectangle.backgroundColor = UIColor(white: 0, alpha: 0.3)
             headerView.addSubview(scrollDownRectangle)
             scrollDownRectangle.snp.makeConstraints { (make) -> Void in
                make.centerX.equalTo(headerView.snp.centerX)
                make.centerY.equalTo(headerView.snp.centerY)
                make.width.equalTo(42)
                make.height.equalTo(5)
             }
             scrollDownRectangle.layer.cornerRadius =  2.5
             headerView.backgroundColor = UIColor.white
             return headerView

         default:

             fatalError("Unexpected element kind")
         }
     }
    let blackView = UIView()
    
    @objc func handleDismiss(){
        UIView.animate(withDuration: 0.5) {
                   self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow{
                self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
                
            }
        }
    }
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let gesture = gestureRecognizer as? UIPanGestureRecognizer else { return false }

        let translation = gesture.translation(in: gesture.view!)
        if translation.x != 0 || translation.y != 0 {
            let angle = atan2(abs(translation.x), translation.y)
            return angle < .pi / 8
        }
        return false
    }
}
