//
//  UMDiameterAvpProxy_Info.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:49:36.549000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpProxy_Host;
@class UMDiameterAvpProxy_State;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpProxy_Info : UMDiameterAvpGrouped
{
	UMDiameterAvpProxy_Host	*_var_proxy_host;
	UMDiameterAvpProxy_State	*_var_proxy_state;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpProxy_Host	*var_proxy_host;
@property(readwrite,strong,atomic)	UMDiameterAvpProxy_State	*var_proxy_state;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

