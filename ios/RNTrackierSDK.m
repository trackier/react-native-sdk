//
//  RNTrackierSDK.m
//  TrackierSDK
//
//  Created by Prakhar Srivastava on 29/04/21.
//  Copyright © 2021 Trackier. All rights reserved.
//

#import "React/RCTBridgeModule.h"

@interface RCT_EXTERN_REMAP_MODULE(TrackierSDK, RNTrackierSDK, NSObject)
 
RCT_EXTERN_METHOD(initializeSDK:(NSDictionary *)dict)

RCT_EXTERN_METHOD(trackEvent:(NSDictionary *)dict)

RCT_EXTERN_METHOD(setEnabled:(BOOL *)dict)

RCT_EXTERN_METHOD(setUserId:(NSString *)dict)

RCT_EXTERN_METHOD(setUserEmail:(NSString *)dict)

RCT_EXTERN_METHOD(trackAsOrganic:(BOOL *)dict)

RCT_EXTERN_METHOD(setLocalRefTrack:(BOOL *)dict delimeter: (NSString *)dict)

RCT_EXTERN_METHOD(setUserAdditionalDetails:(NSString *)dict value: (NSString *)dict)
@end

