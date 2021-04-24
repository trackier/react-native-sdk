//
//  CacheManager.swift
//  trackier-ios-sdk
//
//  Created by Hemant Mann on 19/03/21.
//

import Foundation

class CacheManager {
    
    private let userDefault = UserDefaults.standard
    
    private let cachePrefix = Constants.SHARED_PREF_NAME
    
    static let shared = CacheManager()

    private init() {}
    
    private func getCacheKey(key: String) -> String {
        return self.cachePrefix + "_" + key
    }
    
    public static func getString(key: String) -> String {
        let val = shared.userDefault.string(forKey: shared.getCacheKey(key: key))
        if val == nil {
            return ""
        }
        return val!
    }
    
    public static func setString(key: String, value: String) {
        shared.userDefault.set(value, forKey: shared.getCacheKey(key: key))
    }
    
    public static func getInt(key: String) -> Int64 {
        let val = shared.userDefault.integer(forKey: shared.getCacheKey(key: key))
        return Int64(val)
    }
    
    public static func setInt(key: String, value: Int64) {
        shared.userDefault.set(value, forKey: shared.getCacheKey(key: key))
    }
    
    public static func setBool(key: String, value: Bool) {
        shared.userDefault.set(value, forKey: shared.getCacheKey(key: key))
    }
    
    public static func getBool(key: String) -> Bool {
        return shared.userDefault.bool(forKey: shared.getCacheKey(key: key))
    }
}
