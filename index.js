'use strict';

import { 
	NativeModules
} from 'react-native';

const module_trackier = NativeModules.TrackierSDK;

var TrackierConfig = function(appToken,environment) {
	this.appToken = appToken;
	this.environment = environment;
}

var TrackierSDK = {};

TrackierSDK.initialize = function(trackierConfig) {
	module_trackier.initializeSDK(trackierConfig)
};

TrackierSDK.trackEvent = function(trackierEvent) {
	let isValidArgs = true;
	let props = ['eventId', 'orderId', 'currency', 'param1', 'param2', 'param3', 'param4', 'param5', 'param6', 'param7', 'param8', 'param9', 'param10'];
	props.forEach(function (v, k) {
		console.log("trackierEvent[v] "+ trackierEvent[v]+ "typeof trackierEvent[v] " + typeof trackierEvent[v])
		if (typeof trackierEvent[v] != 'undefined' && typeof trackierEvent[v] != 'string') {
			isValidArgs = false;
			return false;
		}
	})
	if (isValidArgs && (typeof trackierEvent.revenue != 'undefined' && typeof trackierEvent.revenue != 'number')) {
		return;
	}
	module_trackier.trackEvent(trackierEvent)
};

TrackierConfig.EnvironmentDevelopment = "development";
TrackierConfig.EnvironmentProduction = "production";

var TrackierEvent = function(eventId) {
	this.eventId = eventId;
	this.orderId = null;
	this.currency = null;
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
	this.revenue = null;

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
	TrackierEvent,
}

