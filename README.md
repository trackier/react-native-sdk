# react-native-sdk

## Table of Contents

* [Quick Integration Guide](#qs-basic-integration)
    * [Retrieve your app token](#qs-retrieve-app-token)
    * [Getting Google Advertising ID](#qs-getting-gaid)
    * [Initialize the SDK](#qs-initialize-sdk)
    * [Events Tracking](#qs-track-events)
    * [Revenue Events Tracking](#qs-track-event-with-currencey)
    * [Pass the custom params in events](#qs-add-custom-parms-event)
    * [Passing User Data to SDK](#qs-passing-user-data)
    * [SDK Signing](#qs-sdk-signing)
    * [Track Uninstall for Android](#qs-track-uninstall-android)
* [Deep linking](#gs-deeplink)
* [Proguard Settings](#qs-progaurd-settings)


## <a id="qs-add-trackier-sdk"></a>Quick Integration Guide

We have created a example app for the react-native SDK integration. 

Please check the [Example](https://github.com/trackier/react-native-sdk/tree/main/example) directory for know to how the `Trackier SDK` can be integrated.


## <a id="qs-basic-integration"></a>Integrate React-Native SDK to your app

For integration, you need to import the trackier library in your project. 

For importing the library in project, you need to run the below command in the `terminal/cmd`.

```sh
$ npm install trackier/react-native-sdk
```

For Ios app, make sure to go to ios folder and install Cocoapods dependencies:

```sh
$ cd ios && pod install
```    

## <a id="qs-getting-gaid"></a> Getting Google Advertising ID

Trackier SDK need the advertising id from the application. 

For achieving this, you need to add some line of code in the build.gradle and also in Manifest.xml for read the Advertising id from the application which is mentioned below

- Add the google advertising id dependency in your app **build.gradle**

```gradle
dependencies {
  // This can be added where the SDK dependency has been added
  implementation 'com.google.android.gms:play-services-ads-identifier:18.0.1'
}
```
- Update your Android Manifest file by adding the following permission. This is required if your app is targeting devices with android version 12+

```xml
<uses-permission android:name="com.google.android.gms.permission.AD_ID"/>
```

- Add meta data inside the application tag (If not already added)
```xml
<meta-data
            android:name="com.google.android.gms.version"
            android:value="@integer/google_play_services_version" /> // Add this meta-data in the manifest.xml under Application tag.
```
Below are the screenshot of application tag in manifest.xml for the reference

Screenshot[5]

<img width="1000" alt="Screenshot 2022-06-08 at 4 16 40 PM" src="https://user-images.githubusercontent.com/16884982/172598171-2f16460b-9376-40ad-b13d-6be226754aa9.png">


### <a id="qs-retrieve-app-token"></a>Retrieve your app token

1. Login to your Trackier MMP account.
2. Select the application from dashboard which you want to get the app token for.
3. Go to SDK Integration via the left side navigation menu.
4. Copy the SDK Key there to be used as the `"app_token"`.


### <a id="qs-initialize-sdk"></a>SDK integration in app

You should use the following import statement on top of your `.js` file:
```js
import { TrackierConfig, TrackierSDK, TrackierEvent } from 'react-native-trackier';
```

In your `App.js` file, add the following code to initialize the Trackier SDK:
```js

import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { TrackierConfig, TrackierSDK, TrackierEvent } from 'react-native-trackier';
import { StyleSheet, Text, View, TouchableHighlight } from 'react-native';

export default function App() {

/* While Initializing the SDK, You need to pass the three parameter in the TrackierSDKConfig.
 * In First argument, you need to pass the Trackier SDK api key
 * In third argument, you need to pass the environment which can be either "EnvironmentDevelopment", "EnvironmentProduction". */

  var trackierConfig = new TrackierConfig("xxxx-xx-4505-bc8b-xx", TrackierConfig.EnvironmentDevelopment);
  TrackierSDK.initialize(trackierConfig);
}

```

Depending on whether you build your app for testing or for production, you must set the environment with one of these values:
```js
TrackierConfig.EnvironmentTesting
TrackierConfig.EnvironmentDevelopment
TrackierConfig.EnvironmentProduction
```

Check below the screenshot of above code 

Screenshot[1]

<img width="1000" alt="Screenshot 1" src="https://user-images.githubusercontent.com/16884982/176446477-3f45befe-9439-4214-8a22-adf2ef44399b.png">

### <a id="qs-track-events"></a>Events Tracking

<a id="qs-retrieve-event-id"></a>Trackier events trackings enable to provides the insights into how to user interacts with your app. 
Trackier SDK easily get that insights data from the app. Just follow with the simple events integration process

Trackier provides the `Built-in events` and `Customs events` on the Trackier panel.

#### **Built-in Events** - 

Predefined events are the list of constants events which already been created on the dashboard. 

You can use directly to track those events. Just need to implements events in the app projects.

Screenshot[2]

<img width="1000" alt="Screenshot 2" src="https://user-images.githubusercontent.com/16884982/173018185-3356c117-8b9f-46d1-bfd5-c41653f9ac9e.png">

### Example code for calling Built-in events

```js

import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { TrackierConfig, TrackierSDK, TrackierEvent } from 'react-native-trackier';
import { StyleSheet, Text, View, TouchableHighlight } from 'react-native';

export default function App() {

  var trackierConfig = new TrackierConfig("xxxx-xx-4505-bc8b-xx", TrackierConfig.EnvironmentDevelopment);
  TrackierSDK.initialize(trackierConfig);

  function _builtInEvents(){

    //Below are the example of built-in events function calling
    //The arguments - "TTrackierEvent.PURCHASE" passed in the Trackier event class is Events id.

    var trackierEvent = new TrackierEvent(TrackierEvent.PURCHASE); // Purchase is our in-build events.

 /* Below are the function for the adding the extra data,
    You can add the extra data like login details of user or anything you need.
    We have 10 params to add data, Below 2 are mentioned */

    trackierEvent.param1 = "XXXXXX";
    trackierEvent.param2 = "kkkkkkk";
    trackierEvent.setEventValue("param","value");
    trackierEvent.setEventValue("param2",2.0);
    TrackierSDK.trackEvent(trackierEvent);
  }
} 
```

Also check the example app screenshot of above example

Screenshot[3]

<img width="1000" alt="Screenshot 3" src="https://user-images.githubusercontent.com/16884982/176446927-c5be2fc2-7bcd-486b-aabc-75df38519f09.png">


#### **Customs Events** - 

Customs events are created by user as per their required business logic. 

You can create the events in the Trackier dashboard and integrate those events in the app project.

Screenshot[4]

<img width="1000" alt="Screenshot 4" src="https://user-images.githubusercontent.com/16884982/176417552-a8c80137-aa1d-480a-81a3-ea1e03172868.png">


### Example code for calling Customs Events.

```js

import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { TrackierConfig, TrackierSDK, TrackierEvent } from 'react-native-trackier';
import { StyleSheet, Text, View, TouchableHighlight } from 'react-native';

export default function App() {

  var trackierConfig = new TrackierConfig("xxxx-xx-4505-bc8b-xx", TrackierConfig.EnvironmentDevelopment);
  TrackierSDK.initialize(trackierConfig);

  function _customsEvents(){

    //Below are the example of built-in events function calling
    //The arguments - "sEMWSCTXeu" passed in the Trackier event class is Events id for AppOpen

    var trackierEvent = new TrackierEvent("sEMWSCTXeu"); // This is customs events event id and the events name is "AppOpen"

 /* Below are the function for the adding the extra data,
    You can add the extra data like login details of user or anything you need.
    We have 10 params to add data, Below 2 are mentioned */

    trackierEvent.param1 = "XXXXXX";
    trackierEvent.param2 = "kkkkkkk";
    trackierEvent.setEventValue("param","value");
    trackierEvent.setEventValue("param2",2.0);
    TrackierSDK.trackEvent(trackierEvent);
  }
}
```

Check below the example screenshot of customs events:-

Screenshot[5]

<img width="1000" alt="Screenshot 5" src="https://user-images.githubusercontent.com/16884982/176447553-cacc6b0c-ff84-4702-8a22-fd224540a53e.png">


### <a id="qs-track-event-with-currencey"></a>Revenue Event Tracking

Trackier allow user to pass the revenue data which is generated from the app through Revenue events. It is mainly used to keeping record of generating revenue from the app and also you can pass currency as well.

```js
    
import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { TrackierConfig, TrackierSDK, TrackierEvent } from 'react-native-trackier';
import { StyleSheet, Text, View, TouchableHighlight } from 'react-native';

export default function App() {

  function _trackRevenueEvent(){

    //Below are the example of inbuilt events function calling
    //The arguments - "TrackierEvent.PURCHASE" passed in the event class is Events id

    var revenueEvent = new TrackierEvent(TrackierEvent.PURCHASE);
    revenueEvent.param1 = "XXXXXX";
    revenueEvent.param2 = "kkkkkkk";

    //Passing the revenue events be like below example

    revenueEvent.revenue = 2.5; //Pass your generated revenue here.
    revenueEvent.currency = "USD"; //Pass your currency here.
    revenueEvent.trackEvent(trackierEvent1);
  }
} 
```

Check below the revenue events calling screenshots.

Screenshot[6]

<img width="1000" alt="Screenshot 6" src="https://user-images.githubusercontent.com/16884982/176448259-6b8b8525-a423-448e-80c9-80848a69448f.png">


### <a id="qs-add-custom-parms-event"></a>Pass the custom params in events

```js

  function _customsDataPassing(){
    //Below are the example of revenue events function calling
    //The arguments - "sEMWSCTXeu" passed in the event class is Events id for AppOpen.
    var trackierEvent = new TrackierEvent("sEMWSCTXeu");

    //Passing the custom params in events be like below example
    const customData = new Map();
    customData.set("name", "sanu");
    customData.set("phone", "81xxxxx84");
    trackierEvent.ev = customData;
    TrackierSDK.trackEvent(trackierEvent);
  }
```

- First create a map.
- Pass its reference to trackierEvent.ev param of event.
- Pass event reference to trackEvent method of TrackierSDK.


### <a id="qs-passing-user-data"></a>Passing User Data to SDK

Trackier allows to pass additional data like Userid, Email to SDK so that same can be correlated to the Trackier Data and logs.

Just need to pass the data of User Id, Email Id and other additional data to Trackier SDK function which is mentioned below:-


```js

function _userDetails(){

    //Passing the UserId and User EmailId Data
    TrackierSDk.setUserId("XXXXXXXX"); //Pass the UserId values here
    TrackierSDk.setUserEmail("abc@gmail.com"); //Pass the user email id in the argument.
  }
```

### For Passing Additional Data

Trackier allow for passing the additional user details like UserName, Mobile Number, UserAge, UserGender etc. . You need to first make a hashmap and pass it in setUserAdditionalDetail function. The example are in mentioned below


```dart

  function _userDetails(){
    //Passing the UserId and User EmailId Data 
    TrackierSDk.setUserId("XXXXXXXX"); //Pass the UserId values here
    TrackierSDk.setUserEmail("abc@gmail.com"); //Pass the user email id in the argument.

    /* Passing the additional data */

    const userDetails = new Map();
    userDetails = {"name":"Sanu"}; //You can pass the Username data.
    userDetails = {"mobile_number":"872xxxxx87"}; // You can pass user mobile number
    TrackierSDk.setUserAdditonalDetail(userDetails);
  }
```

Below are the screenshots of the customs data passing 

Screenshot[7]

<img width="1000" alt="Screenshot 7" src="https://user-images.githubusercontent.com/16884982/176509080-84cff240-3577-4c1b-9871-0e559ecd0dfa.png">


## <a id="qs-sdk-signing"></a>SDK Signing 

Following below are the steps to retrieve the secretId and secretKey :-

- Login your Trackier Panel and select your application.
- In the Dashboard, click on the `SDK Integration` option on the left side of panel. 
- Under on the SDK Integration, click on the Advanced tab. 
- Under the Advanced tab, you will get the secretId and secretKey.

Please check on the below screenshot

Screenshot[8]

<img width="1000" alt="Screenshot 8" src="https://user-images.githubusercontent.com/16884982/185338826-bcf802d0-c493-4a67-adb3-a9b52bae289e.png">


Check below the example code for passing the secretId and secretKey to the SDK

```js 

import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { TrackierConfig, TrackierSDK, TrackierEvent } from 'react-native-trackier';
import { StyleSheet, Text, View, TouchableHighlight } from 'react-native';

export default function App() {

/* While Initializing the SDK, You need to pass the three parameter in the TrackierSDKConfig.
 * In First argument, you need to pass the Trackier SDK api key
 * In third argument, you need to pass the environment which can be either "EnvironmentDevelopment", "EnvironmentProduction". */

  var trackierConfig = new TrackierConfig("xxxx-xx-4505-bc8b-xx", TrackierConfig.EnvironmentDevelopment);
  TrackierSDK.setAppSecret("62xxxxxxxx152","xxxx-xx-2c24"); // Pass secretId in first param and secretKey in second param
  TrackierSDK.initialize(trackierConfig);
}

```

### <a id="qs-track-uninstall-android"></a> Track Uninstall for Android

 **Before you begin**
* [Install `firebase_core`](https://rnfirebase.io/analytics/usage) and add the initialization code to your app if you haven't already.
* Add your app to your Firebase project in the [Firebase console](https://console.firebase.google.com/).

#### Add the Analytics SDK to your app


* Once installed, you can access the `firebase_analytics` plugin by importing it in your JS code:
  ```js
    import analytics from '@react-native-firebase/analytics';
  ```
* Create a new Firebase Analytics instance by with this code
  ```js
    var analytics = analytics();
  ```
* Use the `analytics` instance obtained above to set the following user property:
  ```js
    var trackierId = await TrackierSDK.getTrackierId();
    await analytics().setUserProperty('ct_objectId', trackierId); 
  ``` 

* Adding the above code to your app sets up a common identifier. 
* Set the `app_remove` event as a conversion event in Firebase. 
* Use the Firebase cloud function to send uninstall information to Trackier MMP. 
* You can find the support article [here](https://help.trackier.com/support/solutions/articles/31000162841-android-uninstall-tracking).


### <a id="gs-deeplink"></a> Deep linking 

Deep linking is a techniques in which the user directly redirect to the specific pages of the application by click on the deeplink url.

There are two types deeplinking

* ***Normal deeplinking*** - Direct deep linking occurs when a user already has your app installed on their device. When this is the case, the deep link will redirect the user to the screen specified in the link.

* ***Deferred deeplinking*** - Deferred deep linking occurs when a user does not have your app installed on their device. When this is the case, the deep link will first send the user to the device app store to install the app. Once the user has installed and opened the app, the SDK will redirect them to the screen specified in the link.

Please check below the Deeplinking scenario 

<img width="705" alt="Screenshot 2022-06-22 at 10 48 20 PM" src="https://user-images.githubusercontent.com/16884982/175099075-349910ce-ce7b-4a71-868c-11c34c4331cd.png">


### Normal Deep linking

If a user already has your app on their device, it will open when they interact with a tracker containing a deep link. You can then parse the deep link information for further use. To do this, you need to choose a desired unique scheme name.

You can set up a specific activity to launch when a user interacts with a deep link. To do this:

* Assign the unique scheme name to the activity in your AndroidManifest.xml file.
* Add the intent-filter section to the activity definition.
* Assign an android:scheme property value with your preferred scheme name.

For example, you could set up an activity called FirstActivity to open like this:
#### AndroidManifest.xml 

```

        <activity
            android:name=".Activity.FirstProduct"
            android:exported="true">
        <intent-filter>
            <action android:name="android.intent.action.VIEW" />
            <category android:name="android.intent.category.DEFAULT" />
            <category android:name="android.intent.category.BROWSABLE" />
            <data
                android:host="trackier.u9ilnk.me"
                android:pathPrefix="/product"
                android:scheme="https" />
        </intent-filter>
        </activity>

```

```
https://trackier.u9ilnk.me/product?dlv=FirstProduct&quantity=10&pid=sms
```

### Deferred Deep linking

Deferred deep linking happened, when a user does not have your app installed on their device. When the user clicks a trackier URL, the URL will redirect them to the Play Store to download and install your app. When the user opens the app for the first time, the SDK will read the deep_link content.

The Trackier SDK opens the deferred deep link by default. just need to add some code in application class just after initilazation of Trackier SDk

Below are the example of the code :-

```js

import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { TrackierConfig, TrackierSDK, TrackierEvent} from 'react-native-trackier';
import { StyleSheet, Text, View, TouchableHighlight } from 'react-native';

export default function App() {

  var trackierConfig = new TrackierConfig("abcf2270-xxxxxxx-xxxx-34903c6e1d53", TrackierConfig.EnvironmentDevelopment);
  //Getting deeplink data from the below method
  trackierConfig.setDeferredDeeplinkCallbackListener(function(uri) {
    console.log("Deferred Deeplink Callback received");
    console.log("URL: " + uri);
  });
  TrackierSDK.initialize(trackierConfig);

  return (
    <>
      <View style={styles.container}>
        <Text style={{ color: "grey", fontSize: 30 }}>Trackier React-Native Sdk</Text>
        <TouchableHighlight
          style={styles.button}
          onPress={_onPress_trackSimpleEvent}>
          <Text>Track Simple Event</Text>
        </TouchableHighlight>
        <TouchableHighlight
          style={styles.button}
          onPress={_onPress_trackRevenueEvent}>
          <Text>Track Revenue Event</Text>
        </TouchableHighlight>
        </View>
    </>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});

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
