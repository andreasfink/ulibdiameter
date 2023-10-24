//
//  UMDiameterAvpMIP_Home_Agent_Host.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 10:14:26.063415
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpGrouped.h>

@class UMDiameterAvpDestination_Realm;
@class UMDiameterAvpDestination_Host;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpMIP_Home_Agent_Host : UMDiameterAvpGrouped
{
	UMDiameterAvpDestination_Realm	*_var_destination_realm;
	UMDiameterAvpDestination_Host	*_var_destination_host;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Realm	*var_destination_realm;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_Host	*var_destination_host;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

