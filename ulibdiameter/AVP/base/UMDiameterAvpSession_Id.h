//
//  UMDiameterAvpSession_Id.h
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:18:11.217000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUTF8String.h"



@interface UMDiameterAvpSession_Id : UMDiameterAvpUTF8String
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

