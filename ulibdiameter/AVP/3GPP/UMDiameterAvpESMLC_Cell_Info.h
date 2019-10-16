//
//  UMDiameterAvpESMLC_Cell_Info.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:17:01.105000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpECGI;
@class UMDiameterAvpCell_Portion_ID;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpESMLC_Cell_Info : UMDiameterAvpGrouped
{
	UMDiameterAvpECGI	*_var_ecgi;
	UMDiameterAvpCell_Portion_ID	*_var_cell_portion_id;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpECGI	*var_ecgi;
@property(readwrite,strong,atomic)	UMDiameterAvpCell_Portion_ID	*var_cell_portion_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

