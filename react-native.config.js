const path = require('path');

module.exports = {
  dependency: {
    platforms: {
      android: {
        packageImportPath: 'import com.trackier.reactsdk.TrackierPackage;',
        packageInstance: 'new TrackierPackage()',
      },
    },
  },
};