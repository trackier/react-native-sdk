//
//  TrackierEvent.swift
//  trackier-ios-sdk
//
//  Created by Prakhar Srivastava on 18/03/21.
//

import Foundation

public class TrackierEvent {

    var id: String
    public init(id: String) {
        self.id = id
    }

    public var orderId: String? = ""
    public var currency: String? = ""
    public var param1: String? = ""
    public var param2: String? = ""
    public var param3: String? = ""
    public var param4: String? = ""
    public var param5: String? = ""
    public var param6: String? = ""
    public var param7: String? = ""
    public var param8: String? = ""
    public var param9: String? = ""
    public var param10: String? = ""

    var revenue: Float64? = 0.0
    var ev = [String: Any]()
    
    public func addEventValue(prop: String, val: Any) {
        self.ev[prop] = val
    }
    
    public func setRevenue(revenue: Float64, currency: String) {
        self.revenue = revenue
        if currency.count == 3 {
            self.currency = currency
        }
    }
    
    func getHashMap() -> Dictionary<String, Any> {
        var dict = Dictionary<String, Any>()
        dict["id"] = self.id
        dict["orderId"] = self.orderId
        dict["param1"] = self.param1
        dict["param2"] = self.param2
        dict["param3"] = self.param3
        dict["param4"] = self.param4
        dict["param5"] = self.param5
        dict["param6"] = self.param6
        dict["param7"] = self.param7
        dict["param8"] = self.param8
        dict["param9"] = self.param9
        dict["param10"] = self.param10
        dict["currency"] = self.currency
        dict["revenue"] = self.revenue
        dict["ev"] = self.ev
        return dict
    }

    public static let LEVEL_ACHIEVED = "1CFfUn3xEY"
    public static let ADD_TO_CART = "Fy4uC1_FlN"
    public static let ADD_TO_WISHLIST = "AOisVC76YG"
    public static let COMPLETE_REGISTRATION = "mEqP4aD8dU"
    public static let TUTORIAL_COMPLETION = "99VEGvXjN7"
    public static let PURCHASE = "Q4YsqBKnzZ"
    public static let SUBSCRIBE = "B4N_In4cIP"
    public static let START_TRIAL = "jYHcuyxWUW"
    public static let ACHIEVEMENT_UNLOCKED = "xTPvxWuNqm"
    public static let CONTENT_VIEW = "Jwzois1ays"
    public static let TRAVEL_BOOKING = "yP1-ipVtHV"
    public static let SHARE = "dxZXGG1qqL"
    public static let INVITE = "7lnE3OclNT"
    public static let LOGIN = "o91gt1Q0PK"
    public static let UPDATE = "sEQWVHGThl"
}
