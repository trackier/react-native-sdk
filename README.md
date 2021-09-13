# react-native-sdk
Example app :- There is an example app inside the [example directory](https://github.com/trackier/react-native-sdk/tree/main/example).

Basic integration
First, download the library from npm:

     $ npm install trackier/react-native-sdk

     
For iOS app make sure to go to ios folder and install Cocoapods dependencies:
     
     $ cd ios && pod install     

Integrate the SDK into your app 

You should use the following import statement on top of your .js file

     import { TrackierConfig, TrackierSDK, TrackierEvent} from 'react-native-trackier';

In your App.js file, add the following code to initialize the Trackier SDK:

Depending on whether you build your app for testing or for production, you must set the environment with one of these values:
```
TrackierConfig.EnvironmentDevelopment
TrackierConfig.EnvironmentProduction
```

    var trackierConfig = new TrackierConfig("app_token", TrackierConfig.EnvironmentProduction);
    TrackierSDK.initialize(trackierConfig);

Event Tracking :-

1)Event track with Trackier React Native SDK:-
   
      var trackierEvent = new TrackierEvent(TrackierEvent.UPDATE);
      trackierEvent.param1 = "XXXXXX";
      trackierEvent.param2 = "kkkkkkk";
      TrackierSDK.trackEvent(trackierEvent);

2)Event track with currency and revenue with Trackier React Native SDK:- 

       var trackierEvent = new TrackierEvent(TrackierEvent.UPDATE);
       trackierEvent.param1 = "XXXXXX";
       trackierEvent.param2 = "kkkkkkk";
       trackierEvent.revenue = 2.5;
       trackierEvent.currency = "USD";
       TrackierSDK.trackEvent(trackierEvent);
       
       
 ## <a id="qs-progaurd-trackier-sdk"></a>Proguard Settings 

If your app is using proguard then add these lines to the proguard config file 

``` 
  -keep class com.trackier.sdk.** { *; }
  -keep class com.google.android.gms.common.ConnectionResult {
      int SUCCESS;
  }
  -keep class com.google.android.gms.ads.identifier.AdvertisingIdClient {
      com.google.android.gms.ads.identifier.AdvertisingIdClient$Info getAdvertisingIdInfo(android.content.Context);
  }
  -keep class com.google.android.gms.ads.identifier.AdvertisingIdClient$Info {
      java.lang.String getId();
      boolean isLimitAdTrackingEnabled();
  }
  -keep public class com.android.installreferrer.** { *; }
```
