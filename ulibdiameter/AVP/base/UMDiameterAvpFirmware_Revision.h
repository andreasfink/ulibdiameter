//
//  UMDiameterAvpFirmware_Revision.h
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:53.138000
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

