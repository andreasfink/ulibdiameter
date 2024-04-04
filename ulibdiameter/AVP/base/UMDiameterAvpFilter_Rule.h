//
//  UMDiameterAvpFilter_Rule.h
//  ulibdiameter
//
//  Created by afink on 2021-03-21 13:47:29.588714
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>



@interface UMDiameterAvpFilter_Rule : UMDiameterAvp
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

