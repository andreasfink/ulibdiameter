//
//  UMDiameterAvpMIP6_Home_Link_Prefix.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 10:29:16.058294
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/AVP/UMDiameterAvpOctetString.h>



@interface UMDiameterAvpMIP6_Home_Link_Prefix : UMDiameterAvpOctetString
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

