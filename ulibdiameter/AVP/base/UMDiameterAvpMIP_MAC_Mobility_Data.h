//
//  UMDiameterAvpMIP_MAC_Mobility_Data.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.821000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpOctetString.h"



@interface UMDiameterAvpMIP_MAC_Mobility_Data : UMDiameterAvpOctetString
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

