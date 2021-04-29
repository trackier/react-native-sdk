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
    
    let RNappToken = dict["appToken"] as! String;
    let RNenvironment = dict["environment"] as! String;
    NSLog("inside swift module initializeSDK %@  and  %@",RNappToken,RNenvironment);
    
    let config = TrackierSDKConfig(appToken: RNappToken , env: RNenvironment)
    TrackierSDK.initialize(config: config)
    NSLog("inside swift module initializeSDK");

  }
    
    @objc func trackEvent(_ dict: NSDictionary) -> Void {
      
    NSLog("inside swift module trackEvent");

    }
  
}
