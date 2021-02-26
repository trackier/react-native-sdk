# react-native-sdk
Example app :- There is an example app inside the example directory.

Basic integration
First, download the library from npm:

     $ npm install trackier/react-native-sdk

Integrate the SDK into your app 

You should use the following import statement on top of your .js file

     import { TrackierConfig, TrackierSDK, TrackEvent} from 'react-native-trackier-sdk';

In your App.js file, add the following code to initialize the Trackier SDK:

    var trackierConfig = new TrackierConfig("app_token","environment");
    TrackierSDK.initialize(trackierConfig);

Event Tracking :-

1)Event track with Trackier React Native SDK:-
   
      var trackEvent = new TrackEvent(TrackEvent.UPDATE);
      trackEvent.param1 = "XXXXXX";
      trackEvent.param2 = "kkkkkkk";
      TrackierSDK.trackierEvent(trackEvent);

2)Event track with currency and revenue with Trackier React Native SDK:- 

       var trackEvent = new TrackEvent(TrackEvent.UPDATE);
       trackEvent.param1 = "XXXXXX";
       trackEvent.param2 = "kkkkkkk";
       trackEvent.revenue = 2.5;
       trackEvent.currency = "USD";
       trackEvent.trackierEvent(trackEvent);
