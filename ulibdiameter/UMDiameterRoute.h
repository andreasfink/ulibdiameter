//
//  UMDiameterRoute.h
//  ulibdiameter
//
//  Created by Andreas Fink on 03.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

@interface UMDiameterRoute : UMObject
{
    NSString *_identifier;
    NSString *_destination;
    NSString *_hostname;
    NSString *_realm;
    NSNumber *_applicationId;
    NSString *_sessionId;
    BOOL     _oneTimeRoute;
    BOOL     _local;
    NSNumber *_weight;
    NSNumber *_priority;
}

@property(readwrite,strong,atomic)     NSString *identifier;
@property(readwrite,strong,atomic)     NSString *destination;
@property(readwrite,strong,atomic)     NSString *hostname;
@property(readwrite,strong,atomic)     NSString *realm;
@property(readwrite,strong,atomic)     NSNumber *applicationId;
@property(readwrite,strong,atomic)     NSString *sessionId;
@property(readwrite,assign,atomic)     BOOL     oneTimeRoute;
@property(readwrite,assign,atomic)     BOOL     local;
@property(readwrite,strong,atomic)     NSNumber   *weight;
@property(readwrite,strong,atomic)     NSNumber   *priority;

- (UMDiameterRoute *)initWithConfig:(NSDictionary *)conf;


@end
