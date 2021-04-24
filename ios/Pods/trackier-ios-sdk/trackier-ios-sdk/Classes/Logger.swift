//
//  Logger.swift
//  trackier-ios-sdk
//
//  Created by Hemant Mann on 23/03/21.
//

import Foundation
import Willow

class Logger {
    static let LEVEL_TRACE: UInt = 1;
    static let LEVEL_DEBUG: UInt = 2;
    static let LEVEL_INFO: UInt = 3;
    static let LEVEL_WARNING: UInt = 4;
    static let LEVEL_ERROR: UInt = 5;
    static let LEVEL_FATAL: UInt = 6;
    
    var logLevel: UInt = 4;
//    var internalLogger = OSLog(subsystem: Constants.LOG_TAG, category: "ios-sdk")
    let defaultLogger = Willow.Logger(logLevels: [.all], writers: [ConsoleWriter()])
    
    private static let shared = Logger()

    private init() {}
    
    static func setLogLevel(level: UInt) {
        if level >= Logger.LEVEL_TRACE || level <= Logger.LEVEL_FATAL {
            shared.logLevel = level
        }
    }
    
    static func log(level: UInt, message: String) {
        if shared.logLevel > level {
            return
        }
        switch level {
        case LEVEL_TRACE:
            fallthrough
        case LEVEL_DEBUG:
            shared.defaultLogger.debugMessage(message)
        case LEVEL_INFO:
            shared.defaultLogger.infoMessage(message)
        case LEVEL_WARNING:
            shared.defaultLogger.warnMessage(message)
            fallthrough
        case LEVEL_ERROR:
            fallthrough
        case LEVEL_FATAL:
            shared.defaultLogger.errorMessage(message)
        default:
            return
        }
    }
    
    static func trace(message: String) {
        log(level: LEVEL_TRACE, message: message)
    }
    
    static func debug(message: String) {
        log(level: LEVEL_DEBUG, message: message)
    }
    
    static func info(message: String) {
        log(level: LEVEL_INFO, message: message)
    }
    
    static func warning(message: String) {
        log(level: LEVEL_WARNING, message: message)
    }
    
    static func error(message: String) {
        log(level: LEVEL_ERROR, message: message)
    }
    
    static func fatal(message: String) {
        log(level: LEVEL_FATAL, message: message)
    }
}
