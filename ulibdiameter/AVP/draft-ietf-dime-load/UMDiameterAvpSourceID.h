//
//  UMDiameterAvpSourceID.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 09:50:12.653000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpDiameterIdentity.h"



@interface UMDiameterAvpSourceID : UMDiameterAvpDiameterIdentity
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

