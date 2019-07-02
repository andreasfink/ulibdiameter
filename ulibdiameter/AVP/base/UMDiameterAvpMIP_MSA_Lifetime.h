//
//  UMDiameterAvpMIP_MSA_Lifetime.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 21:59:20.338000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpM.h"



@interface UMDiameterAvpMIP_MSA_Lifetime : UMDiameterAvpM
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

