//
//  Constants.swift
//  trackier-ios-sdk
//
//  Created by Hemant Mann on 19/03/21.
//

import Foundation

class Constants {
    static let SDK_VERSION = "1.3.2"
    static let USER_AGENT = "com.trackier.sdk:ios-sdk:" + SDK_VERSION
    static let API_VERSION = "v1"
    static let BASE_URL = "https://events.trackier.io/" + API_VERSION
    static let INSTALL_URL = BASE_URL + "/install"
    static let EVENTS_URL = BASE_URL + "/event"
    static let SESSIONS_URL = BASE_URL + "/session"

    static let LOG_TAG = "com.trackier.sdk"
    static let SHARED_PREF_NAME = "com.trackier.sdk"
    
    static let SHARED_PREF_IS_INSTALL_TRACKED = "is_install_tracked"
    static let SHARED_PREF_INSTALL_ID = "install_id"
    static let SHARED_PREF_LAST_SESSION_TIME = "last_session_time"

    static let ENV_PRODUCTION = "production"
    static let ENV_DEVELOPMENT = "development"

    static let DATE_TIME_FORMAT = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    static let UNKNOWN_EVENT = "unknown"
}
