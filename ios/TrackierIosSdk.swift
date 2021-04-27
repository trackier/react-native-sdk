//
//  TrackierIosSdk.swift
//  TrackierSDK
//
//  Created by Prakhar Srivastava on 27/04/21.
//  Copyright © 2021 Trackier. All rights reserved.
//

import Foundation
import trackier_ios_sdk

@objc(TrackierSDK)
class TrackierIosSDK: NSObject {
  
  @objc func initializeSDK(dict: NSDictionary) -> Void {
    
    let RNappToken = dict["appToken"] as! String;
    let RNenvironment = dict["environment"] as! String;
    
    let config = TrackierSDKConfig(appToken: RNappToken , env: RNenvironment)
    TrackierSDK.initialize(config: config)

  }
  
}

