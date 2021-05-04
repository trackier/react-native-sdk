const path = require('path');

module.exports = {
  dependency: {
    platforms: {
      ios: { podspecPath: path.join(__dirname, 'react-native-trackier.podspec') },
      android: {
        packageImportPath: 'import com.reactlibrary.TrackierPackage;',
        packageInstance: 'new TrackierPackage()',
      },
    },
  },
};