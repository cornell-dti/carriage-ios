//
//  ProfileModel.swift
//  carriage-user-ios
//
//

import Foundation
import UIKit

class ProfileModel {
    
    var userName: String
    var dateJoined: NSDate
    var email: String
    var phoneNum: String
    var pronouns: String
    
    init(userName: String, dateJoined: NSDate, email: String, phoneNum: String, pronouns: String) {
        self.userName = userName
        self.dateJoined = dateJoined
        self.email = email
        self.phoneNum = phoneNum
        self.pronouns = pronouns
    }
    
}
