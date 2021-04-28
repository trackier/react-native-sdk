//
//  TrackierIosSdk.m
//  TrackierSDK
//
//  Created by Prakhar Srivastava on 27/04/21.
//  Copyright © 2021 Trackier. All rights reserved.
//
//
//#import "TrackierSDK-Bridging-Header.h"
//#import <React/Base/RCTLog.h>
//
//@implementation TrackierIosSdk
//
//// To export a module named TrackierSDK
//RCT_EXPORT_MODULE(TrackierSDK);
//
//RCT_EXPORT_METHOD(initializeSDK:(NSDictionary *)dict)
////{
////    NSString *appToken = dict[@"appToken"];
////    NSString *environment = dict[@"environment"];
////    RCTLogInfo(@"initializeSDK %@ at %@", appToken, environment);
////
////}
//
//RCT_EXPORT_METHOD(trackEvent:(NSDictionary *)dict)
////{
////    // TODO: implement this
////    NSString *eventId = dict[@"eventId"];
////    RCTLogInfo(@"trackEvent with id: %@", eventId);
////}
//
//@end


#import "React/Base/RCTBridgeModule.h"
@interface RCT_EXTERN_MODULE(TrackierSDK, NSObject)
RCT_EXTERN_METHOD(initializeSDK:(NSDictionary*)dict);
RCT_EXTERN_METHOD(trackEvent:(NSDictionary*)dict);
@end

