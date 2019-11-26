//
//  rideHistoryObject.swift
//  carriage-user-ios
//
//  Created by Kinjal Jasani on 11/19/19.
//  Copyright © 2019 Beth Mieczkowski. All rights reserved.
//

import Foundation
class rideHistoryObject: NSObject{
    var rideDate: String
    var rideTime: String
    var fromLocation: String
    var toLocation: String
    init (date: String, time: String, from: String, to:String) {
    rideDate = date
    rideTime = time
    fromLocation = from
    toLocation = to
    }

}
