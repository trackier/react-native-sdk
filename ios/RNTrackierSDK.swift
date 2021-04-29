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

        let RNcurrency = dict["currency"] as! String;
        let RNrevenue  = dict["revenue"] as! String;
        let RNeventId  = dict["eventId"] as! String;
        let RNorderId  = dict["orderId"] as! String;
        let RNparam1   = dict["param1"] as! String;
        let RNparam2   = dict["param2"] as! String;
        let RNparam3   = dict["param3"] as! String;
        let RNparam4   = dict["param4"] as! String;
        let RNparam5   = dict["param5"] as! String;
        let RNparam6   = dict["param6"] as! String;
        let RNparam7   = dict["param7"] as! String;
        let RNparam8   = dict["param8"] as! String;
        let RNparam9   = dict["param9"] as! String;
        let RNparam10  = dict["param10"] as! String;
        let RNev       = {};
              
        let event = TrackierEvent(id: RNeventId)
        //event.addEventValue(RNev)
        event.setRevenue(revenue: RNrevenue, currency: RNcurrency)
        event.param1 = RNparam1
        event.param2 = RNparam2
        event.param3 = RNparam3
        event.param4 = RNparam4
        event.param5 = RNparam5
        event.param6 = RNparam6
        event.param7 = RNparam7
        event.param8 = RNparam8
        event.param9 = RNparam9
        event.param10 = RNparam10
        DispatchQueue.global().async {
            sleep(1)
            TrackierSDK.trackEvent(event: event)
        }
      
      NSLog("inside swift module trackEvent");

    }
  
}
