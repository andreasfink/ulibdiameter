//
//  UMDiameterAvpFirmware_Revision.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.174000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned32.h"



@interface UMDiameterAvpFirmware_Revision : UMDiameterAvpUnsigned32
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

