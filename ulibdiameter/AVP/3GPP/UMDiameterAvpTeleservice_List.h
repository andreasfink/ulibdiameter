//
//  UMDiameterAvpTeleservice_List.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 14:54:47.208000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpTS_Code;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpTeleservice_List : UMDiameterAvpGrouped
{
	NSArray<UMDiameterAvpTS_Code *>	*_var_ts_code;
	UMDiameterAvpAVP	*_var_avp;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpTS_Code *>	*var_ts_code;
@property(readwrite,strong,atomic)	UMDiameterAvpAVP	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

