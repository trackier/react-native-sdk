//
//  APIManager.swift
//  trackier-ios-sdk
//
//  Created by Prakhar Srivastava on 19/03/21.
//

import Foundation

class APIManager: NSObject {
    
    static let sharedInstance = APIManager()
    static var headers = ["User-Agent": Constants.USER_AGENT, "X-Client-SDK": Constants.SDK_VERSION]
    
    override init() {
    }
    
    static func doWork(workRequest: TrackierWorkRequest) {
        switch workRequest.kind {
        case TrackierWorkRequest.KIND_INSTALL:
            let body = workRequest.getData()
            let jsonData = Utils.convertDictToJSON(data: body)
            Logger.debug(message: "Sending install request. Body is: \(jsonData)")
            APIService.post(uri: Constants.INSTALL_URL, body: body, headers: headers)
            break;
        case TrackierWorkRequest.KIND_EVENT:
            let body = workRequest.getEventData()
            let jsonData = Utils.convertDictToJSON(data: body)
            Logger.debug(message: "Sending event request. Body is: \(jsonData)")
            APIService.post(uri: Constants.EVENTS_URL, body: body, headers: headers)
            break;
        case TrackierWorkRequest.KIND_SESSION:
            let body = workRequest.getSessionData()
            let jsonData = Utils.convertDictToJSON(data: body)
            Logger.debug(message: "Sending session request. Body is: \(jsonData)")
            APIService.post(uri: Constants.SESSIONS_URL, body: body, headers: headers)
            break;
        case TrackierWorkRequest.KIND_UNKNOWN:
            fallthrough
        default:
            break;
        }
    }
}
