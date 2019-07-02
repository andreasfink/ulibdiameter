//
//  UMDiameterAvpMIP6_Agent_Info.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:32:28.185000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"



@interface UMDiameterAvpMIP6_Agent_Info : UMDiameterAvpGrouped
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

