//
//  UMDiameterAvpQoS_Resources.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:17:00.964000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"



@interface UMDiameterAvpQoS_Resources : UMDiameterAvpGrouped
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

