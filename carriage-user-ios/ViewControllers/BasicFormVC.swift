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
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: 150)
            ]);
        NSLayoutConstraint.activate([
            timePickupLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 50),
            timePickupLabel.heightAnchor.constraint(equalToConstant: 40),
            timePickupLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timePickupLabel.widthAnchor.constraint(equalToConstant: 150)
            ]);
        NSLayoutConstraint.activate([
            finalDestLabel.topAnchor.constraint(equalTo: timePickupLabel.bottomAnchor, constant: 50),
            finalDestLabel.heightAnchor.constraint(equalToConstant: 40),
            finalDestLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            finalDestLabel.widthAnchor.constraint(equalToConstant: 150)
            ]);
    }

}
