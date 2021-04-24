//
//  TrackierSDKConfig.swift
//  trackier-ios-sdk
//
//  Created by Prakhar Srivastava on 18/03/21.
//

import Foundation

public class TrackierSDKConfig {
    public static let ENVIRONMENT_PRODUCTION = Constants.ENV_PRODUCTION
    public static let ENV_DEVELOPMENT = Constants.ENV_DEVELOPMENT
    
    var appToken: String
    var env: String

    public init(appToken: String, env: String) {
        self.appToken = appToken
        self.env = env
        if env == TrackierSDKConfig.ENVIRONMENT_PRODUCTION {
            Logger.setLogLevel(level: Logger.LEVEL_ERROR)
        } else {
            Logger.setLogLevel(level: Logger.LEVEL_DEBUG)
        }
    }

    func setLogLevel(level: UInt) {
        Logger.setLogLevel(level: level)
    }
}
