package com.trackierreactnativesdk;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.trackier.sdk.TrackierEvent;

import java.util.Map;

public class TrackierReactSDK extends ReactContextBaseJavaModule {
    TrackierReactSDK(ReactApplicationContext context) {
       super(context);
   }

    @Override
    public String getName() {
        return "TrackierSDK";
    }

    @ReactMethod
    public void initializeSDK(ReadableMap initializeMap) {
        com.trackier.sdk.TrackierSDKConfig sdkConfig = new  com.trackier.sdk.TrackierSDKConfig(getReactApplicationContext(), initializeMap.appToken, initializeMap.environment);
        com.trackier.sdk.TrackierSDK.initialize(sdkConfig);
    }



    @ReactMethod
    public void TrackEvent(ReadableMap trackierEventMap) {

        final TrackEvent event = new TrackEvent(eventToken);
        if (!event.isValid()) {
            return;
        }

        com.trackier.sdk.TrackierEvent trackierEvent = new com.trackier.sdk.TrackierEvent(trackierEventMap.getString("id"));
        trackierEvent.orderId = trackierEventMap.getString("orderId");
        trackierEvent.currency = trackierEventMap.getString("currency");
        trackierEvent.orderId = trackierEventMap.getString("param1");
        trackierEvent.orderId = trackierEventMap.getString("param2");
        trackierEvent.orderId = trackierEventMap.getString("param3");
        trackierEvent.orderId = trackierEventMap.getString("param4");
        trackierEvent.orderId = trackierEventMap.getString("param5");
        trackierEvent.orderId = trackierEventMap.getString("param6");
        trackierEvent.orderId = trackierEventMap.getString("param7");
        trackierEvent.orderId = trackierEventMap.getString("param8");
        trackierEvent.orderId = trackierEventMap.getString("param9");
        trackierEvent.orderId = trackierEventMap.getString("param10");
        trackierEvent.orderId = trackierEventMap.getString("revenue");

        Map<String, Object> ev = TrackierUtil.toMap(trackierEventMap.getMap("ev"));
            if (null != ev) {
                for (Map.Entry<String, Object> entry : ev.entrySet()) {
                    trackierEvent.set(entry.getKey(), entry.getValue().toString());
                }
            }

        com.trackier.sdk.TrackierSDK.trackEvent(trackierEvent);
    }


}