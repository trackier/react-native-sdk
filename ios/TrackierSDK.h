//
//  TrackierSDK.h
//  TrackierSDK
//
//

//  TrackierSDK.h
#if __has_include(<React/RCTBridgeModule.h>)
#import <React/RCTBridgeModule.h>
#else
#import "RCTBridgeModule.h"
#endif

@interface TrackierSDK : NSObject <RCTBridgeModule>
@end
