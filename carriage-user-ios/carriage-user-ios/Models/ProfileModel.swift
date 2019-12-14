//
//  ProfileModel.swift
//  carriage-user-ios
//
//

import Foundation
import UIKit

class ProfileModel {
    
    var userName: String
    var email: String
    var photoURL: URL
    
    init(userName: String, email: String, photoURL: URL) {
        self.userName = userName
        self.email = email
        self.photoURL = photoURL
    }
    
}
