'use strict';

import { 
    NativeEventEmitter,
    NativeModules,
    Platform,
} from 'react-native';

const module_trackier = NativeModules.TrackierSDK;

let module_trackier_emitter = null;
if (Platform.OS === "android") {
    module_trackier_emitter = new NativeEventEmitter(NativeModules.TrackierSDK);
} else if (Platform.OS === "ios") {
    
}

var TrackierConfig = function(appToken,environment){
    this.appToken = appToken ;
    this.environment = environment ;
}

var TrackierSDK = {};

TrackierSDK.initialize = function(trackierConfig){
    module_trackier.initializeSDK(trackierConfig)
};

TrackierSDK.trackEvent = function(trackEvent){
    module_trackier.trackEvent(trackEvent)
};

var TrackEvent = function(eventId) {
    this.eventId = eventId;
    this.orderId = null ;
    this.currency = null ;
    this.param1 = null ;
    this.param2 = null ;
    this.param3 = null ;
    this.param4 = null ;
    this.param5 = null ;
    this.param6 = null ;
    this.param7 = null ;
    this.param8 = null ;
    this.param9 = null ;
    this.param10 = null ;
    this.revenue = null ;

    this.ev = {};

    this.LEVEL_ACHIEVED = "1CFfUn3xEY"
    this.ADD_TO_CART = "Fy4uC1_FlN"
    this.ADD_TO_WISHLIST = "AOisVC76YG"
    this.COMPLETE_REGISTRATION = "mEqP4aD8dU"
    this.TUTORIAL_COMPLETION = "99VEGvXjN7"
    this.PURCHASE = "Q4YsqBKnzZ"
    this.SUBSCRIBE = "B4N_In4cIP"
    this.START_TRIAL = "jYHcuyxWUW"
    this.ACHIEVEMENT_UNLOCKED = "xTPvxWuNqm"
    this.CONTENT_VIEW = "Jwzois1ays"
    this.TRAVEL_BOOKING = "yP1-ipVtHV"
    this.SHARE = "dxZXGG1qqL"
    this.INVITE = "7lnE3OclNT"
    this.LOGIN = "o91gt1Q0PK"
    this.UPDATE = "sEQWVHGThl"
}

TrackEvent.prototype.setEventValue = function(key, value) {
    if (typeof key !== 'string' || typeof value !== 'string') {
        return;
    }
    this.ev[key] = value;
};

module.exports = {
    TrackierConfig,
    TrackierSDK,
    TrackEvent,
}
