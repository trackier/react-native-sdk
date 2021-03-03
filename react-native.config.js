const path = require('path');

module.exports = {
  dependency: {
    platforms: {
      android: {
        packageImportPath: 'import com.reactlibrary.TrackierPackage;',
        packageInstance: 'new TrackierPackage()',
      },
    },
  },
};