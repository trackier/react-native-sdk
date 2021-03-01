const path = require('path');

module.exports = {
  dependency: {
    platforms: {
      android: {
        packageImportPath: 'import com.trackier.sdk.TrackierPackage;',
        packageInstance: 'new TrackierPackage()',
      },
    },
  },
};