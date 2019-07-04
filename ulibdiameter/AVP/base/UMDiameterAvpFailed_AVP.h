//
//  UMDiameterAvpFailed_AVP.h
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:32:11.865000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpAVP;


@interface UMDiameterAvpFailed_AVP : UMDiameterAvpGrouped
{
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

