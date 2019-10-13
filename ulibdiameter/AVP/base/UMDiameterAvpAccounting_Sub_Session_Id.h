//
//  UMDiameterAvpAccounting_Sub_Session_Id.h
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:50:57.979000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned64.h"



@interface UMDiameterAvpAccounting_Sub_Session_Id : UMDiameterAvpUnsigned64
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

