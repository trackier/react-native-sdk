package com.reactlibrary;

import android.util.Log;

import java.util.Map;
import java.util.LinkedHashMap;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;

public class TrackierSDK extends ReactContextBaseJavaModule {

	String secretId = "";
	String secretKey = "";

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
		sdkConfig.setSDKType("react_native_sdk");
		sdkConfig.setSDKVersion("1.6.30");
		sdkConfig.setAppSecret(secretId,secretKey);
		com.trackier.sdk.TrackierSDK.initialize(sdkConfig);
	}

	@ReactMethod
	public void getAppSecretKey(ReadableMap readableMap){
		secretId = readableMap.getString("secretId");
		secretKey = readableMap.getString("secretKey");
	}

	@ReactMethod
	public void setEnabled(boolean value) {
		com.trackier.sdk.TrackierSDK.setEnabled(value);
	}

	@ReactMethod
	public void getTrackierId(Promise promise) {
		String id = com.trackier.sdk.TrackierSDK.getTrackierId();
		promise.resolve(id);
	}

	@ReactMethod
	 public void setUserId(String userId) {
		com.trackier.sdk.TrackierSDK.setUserId(userId);
	} 

	@ReactMethod
	public void trackAsOrganic(boolean value) {
		com.trackier.sdk.TrackierSDK.trackAsOrganic(value);
	}

	@ReactMethod
	public void setUserEmail(String userEmail) {
		com.trackier.sdk.TrackierSDK.setUserEmail(userEmail);
	}

	@ReactMethod
	public void setUserName(String userName) {
		com.trackier.sdk.TrackierSDK.setUserName(userName);
	}

	@ReactMethod
	public void setUserPhone(String userPhone) {
		com.trackier.sdk.TrackierSDK.setUserPhone(userPhone);
	}

	@ReactMethod
	public void setLocalRefTrack(boolean value, String delimeter) {
		com.trackier.sdk.TrackierSDK.setLocalRefTrack(value, delimeter);
	}

	@ReactMethod
	public void setUserAdditionalDetails(ReadableMap userAdditionalDetailsMap) {
		// if (checkKey(userAdditionalDetailsMap, "userAdditionalMap")) {
		// 	Map<String, Object> userAdditionalDetail = TrackierUtil.toMap(userAdditionalDetailsMap.getMap("userAdditionalMap"));
		// 	Map<String, Object> ev = new LinkedHashMap<String, Object>();
		// 	if (userAdditionalDetail != null) {
		// 		for (Map.Entry<String, Object> entry : userAdditionalDetail.entrySet()) {
		// 			ev.put(entry.getKey(), entry.getValue().toString());
		// 		}
		// 	}
		// 	com.trackier.sdk.TrackierSDK.setUserAdditionalDetails(userAdditionalDetail);
		// }
	}

	@ReactMethod
	public void trackEvent(ReadableMap trackierEventMap) {
		com.trackier.sdk.TrackierEvent trackierEvent = new com.trackier.sdk.TrackierEvent(trackierEventMap.getString("eventId"));
		
		trackierEvent.orderId = null;
		trackierEvent.currency = null;
		trackierEvent.discount = null;
		trackierEvent.couponCode = null;
		trackierEvent.param1 = null;
		trackierEvent.param2 = null;
		trackierEvent.param3 = null;
		trackierEvent.param4 = null;
		trackierEvent.param5 = null;
		trackierEvent.param6 = null;
		trackierEvent.param7 = null;
		trackierEvent.param8 = null;
		trackierEvent.param9 = null;
		trackierEvent.param10 = null;
		trackierEvent.revenue = null;

		if (checkKey(trackierEventMap, "orderId")) {
			trackierEvent.orderId = trackierEventMap.getString("orderId");
		}
		if (checkKey(trackierEventMap, "currency")) {            
		   trackierEvent.currency = trackierEventMap.getString("currency");
		}
		if (checkKey(trackierEventMap, "couponCode")) {
			trackierEvent.couponCode = trackierEventMap.getString("couponCode");
		}
		if (checkKey(trackierEventMap, "discount")) {
			trackierEvent.discount = (float) trackierEventMap.getDouble("discount");
		}
		if (checkKey(trackierEventMap, "param1")) {            
			trackierEvent.param1 = trackierEventMap.getString("param1");
		}
		if (checkKey(trackierEventMap, "param2")) {            
			trackierEvent.param2 = trackierEventMap.getString("param2");
		}
		if (checkKey(trackierEventMap, "param3")) {            
			trackierEvent.param3 = trackierEventMap.getString("param3");
		}
		if (checkKey(trackierEventMap, "param4")) {            
			trackierEvent.param4 = trackierEventMap.getString("param4");
		}
		if (checkKey(trackierEventMap, "param5")) {            
			trackierEvent.param5 = trackierEventMap.getString("param5");
		}
		if (checkKey(trackierEventMap, "param6")) {            
			trackierEvent.param6 = trackierEventMap.getString("param6");
		}
		if (checkKey(trackierEventMap, "param7")) {            
			trackierEvent.param7 = trackierEventMap.getString("param7");
		}
		if (checkKey(trackierEventMap, "param8")) {            
			trackierEvent.param8 = trackierEventMap.getString("param8");
		}
		if (checkKey(trackierEventMap, "appToken")) {            
			trackierEvent.param9 = trackierEventMap.getString("param9");
		}
		if (checkKey(trackierEventMap, "param10")) {            
			trackierEvent.param10 = trackierEventMap.getString("param10");
		}
		if (checkKey(trackierEventMap, "revenue")) {            
			trackierEvent.revenue = trackierEventMap.getDouble("revenue");
		}

		Map<String, Object> eventValues = TrackierUtil.toMap(trackierEventMap.getMap("ev"));
		Map<String, Object> ev = new LinkedHashMap<String, Object>();
		if (eventValues != null) {
			for (Map.Entry<String, Object> entry : eventValues.entrySet()) {
				ev.put(entry.getKey(), entry.getValue().toString());
			}
		}
		trackierEvent.ev = ev;
		com.trackier.sdk.TrackierSDK.trackEvent(trackierEvent);
	}

	private boolean checkKey(ReadableMap map, String key) {
		return map.hasKey(key) && !map.isNull(key);
	}
}
