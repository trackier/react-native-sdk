# react-native-sdk

## Table of Content

* [Example App](#qs-example-app)
* [Basic Integration](#qs-basic-integration)
    * [Retrieve your app token](#qs-retrieve-app-token)
    * [Initialize the SDK](#qs-initialize-sdk)
    * [Track Events](#qs-track-events)
* [Proguard Settings](#qs-progaurd-settings)


## <a id="qs-example-app"></a>Example App

There is an example app inside the [example directory](https://github.com/trackier/react-native-sdk/tree/main/example).


## <a id="qs-basic-integration"></a>Basic Integration

First, download the library from npm:
```sh
$ npm install trackier/react-native-sdk
```

For iOS app make sure to go to ios folder and install Cocoapods dependencies:
```sh
$ cd ios && pod install
```    

### <a id="qs-retrieve-app-token"></a>Retrieve your app token

1. Login to your Trackier MMP account.
2. Select the application from dashboard which you want to get the app token for.
3. Go to SDK Integration via the left side navigation menu.
4. Copy the SDK Key there to be used as the `"app_token"`.


### <a id="qs-initialize-sdk"></a>Initialize the SDK

You should use the following import statement on top of your `.js` file:
```js
import { TrackierConfig, TrackierSDK, TrackierEvent} from 'react-native-trackier';
```

In your `App.js` file, add the following code to initialize the Trackier SDK:
```js
var trackierConfig = new TrackierConfig("app_token", TrackierConfig.EnvironmentProduction);
TrackierSDK.initialize(trackierConfig);
```

Depending on whether you build your app for testing or for production, you must set the environment with one of these values:
```js
TrackierConfig.EnvironmentDevelopment
TrackierConfig.EnvironmentProduction
```


### <a id="qs-track-events"></a>Track Events

1. Event tracking with Trackier React Native SDK:
```js
var trackierEvent = new TrackierEvent(TrackierEvent.UPDATE);
trackierEvent.param1 = "XXXXXX";
trackierEvent.param2 = "kkkkkkk";
TrackierSDK.trackEvent(trackierEvent);
```

2. Event tracking with currency and revenue with Trackier React Native SDK:
```js
var trackierEvent = new TrackierEvent(TrackierEvent.UPDATE);
trackierEvent.param1 = "XXXXXX";
trackierEvent.param2 = "kkkkkkk";
trackierEvent.revenue = 2.5;
trackierEvent.currency = "USD";
TrackierSDK.trackEvent(trackierEvent);
```
       
 ## <a id="qs-progaurd-settings"></a>Proguard Settings 

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
