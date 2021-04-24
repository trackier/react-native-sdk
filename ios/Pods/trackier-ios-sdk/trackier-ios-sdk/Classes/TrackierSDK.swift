//
//  TrackierSDK.swift
//  trackier-ios-sdk
//
//  Created by Prakhar Srivastava on 18/03/21.
//

import Foundation
import os

public class TrackierSDK {
    private var isInitialized = false
    private var instance = TrackierSDKInstance()
    
    static let shared = TrackierSDK()
    
    private init() {}
    
    public static func initialize(config: TrackierSDKConfig) {
        if (shared.isInitialized) {
            Logger.warning(message: "SDK Already initialized!")
            return
        }
        shared.isInitialized = true
        Logger.info(message: "Trackier SDK \(Constants.SDK_VERSION) initialized")
        shared.instance.initialize(config: config)
    }

    public static func isEnabled() -> Bool {
        return shared.instance.isEnabled
    }

    public static func setEnabled(value : Bool) {
        shared.instance.isEnabled = value
    }
   
    public static func trackEvent(event: TrackierEvent) {
        if (!shared.isInitialized) {
            Logger.warning(message: "SDK Not Initialized")
            return
        }
        if (!isEnabled()) {
            Logger.warning(message: "SDK Disabled")
            return
        }
        shared.instance.trackEvent(event: event)
    }
    
    public static func trackSession() {
        shared.instance.trackSession()
    }
    
    public static func setMinSessionDuration(val: UInt64) {
        if val > 0 {
            shared.instance.minSessionDuration = Int64(val)
        }
    }
}
