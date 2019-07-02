//
//  UMDiameterAvpMulti_Round_Time_Out.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:12.639000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp8.19.h"



@interface UMDiameterAvpMulti_Round_Time_Out : UMDiameterAvp8.19
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

