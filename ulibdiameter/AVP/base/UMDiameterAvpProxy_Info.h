//
//  UMDiameterAvpProxy_Info.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:36.720000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpProxy_Host;
@class UMDiameterAvpProxy_State;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpProxy_Info : UMDiameterAvpGrouped
{
	UMDiameterAvpProxy_Host	*_proxy_host;
	UMDiameterAvpProxy_State	*_proxy_state;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpProxy_Host	*proxy_host;
@property(readwrite,strong,atomic)	UMDiameterAvpProxy_State	*proxy_state;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

