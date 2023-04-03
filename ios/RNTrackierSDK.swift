//  RNTrackierSDK.swift
//  TrackierSDK
//
//  Created by Prakhar Srivastava on 29/04/21.
//  Copyright © 2021 Trackier. All rights reserved.
//

import Foundation
import trackier_ios_sdk

@objc(RNTrackierSDK)
class RNTrackierSDK: NSObject {

	var secretId: String = ""
    var secretKey: String = ""

	@objc func initializeSDK(_ dict: NSDictionary) -> Void {
		let appToken = dict["appToken"] as! String;
		let environment = dict["environment"] as! String;
		let config = TrackierSDKConfig(appToken: appToken , env: environment)
		config.setSDKType(sdkType: "react_native_sdk")
		config.setSDKVersion(sdkVersion: "1.6.39")
		config.setAppSecret(secretId: secretId, secretKey: secretKey)
		TrackierSDK.initialize(config: config)
	}

	 @objc func setAppSecret(_ dict: NSDictionary) -> Void {
        secretId = dict["secretId"] as! String;
        secretKey = dict["secretKey"] as! String;
    }

	@objc func trackEvent(_ dict: NSDictionary) -> Void {
		let currency: String = dict["currency"] as? String ?? ""
		let revenue: Float64 = (dict["revenue"] as? Float64 ?? 0.0)
		let discount: Float64 = (dict["discount"] as? Float64 ?? 0.0)
		let couponCode: String = dict["couponCode"] as? String ?? ""
		let eventId: String = dict["eventId"] as! String
		let orderId: String = dict["orderId"] as? String ?? ""
		let param1: String = dict["param1"] as? String ?? ""
		let param2: String = dict["param2"] as? String ?? ""
		let param3: String = dict["param3"] as? String ?? ""
		let param4: String = dict["param4"] as? String ?? ""
		let param5: String = dict["param5"] as? String ?? ""
		let param6: String = dict["param6"] as? String ?? ""
		let param7: String = dict["param7"] as? String ?? ""
		let param8: String = dict["param8"] as? String ?? ""
		let param9: String = dict["param9"] as? String ?? ""
		let param10: String = dict["param10"] as? String ?? ""
		var ev:Dictionary<String,Any> = dict["ev"] as? Dictionary<String,Any> ?? [:]

		for (key, value) in ev {
			ev[key] = value
		}

		let event = TrackierEvent(id: eventId)
		event.setRevenue(revenue: revenue, currency: currency)
		event.orderId = orderId
		event.setCouponCode(couponCode: couponCode)
		event.setDiscount(discount: discount)
		event.param1  = param1
		event.param2  = param2
		event.param3  = param3
		event.param4  = param4
		event.param5  = param5
		event.param6  = param6
		event.param7  = param7
		event.param8  = param8
		event.param9  = param9
		event.param10 = param10
		for (key, value) in ev {
			event.addEventValue(prop: key, val: value)
		}
		TrackierSDK.trackEvent(event: event)
	}

	@objc func setEnabled(_ value: Bool) {
		TrackierSDK.setEnabled(value: value)
	}

	@objc func setUserId(_ userId: String) {
		TrackierSDK.setUserID(userId: userId)
	}

	@objc func setUserEmail(_ userEmail: String) {
		TrackierSDK.setUserEmail(userEmail: userEmail)
	}

	@objc func setUserName(_ userName: String) {
		TrackierSDK.setUserName(userName: userName)
	}
	
	@objc func setUserPhone(_ userPhone: String) {
		TrackierSDK.setUserPhone(userPhone: userPhone)
	}
	
	@objc func trackAsOrganic(_ value: Bool) {
		// Do nothing, android only method
	}

	@objc func setLocalRefTrack(_ value: Bool, withDelim delimeter: String) {
		// Do nothing, android only method
	}

	@objc func setUserAdditionalDetails(_ key: String, withValue value: String) {
		// TODO
	}
}

