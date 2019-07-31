//
//  UMDiameterAvpSourceID.h
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:46:38.148000
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

