//
//  BasicFormVC.swift
//  carriage-user-ios
//
//  Created by Beth Mieczkowski on 10/22/19.
//  Copyright © 2019 Beth Mieczkowski. All rights reserved.
//

import UIKit

class BasicFormVC: UIViewController {

    var nameLabel: UILabel!
    var timePickupLabel: UILabel!
    var finalDestLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Basic Form"
        title = "Basic Form"
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .black
        nameLabel.backgroundColor = .lightGray
        view.addSubview(nameLabel)
        
        timePickupLabel = UILabel()
        timePickupLabel.translatesAutoresizingMaskIntoConstraints = false
        timePickupLabel.textColor = .black
        timePickupLabel.backgroundColor = .lightGray
        view.addSubview(timePickupLabel)
        
        finalDestLabel = UILabel()
        finalDestLabel.translatesAutoresizingMaskIntoConstraints = false
        finalDestLabel.textColor = .black
        finalDestLabel.backgroundColor = .lightGray
        view.addSubview(finalDestLabel)
        
        setUpConstraints()

    }

}
