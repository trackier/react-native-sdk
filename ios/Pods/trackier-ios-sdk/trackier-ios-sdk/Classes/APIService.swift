//
//  APIService.swift
//  trackier-ios-sdk
//
//  Created by Hemant Mann on 19/03/21.
//

import Foundation
import Alamofire

import Foundation
import Alamofire

enum NetworkErrorCode: Int {
    case timeOut = -1001
    case connectionLost = -1005
}

class NetworkRequestRetrier: RequestRetrier {
    
    // [Request url: Number of times retried]
    private var retriedRequests: [String: Int] = [:]
    
    func should(_ manager: SessionManager,
                retry request: Request,
                with error: Error,
                completion: @escaping RequestRetryCompletion) {
        let url = request.request?.url?.absoluteString ?? ""
        
        let errorGenerated = error as NSError
        guard request.response?.statusCode ?? 0 < 400
        else {
            exponentialRetry(url: url, completion: completion)
            return
        }
        switch errorGenerated.code {
        case NetworkErrorCode.timeOut.rawValue, NetworkErrorCode.connectionLost.rawValue :
            exponentialRetry(url: url, completion: completion)
            break
            
        default:
            removeCachedUrlRequest(url: url)
            completion(false, 0.0)
        }
    }
    
    private func exponentialRetry(url: String, completion: @escaping RequestRetryCompletion) {
        let retryCount = retriedRequests[url] ?? 0
        
        if retryCount < 5 {
            retriedRequests[url] = retryCount + 1
            completion(true, Double(retryCount) * 1) // retry after 0.5 second
        } else {
            removeCachedUrlRequest(url: url)
            completion(false, 0.0) // don't retry
        }
    }
    
    private func removeCachedUrlRequest(url: String?) {
        guard let url = url else {
            return
        }
        retriedRequests.removeValue(forKey: url)
    }
}


class APIService {
    var sessionManager = SessionManager()          // Create a session manager
    var requestRetrier = NetworkRequestRetrier()   // Create a request retrier
    static var shared = APIService()
    
    private init() {
        sessionManager.retrier = requestRetrier
    }
    
    private func request(uri : String, method: HTTPMethod, body : [String : Any], headers : [String : String]?) {
        sessionManager.request(uri, method: method, parameters: body, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (responseObj) -> Void in
            Logger.debug(message: "Response is \(responseObj)")
        }
    }
    
    static func post(uri : String, body : [String : Any], headers : [String : String]?){
        shared.request(uri: uri, method: HTTPMethod.post, body: body, headers: headers)
    }
}
