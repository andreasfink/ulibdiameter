//
//  UMDiameterAvpSourceID.h
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:36.334000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpDiameterIdentity.h"



@interface UMDiameterAvpSourceID : UMDiameterAvpDiameterIdentity
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

