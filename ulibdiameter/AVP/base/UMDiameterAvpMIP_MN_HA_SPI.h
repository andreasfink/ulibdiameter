//
//  UMDiameterAvpMIP_MN_HA_SPI.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:34.427000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned32.h"



@interface UMDiameterAvpMIP_MN_HA_SPI : UMDiameterAvpUnsigned32
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

