//
//  Utils.swift
//  trackier-ios-sdk
//
//  Created by Hemant Mann on 19/03/21.
//

import Foundation

class Utils {
    
    static func getDateTimeFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        return formatter
    }
    
    static func formatTime(date: Date) -> String {
        let formatter = getDateTimeFormatter()
        return formatter.string(from: date)
    }
    
    static func getCurrentTime() -> String {
        let date = Date()
        let formatter = getDateTimeFormatter()
        return formatter.string(from: date)
    }
    
    static func convertUnixTsToISO(ts: Int64) -> String {
        let lst = Date(timeIntervalSince1970: TimeInterval(ts))
        return formatTime(date: lst)
    }
    
    static func convertDictToJSON(data: Dictionary<String, Any>) -> String {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
            let decoded = String(data: jsonData, encoding: .utf8)!
            return decoded
        } catch {
            return ""
        }
    }
    
    // Reference: https://stackoverflow.com/questions/34778950/how-to-compare-any-value-types
    static func isEqual<T: Equatable>(type: T.Type, a: Any, b: Any) -> Bool {
        guard let a = a as? T, let b = b as? T else { return false }

        return a == b
    }
}
