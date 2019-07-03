//
//  UMDiameterAvpMIP_MN_HA_MSA.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:28:22.488000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"



@interface UMDiameterAvpMIP_MN_HA_MSA : UMDiameterAvpGrouped
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

