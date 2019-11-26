//
//  File.swift
//  carriage-user-ios
//
//  Created by Kinjal Jasani on 11/11/19.
//  Copyright © 2019 Beth Mieczkowski. All rights reserved.
//

import Foundation
class upcomingRidesObject: NSObject{


var driverName: String
var driverPic: String
var driverPhone: String
var rideStatus: String
var fromLocation: String
var toLocation: String
var rideDate: String
var rideTime: String

    init (name: String, picture: String, phone: String, status: String, to: String, from: String, date: String, time: String) {
        
        driverName = name
        driverPic = picture
        driverPhone = phone
        rideStatus = status
        fromLocation = from
        toLocation = to
        rideDate = date
        rideTime = time
    }
    
    
}
