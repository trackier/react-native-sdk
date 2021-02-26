package com.trackier.reactnsdk;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class TrackierSDK extends ReactContextBaseJavaModule {

    private Map<String, String> ev;

    public TrackierSDK(ReactApplicationContext context) {
        super(context);
    }

    @Override
    public String getName() {
        return "TrackierSDK";
    }

    @ReactMethod
    public void initializeSDK(ReadableMap initializeMap) {
        com.trackier.sdk.TrackierSDKConfig sdkConfig = new com.trackier.sdk.TrackierSDKConfig(getReactApplicationContext(), initializeMap.getString("appToken"), initializeMap.getString("environment"));
        com.trackier.sdk.TrackierSDK.initialize(sdkConfig);
    }

    @ReactMethod
    public void trackEvent(ReadableMap trackierEventMap) {
        com.trackier.sdk.TrackierEvent trackierEvent = new com.trackier.sdk.TrackierEvent(trackierEventMap.getString("eventID"));
        
        trackierEvent.orderId = null ;
        trackierEvent.currency = null ;
        trackierEvent.param1 = null ;
        trackierEvent.param2 = null ;
        trackierEvent.param3 = null ;
        trackierEvent.param4 = null ;
        trackierEvent.param5 = null ;
        trackierEvent.param6 = null ;
        trackierEvent.param7 = null ;
        trackierEvent.param8 = null ;
        trackierEvent.param9 = null ;
        trackierEvent.param10 = null ;
        trackierEvent.revenue = null ;

        if(trackierEventMap.getString("orderId")!= null){

            trackierEvent.orderId = trackierEventMap.getString("orderId");
        }
        if(trackierEventMap.getString("currency")!= null){
            
           trackierEvent.currency = trackierEventMap.getString("currency");
        }
        if(trackierEventMap.getString("param1")!= null){
            
        trackierEvent.param1 = trackierEventMap.getString("param1");
        }
        if(trackierEventMap.getString("param2")!= null){
            
        trackierEvent.param2 = trackierEventMap.getString("param2");
        }
        if(trackierEventMap.getString("param3")!= null){
            
        trackierEvent.param3 = trackierEventMap.getString("param3");
        }
        if(trackierEventMap.getString("param4")!= null){
            
        trackierEvent.param4 = trackierEventMap.getString("param4");
        }
        if(trackierEventMap.getString("param5")!= null){
            
        trackierEvent.param5 = trackierEventMap.getString("param5");
        }
        if(trackierEventMap.getString("param6")!= null){
            
        trackierEvent.param6 = trackierEventMap.getString("param6");
        }
        if(trackierEventMap.getString("param7")!= null){
            
        trackierEvent.param7 = trackierEventMap.getString("param7");
        }
        if(trackierEventMap.getString("param8")!= null){
            
        trackierEvent.param8 = trackierEventMap.getString("param8");
        }
        if(trackierEventMap.getString("param9")!= null){
            
        trackierEvent.param9 = trackierEventMap.getString("param9");
        }
        if(trackierEventMap.getString("param10")!= null){
            
        trackierEvent.param10 = trackierEventMap.getString("param10");
        }
        if(trackierEventMap.getDouble("revenue")!= null){
            
        trackierEvent.revenue = trackierEventMap.getDouble("revenue");
        }

        Map<String, Object> ev = TrackierUtil.toMap(trackierEventMap.getMap("ev"));
        if (ev != null) {
            for (Map.Entry<String, Object> entry : ev.entrySet()) {
                addEventValues(entry.getKey(), entry.getValue().toString());
            }
        }
        com.trackier.sdk.TrackierSDK.trackEvent(trackierEvent);
    }

    public void addEventValues(String key, String value) {
        if (ev == null) {
            ev = new LinkedHashMap<String, String>();
        }
        String previousValue = ev.put(key, value);
        if (previousValue != null) {
        }
    }

}