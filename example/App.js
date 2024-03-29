import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { TrackierConfig, TrackierSDK, TrackierEvent} from 'react-native-trackier';
import { StyleSheet, Text, View, TouchableHighlight } from 'react-native';

export default function App() {

  var trackierConfig = new TrackierConfig("67607dc5-8dc2-4bdc-99f1-b577324d97ce", TrackierConfig.EnvironmentDevelopment);
  trackierConfig.setAppSecret("640710587f41ea36ac0cb370","9e043b7e-7f44-403c-ae11-8cf6bfe8daa0");
  trackierConfig.setDeferredDeeplinkCallbackListener(function(uri) {
    console.log("Deferred Deeplink Callback received");
    console.log("URL: " + uri);
  });
  TrackierSDK.initialize(trackierConfig);

  function _onPress_trackSimpleEvent(){
    var trackierEvent = new TrackierEvent(TrackierEvent.UPDATE);
    trackierEvent.param1 = "XXXXXX";
    trackierEvent.param2 = "kkkkkkk";
    trackierEvent.couponCode = "testReact";
    trackierEvent.discount = 2.0;
    TrackierSDK.setUserName('abc');
    TrackierSDK.setUserPhone("813434721");
    // TrackierSDK.getTrackierId().then(val => console.log('===trackierid: ', val)).catch(e => console.log('==error: ', e))
    trackierEvent.setEventValue("param","8130300721");
   // trackierEvent.setEventValue("param2",2.0);
    let customData = new Map();
    customData.set("name", "sanu");
    customData.set("phone", "8130300784");
    var jsonData = 
        [{ "id": 1, "phone": "+91-8130300721" },
        { "id": 2, "name": "Embassies" }];
    trackierEvent.setEventValue("param",jsonData);
    TrackierSDK.trackEvent(trackierEvent);
  }

  function _onPress_trackRevenueEvent(){
    var trackierEvent1 = new TrackierEvent(TrackierEvent.PURCHASE);
    trackierEvent1.param1 = "XXXXXX";
    trackierEvent1.param2 = "kkkkkkk";
    trackierEvent1.couponCode = "testReact";
    //trackierEvent1.discount = 2.0;

    trackierEvent1.revenue = 2.5;
    trackierEvent1.currency = "USD";
    TrackierSDK.trackEvent(trackierEvent1);
    TrackierSDK.setEnabled(true);
    TrackierSDK.setUserEmail("anuj@trackier.com");
    TrackierSDK.setUserName("Sanu");
    TrackierSDK.setUserPhone("8130300721");
    TrackierSDK.setUserId("abcd");

    TrackierSDK.trackAsOrganic(false);
    TrackierSDK.setLocalRefTrack(true,"test");
  }

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
