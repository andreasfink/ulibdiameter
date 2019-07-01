//
//  UMDiameterAvpSession_Id.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:36.720000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUTF8String .h"



@interface UMDiameterAvpSession_Id : UMDiameterAvpUTF8String 
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

