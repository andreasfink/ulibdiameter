//
//  UMDiameterAvpLoad_Type.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:21:16.139994
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpEnumerated.h>



@interface UMDiameterAvpLoad_Type : UMDiameterAvpEnumerated
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

