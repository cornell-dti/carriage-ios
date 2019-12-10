//
//  rideHistoryObject.swift
//  carriage-user-ios
//
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
