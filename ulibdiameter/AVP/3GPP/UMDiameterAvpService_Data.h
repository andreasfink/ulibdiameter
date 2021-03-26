//
//  UMDiameterAvpService_Data.h
//  ulibdiameter
//
//  Created by afink on 2021-03-26 21:21:03.403903
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpT4_Data;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpService_Data : UMDiameterAvpGrouped
{
	UMDiameterAvpT4_Data	*_var_t4_data;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpT4_Data	*var_t4_data;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

