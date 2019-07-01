//
//  UMDiameterAvpTeleservice_List.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpTS_Code;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpTeleservice_List : UMDiameterAvpGrouped
{
	NSArray<UMDiameterAvpTS_Code *>	*_ts_code;
	UMDiameterAvpAVP	*_avp;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpTS_Code *>	*ts_code;
@property(readwrite,strong,atomic)	UMDiameterAvpAVP	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

