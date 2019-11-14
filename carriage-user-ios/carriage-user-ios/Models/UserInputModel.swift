//
//  UserInputModel.swift
//  Carriage
//
//

import Foundation
import UIKit

class UserInputModel {
    
    var userFirstName: String
    var userLastName: String
    var pickUpTime: String
    var pickUpLocation: String
    
    init(userFirstName: String, userLastName: String, pickUpTime: String, pickUpLocation: String) {
        self.userFirstName = userFirstName
        self.userLastName = userLastName
        self.pickUpTime = pickUpTime
        self.pickUpLocation = pickUpLocation
    }
    
}
