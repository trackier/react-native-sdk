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
        trackierEvent.param1 = trackierEventMap.getString("param1");
        trackierEvent.param2 = trackierEventMap.getString("param2");
        trackierEvent.param3 = trackierEventMap.getString("param3");
        trackierEvent.param4 = trackierEventMap.getString("param4");
        trackierEvent.param5 = trackierEventMap.getString("param5");
        trackierEvent.param6 = trackierEventMap.getString("param6");
        trackierEvent.param7 = trackierEventMap.getString("param7");
        trackierEvent.param8 = trackierEventMap.getString("param8");
        trackierEvent.param9 = trackierEventMap.getString("param9");
        trackierEvent.param10 = trackierEventMap.getString("param10");
        trackierEvent.revenue = trackierEventMap.getString("revenue");


        Map<String, Object> ev = TrackierUtil.toMap(trackierEventMap.getMap("ev"));
            if (null != ev) {
                for (Map.Entry<String, Object> entry : ev.entrySet()) {
                    trackierEvent.set(entry.getKey(), entry.getValue().toString());
                }
            }

        com.trackier.sdk.TrackierSDK.trackEvent(trackierEvent);
    }


}