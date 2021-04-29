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

        var RNrevenue  = ""
        var RNeventId  = ""
        var RNorderId  = ""
        var RNparam1   = ""
        var RNparam2   = ""
        var RNparam3   = ""
        var RNparam4   = ""
        var RNparam5   = ""
        var RNparam6   = ""
        var RNparam7   = ""
        var RNparam8   = ""
        var RNparam9   = ""
        var RNparam10  = ""
        
        if(dict["currency"]  == [NSNull null]){
           RNcurrency = dict["currency"] as? String;
         }
         if(dict["currency"]  == [NSNull null]){
         RNrevenue  = dict["revenue"] as? String;
         }
         if(dict["currency"]  == [NSNull null]){
         RNeventId  = dict["eventId"] as? String;
         }
         if(dict["currency"]  == [NSNull null]){
         RNorderId  = dict["orderId"] as? String;
         }
         if(dict["currency"]  == [NSNull null]){
         RNparam1   = dict["param1"] as? String;
         }
         if(dict["currency"]  == [NSNull null]){
         RNparam2   = dict["param2"] as? String;
         }
         if(dict["currency"]  == [NSNull null]){
         RNparam3   = dict["param3"] as? String;
         }
         if(dict["currency"]  == [NSNull null]){
         RNparam4   = dict["param4"] as? String;
         }
         if(dict["currency"]  == [NSNull null]){
         RNparam5   = dict["param5"] as? String;
         }
         if(dict["currency"]  == [NSNull null]){
         RNparam6   = dict["param6"] as? String;
         }
         if(dict["currency"]  == [NSNull null]){
         RNparam7   = dict["param7"] as? String;
         }
         if(dict["currency"]  == [NSNull null]){
         RNparam8   = dict["param8"] as? String;
         }
         if(dict["currency"]  == [NSNull null]){
         RNparam9   = dict["param9"] as? String;
         }
         if(dict["currency"]  == [NSNull null]){
         RNparam10  = dict["param10"] as? String;
         }
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
