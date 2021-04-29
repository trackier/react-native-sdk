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
@end

