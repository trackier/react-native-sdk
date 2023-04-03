import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { TrackierConfig, TrackierSDK, TrackierEvent} from 'react-native-trackier';
import { StyleSheet, Text, View, TouchableHighlight } from 'react-native';

export default function App() {

  var trackierConfig = new TrackierConfig("xxxx-xx-4505-bc8b-xx", TrackierConfig.EnvironmentDevelopment);
  TrackierSDK.setAppSecret("ysc","abc");
  TrackierSDK.initialize(trackierConfig);

  function _onPress_trackSimpleEvent(){
    var trackierEvent = new TrackierEvent(TrackierEvent.UPDATE);
    trackierEvent.param1 = "XXXXXX";
    trackierEvent.param2 = "kkkkkkk";
    trackierEvent.couponCode = "testReact";
    trackierEvent.discount = 2.0;
    TrackierSDK.setUserName("abc");
    TrackierSDK.setUserPhone("813434721");
    // TrackierSDK.getTrackierId().then(val => console.log('===trackierid: ', val)).catch(e => console.log('==error: ', e))
    trackierEvent.setEventValue("param","value");
    trackierEvent.setEventValue("param2",2.0);
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
