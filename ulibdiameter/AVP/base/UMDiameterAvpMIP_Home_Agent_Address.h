//
//  UMDiameterAvpMIP_Home_Agent_Address.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 10:09:41.451385
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAddress.h"



@interface UMDiameterAvpMIP_Home_Agent_Address : UMDiameterAvpAddress
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

