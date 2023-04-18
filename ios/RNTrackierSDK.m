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

RCT_EXTERN_METHOD(setAppSecret:(NSDictionary *)dict)

RCT_EXTERN_METHOD(trackEvent:(NSDictionary *)dict)

RCT_EXTERN_METHOD(setEnabled:(BOOL *)value)

RCT_EXTERN_METHOD(setUserId:(NSString *)userId)

RCT_EXTERN_METHOD(setUserEmail:(NSString *)userEmail)

RCT_EXTERN_METHOD(setUserName:(NSString *)userName)

RCT_EXTERN_METHOD(setUserPhone:(NSString *)userPhone)

RCT_EXTERN_METHOD(trackAsOrganic:(BOOL *)value)

RCT_EXTERN_METHOD(setLocalRefTrack:(BOOL *)value withDelim: (NSString *)delimeter)

RCT_EXTERN_METHOD(setUserAdditionalDetails:(NSString *)key withValue: (NSString *)value)

RCT_EXTERN_METHOD(deferredDeeplinkCallbackListener: (RCTResponseSenderBlock) callback)
@end

