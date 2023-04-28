'use strict';

import { 
	NativeModules,
	NativeEventEmitter,
	Platform,
} from 'react-native';

const module_trackier = NativeModules.TrackierSDK;

let module_trackier_emitter = null;
if (Platform.OS === "android") {
	module_trackier_emitter = new NativeEventEmitter(NativeModules.TrackierSDK);
} else if (Platform.OS === "ios") {
	module_trackier_emitter = new NativeEventEmitter(NativeModules.TrackierSDK);
}

var TrackierConfig = function(appToken,environment) {
	this.appToken = appToken;
	this.environment = environment;
	this.secretId = '';
	this.secretKey = '';
}

var TrackierSDK = {};

TrackierSDK.initialize = function(trackierConfig) {
	module_trackier.initializeSDK(trackierConfig)
}

TrackierConfig.prototype.setAppSecret = function(key, value) {
	this.secretId = key;
	this.secretKey = value;
}

TrackierSDK.setEnabled = function (value) {
	module_trackier.setEnabled(value)
}

TrackierSDK.getTrackierId = async function () {
	const id = await module_trackier.getTrackierId()
	return id;
}

TrackierSDK.setUserId = function(userId) {
	module_trackier.setUserId(userId)
}

TrackierSDK.setUserEmail = function(userEmail) {
	module_trackier.setUserEmail(userEmail)
}

TrackierSDK.setUserName = function(userName) {
	module_trackier.setUserName(userName)
}

TrackierSDK.setUserPhone = function(userPhone) {
	module_trackier.setUserPhone(userPhone)
}

TrackierSDK.trackAsOrganic = function(value) {
	module_trackier.trackAsOrganic(value)
}

TrackierSDK.setLocalRefTrack = function (value, delimeter) {
	module_trackier.setLocalRefTrack(value, delimeter)
}

TrackierSDK.setUserAdditionalDetails = function (key, value) {
	module_trackier.setUserAdditionalDetails(value, delimeter)
}

TrackierSDK.waitForATTUserAuthorization = function (timeoutInterval) {
	module_trackier.waitForATTUserAuthorization(timeoutInterval)
}

TrackierSDK.trackEvent = function(trackierEvent) {
	let isValidArgs = true;
	let props = ['eventId', 'orderId', 'currency', 'couponCode', 'param1', 'param2', 'param3', 'param4', 'param5', 'param6', 'param7', 'param8', 'param9', 'param10'];
	props.forEach(function (v, k) {
		if (trackierEvent[v] === null || trackierEvent[v] === undefined) {
			return;
		}
		if (typeof trackierEvent[v] != 'string') {
			isValidArgs = false;
			return false;
		}
	})
	if (!isValidArgs || (typeof trackierEvent.revenue != 'undefined' && typeof trackierEvent.revenue != 'number')) {
		return;
	}
	
	module_trackier.trackEvent(trackierEvent)
};

TrackierConfig.EnvironmentDevelopment = "development";
TrackierConfig.EnvironmentProduction = "production";
TrackierConfig.EnvironmentTesting = "testing";

TrackierConfig.prototype.setDeferredDeeplinkCallbackListener = function(deferredDeeplinkCallbackListener) {
	if (Platform.OS === "android") {
		this.hasDeferredDeeplinkCallback = true;
		module_trackier_emitter.addListener('trackier_deferredDeeplink', deferredDeeplinkCallbackListener);
	} else if (Platform.OS === "ios") {
		this.hasDeferredDeeplinkCallback = true;
		module_trackier_emitter.addListener('trackier_deferredDeeplink', deferredDeeplinkCallbackListener);
	}
};

var TrackierEvent = function(eventId) {
	this.eventId = eventId;
	this.orderId = null;
	this.currency = null;
	this.discount = 0;
	this.couponCode = null;
	this.param1 = null;
	this.param2 = null;
	this.param3 = null;
	this.param4 = null;
	this.param5 = null;
	this.param6 = null;
	this.param7 = null;
	this.param8 = null;
	this.param9 = null;
	this.param10 = null;
	this.revenue = 0;

	this.ev = {};
}

TrackierEvent.LEVEL_ACHIEVED = "1CFfUn3xEY"
TrackierEvent.ADD_TO_CART = "Fy4uC1_FlN"
TrackierEvent.ADD_TO_WISHLIST = "AOisVC76YG"
TrackierEvent.COMPLETE_REGISTRATION = "mEqP4aD8dU"
TrackierEvent.TUTORIAL_COMPLETION = "99VEGvXjN7"
TrackierEvent.PURCHASE = "Q4YsqBKnzZ"
TrackierEvent.SUBSCRIBE = "B4N_In4cIP"
TrackierEvent.START_TRIAL = "jYHcuyxWUW"
TrackierEvent.ACHIEVEMENT_UNLOCKED = "xTPvxWuNqm"
TrackierEvent.CONTENT_VIEW = "Jwzois1ays"
TrackierEvent.TRAVEL_BOOKING = "yP1-ipVtHV"
TrackierEvent.SHARE = "dxZXGG1qqL"
TrackierEvent.INVITE = "7lnE3OclNT"
TrackierEvent.LOGIN = "o91gt1Q0PK"
TrackierEvent.UPDATE = "sEQWVHGThl"

TrackierEvent.prototype.setEventValue = function(key, value) {
	if (typeof key !== 'string') {
		return;
	}
	this.ev[key] = value;
};

module.exports = {
	TrackierConfig,
	TrackierSDK,
	TrackierEvent
}

