//
//  UMDiameterAvpExpiration_Date.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.350000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpTime.h"



@interface UMDiameterAvpExpiration_Date : UMDiameterAvpTime
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

