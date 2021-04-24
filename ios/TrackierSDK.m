
//
//  TrackierSDK.m
//  TrackierSDK
//
//
#import "TrackierSDK.h"
#import <React/Base/RCTLog.h>

@implementation TrackierSDK

// To export a module named TrackierSDK
RCT_EXPORT_MODULE(TrackierSDK);

RCT_EXPORT_METHOD(initializeSDK:(NSDictionary *)dict)
{
    NSString *appToken = dict[@"appToken"];
    NSString *environment = dict[@"environment"];
    RCTLogInfo(@"initializeSDK %@ at %@", appToken, environment);

}

RCT_EXPORT_METHOD(trackEvent:(NSDictionary *)dict) {
    // TODO: implement this
    NSString *eventId = dict[@"eventId"];
    RCTLogInfo(@"trackEvent with id: %@", eventId);
}

@end
