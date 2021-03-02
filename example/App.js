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

import { TrackierConfig, TrackierSDK, TrackierEvent} from 'react-native-trackier-sdk';

const App: () => React$Node = () => {
  var trackierConfig = new TrackierConfig("abcf2270-d94a-4364-a2ae-34903c6e1d53",TrackierConfig.EnvironmentDevelopment);
  TrackierSDK.initialize(trackierConfig);

  console.log("hey................");

  function _onPress_trackSimpleEvent(){
    var trackierEvent = new TrackierEvent(TrackierEvent.UPDATE);
    trackierEvent.param1 = "XXXXXX";
    trackierEvent.param2 = "kkkkkkk";
    TrackierSDK.trackEvent(trackierEvent);
  }
  return (
    <>
      <View style={styles.container}>
        <TouchableHighlight
          style={styles.button}
          onPress={_onPress_trackSimpleEvent}>
          <Text>Track Simple Event</Text>
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
  },
});

export default App;
