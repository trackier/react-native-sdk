//
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

    NSLog("initializeSDK  dict %@ ", dict);
    
    let RNappToken = dict["appToken"] as! String;
    let RNenvironment = dict["environment"] as! String;
    
    let config = TrackierSDKConfig(appToken: RNappToken , env: RNenvironment)
    TrackierSDK.initialize(config: config)
    NSLog("inside swift module initializeSDK");

  }
    
    @objc func trackEvent(_ dict: NSDictionary) -> Void {
      NSLog("trackEvent  dict %@ ", dict);

        var RNcurrency: String?
        var RNrevenue: String?
        var RNeventId: String?
        var RNorderId: String?
        var RNparam1: String?
        var RNparam2: String?
        var RNparam3 : String?
        var RNparam4 : String?
        var RNparam5 : String?
        var RNparam6 : String?
        var RNparam7 : String?
        var RNparam8 : String?
        var RNparam9 : String?
        var RNparam10: String?
        
         RNcurrency = dict["currency"] as? String ?? ""
         RNrevenue  = dict["revenue"] as? String  ?? ""
         RNeventId  = dict["eventId"] as? String  ?? ""
         RNorderId  = dict["orderId"] as? String  ?? ""
         RNparam1   = dict["param1"] as? String   ?? ""
         RNparam2   = dict["param2"] as? String   ?? ""
         RNparam3   = dict["param3"] as? String   ?? ""
         RNparam4   = dict["param4"] as? String   ?? ""
         RNparam5   = dict["param5"] as? String   ?? ""
         RNparam6   = dict["param6"] as? String   ?? ""
         RNparam7   = dict["param7"] as? String   ?? ""
         RNparam8   = dict["param8"] as? String   ?? ""
         RNparam9   = dict["param9"] as? String   ?? ""
         RNparam10  = dict["param10"] as? String  ?? "" 
       // let RNev       = {};
              
        let event = TrackierEvent(id: RNeventId)
        //event.addEventValue(RNev)
        event.setRevenue(revenue: Float64(RNrevenue.floatValue), currency: RNcurrency)
        event.orderId = RNorderId
        event.param1  = RNparam1
        event.param2  = RNparam2
        event.param3  = RNparam3
        event.param4  = RNparam4
        event.param5  = RNparam5
        event.param6  = RNparam6
        event.param7  = RNparam7
        event.param8  = RNparam8
        event.param9  = RNparam9
        event.param10 = RNparam10
        DispatchQueue.global().async {
            sleep(1)
            TrackierSDK.trackEvent(event: event)
        }
      
      NSLog("inside swift module trackEvent");

    } 
}
extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}
