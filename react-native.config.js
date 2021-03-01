const path = require('path');

module.exports = {
  dependency: {
    platforms: {
      android: {
        packageImportPath: 'import com.trackier.nativemodule.TrackierPackage;',
        packageInstance: 'new TrackierPackage()',
      },
    },
  },
};