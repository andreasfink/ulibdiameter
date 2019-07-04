//
//  UMDiameterAvpError_Message.h
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:32:11.865000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUTF8String.h"



@interface UMDiameterAvpError_Message : UMDiameterAvpUTF8String
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

