//
//  UMDiameterAvpAuth_Application_Id.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.821000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned32.h"



@interface UMDiameterAvpAuth_Application_Id : UMDiameterAvpUnsigned32
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

