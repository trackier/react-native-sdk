//
//  TrackierWorkRequest.swift
//  trackier-ios-sdk
//
//  Created by Hemant Mann on 19/03/21.
//

import Foundation

class TrackierWorkRequest {
    static let KIND_INSTALL = "install"
    static let KIND_EVENT = "event"
    static let KIND_SESSION = "session"
    static let KIND_UNKNOWN = "unknown"
    
    var kind: String
    var installId: String = ""
    var installTime: String = ""
    var eventObj = TrackierEvent(id: "")
    var deviceInfo: DeviceInfo? = nil
    var lastSessionTime: String
    private var appToken: String
    private var mode: String
    
    init(kind: String, appToken: String, mode: String) {
        self.kind = kind
        self.appToken = appToken
        self.mode = mode
        self.lastSessionTime = ""
    }
    
    func getData() -> Dictionary<String, Any> {
        var dict = Dictionary<String, Any>()
        dict["appKey"] = self.appToken
        dict["device"] = deviceInfo?.getDeviceInfo()
        dict["createdAt"] = Utils.getCurrentTime()
        dict["mode"] = self.mode
        dict["installId"] = self.installId.lowercased()
        dict["installTime"] = self.installTime
        return dict
    }
    
    func getEventData() -> Dictionary<String, Any> {
        var dict = getData()
        dict["event"] = self.eventObj.getHashMap()
        return dict
    }
    
    func getSessionData() -> Dictionary<String, Any> {
        var dict = getData()
        dict["lastSessionTime"] = lastSessionTime
        return dict
    }
}
