//
//  UMDiameterAvpLoad.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:21:16.139994
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpLoad_Type;
@class UMDiameterAvpLoad_Value;
@class UMDiameterAvpSourceID;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpLoad : UMDiameterAvpGrouped
{
	UMDiameterAvpLoad_Type	*_var_load_type;
	UMDiameterAvpLoad_Value	*_var_load_value;
	UMDiameterAvpSourceID	*_var_sourceid;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpLoad_Type	*var_load_type;
@property(readwrite,strong,atomic)	UMDiameterAvpLoad_Value	*var_load_value;
@property(readwrite,strong,atomic)	UMDiameterAvpSourceID	*var_sourceid;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

