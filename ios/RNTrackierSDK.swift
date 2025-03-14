//  RNTrackierSDK.swift
//  TrackierSDK
//
//  Created by Prakhar Srivastava on 29/04/21.
//  Copyright © 2021 Trackier. All rights reserved.
//

import Foundation
import trackier_ios_sdk
import React

@objc(RNTrackierSDK)
class RNTrackierSDK: RCTEventEmitter, DeepLinkListener {

	var hasListeners = false
	
	override func startObserving() {
		self.hasListeners = true
	}
	
	override func stopObserving() {
		self.hasListeners = false;
	}
	
	func onDeepLinking(result: trackier_ios_sdk.DeepLink) {
		if (!self.hasListeners) {
			return
		}
		if (result.getUrl() == nil) {
			print("Deeplink URL is nil")
		} else {
			sendEvent(withName: "trackier_deferredDeeplink", body: result.getUrl())
		}
	}
	
	open override func supportedEvents() -> [String] {
		["trackier_deferredDeeplink"]
	  }

	@objc func initializeSDK(_ dict: NSDictionary) -> Void {
		let appToken = dict["appToken"] as! String;
		let environment = dict["environment"] as! String;
		let deeplinking = dict["hasDeferredDeeplinkCallback"] as! Bool?
		let config = TrackierSDKConfig(appToken: appToken , env: environment)
		config.setSDKType(sdkType: "react_native_sdk")
		config.setAppSecret(secretId: dict["secretId"] as! String, secretKey: dict["secretKey"] as! String)
		config.setSDKVersion(sdkVersion: "1.6.65")
		if (deeplinking != nil) {
			config.setDeeplinkListerner(listener: self)
		}
		TrackierSDK.initialize(config: config)
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
	
	@objc func waitForATTUserAuthorization(_ timeoutInterval: Int) {
		TrackierSDK.waitForATTUserAuthorization(timeoutInterval: timeoutInterval)
	}

	@objc func updateAppleAdsToken(_ token: String) {
		TrackierSDK.updateAppleAdsToken(token: token)
	}
	
	@objc func getAd(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
		resolve(TrackierSDK.getAd())
	}
	
	@objc func getAdID(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
		resolve(TrackierSDK.getAdID())
	}

	@objc func getCampaign(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
		resolve(TrackierSDK.getCampaign())
	}
	
	@objc func getCampaignID(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
		resolve(TrackierSDK.getCampaignID())
	}
	
	@objc func getAdSet(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
		resolve(TrackierSDK.getAdSet())
	}
	
	@objc func getAdSetID(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
		resolve(TrackierSDK.getAdSetID())
	}
	
	@objc func getChannel(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
		resolve(TrackierSDK.getChannel())
	}
	
	@objc func getP1(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
		resolve(TrackierSDK.getP1())
	}
	
	@objc func getP2(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
		resolve(TrackierSDK.getP2())
	}
	
	@objc func getP3(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
		resolve(TrackierSDK.getP3())
	}
	
	@objc func getP4(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
		resolve(TrackierSDK.getP4())
	}
	
	@objc func getP5(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
		resolve(TrackierSDK.getP5())
	}
	
	@objc func getClickId(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
		resolve(TrackierSDK.getClickId())
	}
	
	@objc func getDlv(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
		resolve(TrackierSDK.getDlv())
	}
	
	@objc func getPid(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
		resolve(TrackierSDK.getPid())
	}
	
	@objc func getIsRetargeting(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
		resolve(TrackierSDK.getIsRetargeting())
	}

	@objc func getTrackierId(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
		resolve(TrackierSDK.getTrackierId())
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

	@objc func fireInstall() {
		// Do nothing, android only method
	}

	@objc func setMacAddress(_ value: String) {
		// Do nothing, android only method
	}
	
	 @objc func setIMEI(_ key: String, withValue Value: String) {
		// Do nothing, android only method
	}

	@objc func parseDeepLink(_ url: String) {
		TrackierSDK.parseDeepLink(uri: url)
	}

}

