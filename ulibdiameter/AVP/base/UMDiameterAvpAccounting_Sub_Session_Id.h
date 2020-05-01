//
//  UMDiameterAvpAccounting_Sub_Session_Id.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:21:15.505910
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned64.h"



@interface UMDiameterAvpAccounting_Sub_Session_Id : UMDiameterAvpUnsigned64
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

