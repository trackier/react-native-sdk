//
//  DeviceInfo.swift
//  trackier-ios-sdk
//
//  Created by Prakhar Srivastava on 19/03/21.
//  Modified by Hemant Mann
//

import Foundation

class DeviceInfo {
    
    let buildInfo = Bundle.main.infoDictionary
    var name = UIDevice.current.name
    var systemVersion = UIDevice.current.systemVersion
    var model = UIDevice.current.model
    var batteryLevel = UIDevice.current.batteryLevel
    var isBatteryMonitoringEnabled = UIDevice.current.isBatteryMonitoringEnabled
    
    public func getDeviceInfo() -> Dictionary<String, Any> {
        var dict = Dictionary<String, Any>()
        #if os(iOS)
        dict["osName"] = "iOS"
        #elseif os(watchOS)
        dict["osName"] = "watchOS"
        #elseif os(tvOS)
        dict["osName"] = "tvOS"
        #endif
        
        dict["name"] = name
        dict["buildName"] = buildInfo?["BuildMachineOSBuild"]
        dict["osVersion"] = systemVersion
        dict["manufacturer"] = "Apple"
        dict["hardwareName"] = name
        dict["model"] = model
        dict["apiLevel"] = buildInfo?["DTPlatformBuild"]
        dict["brand"] = model
        dict["packageName"] = buildInfo?["CFBundleIdentifier"]
        dict["appVersion"] = buildInfo?["CFBundleShortVersionString"]
        dict["appNumericVersion"] = buildInfo?["CFBundleNumericVersion"]
        dict["sdkVersion"] = Constants.SDK_VERSION
        dict["language"] = Locale.current.languageCode
        dict["country"] = NSLocale.current.regionCode
        dict["timezone"] = TimeZone.current.identifier
        dict["screenSize"] = getScreenSize()
        dict["screenDensity"] = getScreenDensity()
        dict["screenFormat"] = name
        // TODO: screenSize,screenDensity?
        dict["batteryLevel"] = batteryLevel
        dict["ibme"] = isBatteryMonitoringEnabled
        #if targetEnvironment(simulator)
        dict["isEmulator"] = true
        #else
        dict["isEmulator"] = false
        #endif
        return dict
    }
    
    private func getScreenSize() -> String {
        let screenSize: CGRect = UIScreen.main.bounds
        return  "\(screenSize)"
    }
    
    private func getScreenDensity() -> String {
        let screenDensity: CGFloat = UIScreen.main.scale
        return  "\(screenDensity)"
    }
}
