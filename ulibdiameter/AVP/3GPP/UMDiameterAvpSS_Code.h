//
//  UMDiameterAvpSS_Code.h
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:29:38.359000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpOctetString.h"



@interface UMDiameterAvpSS_Code : UMDiameterAvpOctetString
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

