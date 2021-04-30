//  RNTrackierSDK.swift
//  TrackierSDK
//
//  Created by Prakhar Srivastava on 29/04/21.
//  Copyright © 2021 Trackier. All rights reserved.
//

  import Foundation
  import trackier_ios_sdk

  @objc(RNTrackierSDK)
  class RNTrackierSDK: NSObject {

    @objc func initializeSDK(_ dict: NSDictionary) -> Void {

      let appToken = dict["appToken"] as! String;
      let environment = dict["environment"] as! String;
      let config = TrackierSDKConfig(appToken: appToken , env: environment)
      TrackierSDK.initialize(config: config)

    }

    @objc func trackEvent(_ dict: NSDictionary) -> Void {

      var currency: String?
      var revenue: String?
      var eventId: String
      var orderId: String?
      var param1: String?
      var param2: String?
      var param3 : String?
      var param4 : String?
      var param5 : String?
      var param6 : String?
      var param7 : String?
      var param8 : String?
      var param9 : String?
      var param10: String?
      var ev : Dictionary<String,Any>?

      currency = dict["currency"] as? String ?? ""
      revenue  = dict["revenue"] as? String  ?? ""
      eventId  = dict["eventId"] as String  
      orderId  = dict["orderId"] as? String  ?? ""
      param1   = dict["param1"] as? String   ?? ""
      param2   = dict["param2"] as? String   ?? ""
      param3   = dict["param3"] as? String   ?? ""
      param4   = dict["param4"] as? String   ?? ""
      param5   = dict["param5"] as? String   ?? ""
      param6   = dict["param6"] as? String   ?? ""
      param7   = dict["param7"] as? String   ?? ""
      param8   = dict["param8"] as? String   ?? ""
      param9   = dict["param9"] as? String   ?? ""
      param10  = dict["param10"] as? String  ?? ""
      ev       = dict["ev"] as? Dictionary<String,Any>  ?? [:]

      for (key, value) in ev! {
        ev![key] = value
      }

      let event = TrackierEvent(id: eventId!)
      event.setRevenue(revenue: Float64(revenue!.floatValue), currency: currency!)
      event.orderId = orderId
      event.param1  = param1
      event.param2  = param2
      event.param3  = param3
      event.param4  = param4
      event.param5  = param5
      event.param6  = param6
      event.param7  = param7
      event.param8  = param8
      event.param9  = param9
      event.param10 = param10
      for (key, value) in ev! {
        event.addEventValue(prop: key, val: value)
      }

       TrackierSDK.trackEvent(event: event)

      } 
  }
  extension String {
    var floatValue: Float {
    return (self as NSString).floatValue
    }
  }
