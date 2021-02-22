'use strict';

import { 
    NativeEventEmitter,
    NativeModules,
    Platform,
} from 'react-native';

const module_trackier = NativeModules.TrackierReactSDK;


let module_adjust_emitter = null;
if (Platform.OS === "android") {
    module_adjust_emitter = new NativeEventEmitter(NativeModules.TrackierReactSDK);
} else if (Platform.OS === "ios") {
    
}

var initializeSDKParams = function(appToken,environment){

    this.appToken = appToken ;
    this.environment = environment ;

}

var TrackierSDK = {};

TrackierSDK.initialize = function(initializeSDKParams){

    module_trackier.initializeSDK(initializeSDKParams)
};

TrackierSDK.TrackEvent = function (trackEvent){
    module_trackier.TrackEvent(trackEvent)
};

var trackEvent = function(eventId) {
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
}

TrackEvent.prototype.setEventValue = function(key, value) {
    if (typeof key !== 'string' || typeof value !== 'string') {
        return;
    }
    this.ev[key] = value;
};
