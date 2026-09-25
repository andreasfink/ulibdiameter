//
//  UMDiameterAvpSession_Id.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:21:15.505910
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpUTF8String.h>



@interface UMDiameterAvpSession_Id : UMDiameterAvpUTF8String
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

