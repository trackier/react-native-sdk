import React from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
  TouchableHighlight
} from 'react-native';

import {
  Header,
  LearnMoreLinks,
  Colors,
  DebugInstructions,
  ReloadInstructions,
} from 'react-native/Libraries/NewAppScreen';

import { TrackierConfig, TrackierSDK, TrackierEvent} from 'react-native-trackier';

const App: () => React$Node = () => {
  var trackierConfig = new TrackierConfig("xxxx-xx-4505-bc8b-xx",TrackierConfig.EnvironmentDevelopment);
  TrackierSDK.initialize(trackierConfig);

  function _onPress_trackSimpleEvent(){
    var trackierEvent = new TrackierEvent(TrackierEvent.UPDATE);
    trackierEvent.param1 = "XXXXXX";
    trackierEvent.param2 = "kkkkkkk";
    TrackierSDK.trackEvent(trackierEvent);
  }
  function _onPress_trackRevenueEvent(){
    var trackierEvent1 = new TrackierEvent(TrackierEvent.UPDATE);
    trackierEvent1.param1 = "XXXXXX";
    trackierEvent1.param2 = "kkkkkkk";
    trackierEvent1.revenue = 2.5;
    trackierEvent1.currency = "USD";
    TrackierSDK.trackEvent(trackierEvent1);
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
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  button: {
    alignItems: 'center',
    backgroundColor: '#61D4FB',
    padding: 10,
    width: '60%',
    height: 40,
    margin: 10,
    marginTop: 75
  },
});

export default App;
