# react-native-sdk

## Table of Contents

* [Example App](#qs-example-app)
* [Basic Integration](#qs-basic-integration)
    * [Retrieve your app token](#qs-retrieve-app-token)
    * [Initialize the SDK](#qs-initialize-sdk)
    * [Track Events](#qs-track-events)
* [Proguard Settings](#qs-progaurd-settings)
* [Track Uninstall for Android](#qs-track-uninstall-android)


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

### <a id="qs-track-uninstall-android"></a> Track Uninstall for Android

 **Before you begin**
* [Install `firebase_core`](https://rnfirebase.io/analytics/usage) and add the initialization code to your app if you haven't already.
* Add your app to your Firebase project in the [Firebase console](https://console.firebase.google.com/).

#### Add the Analytics SDK to your app


* Once installed, you can access the `firebase_analytics` plugin by importing it in your Dart code:
  ```js
    import analytics from '@react-native-firebase/analytics';
  ```
* Create a new Firebase Analytics instance by with this code
  ```js
    var analytics = analytics();
  ```
* Use the `analytics` instance obtained above to set the following user property:
  ```dart
    var trackierId = await TrackierSDK.getTrackierId();
    await analytics().setUserProperty('ct_objectId', trackierId); 
  ``` 

* Adding the above code to your app sets up a common identifier. 
* Set the `app_remove` event as a conversion event in Firebase. 
* Use the Firebase cloud function to send uninstall information to Trackier MMP. 
* You can find the support article [here](https://help.trackier.com/support/solutions/articles/31000162841-android-uninstall-tracking).
