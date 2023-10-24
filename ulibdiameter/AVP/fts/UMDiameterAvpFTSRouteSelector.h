//
//  UMDiameterAvpFTSRouteSelector.h
//  ulibdiameter
//
//  Created by afink on 2021-03-01 06:28:46.737359
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpUnsigned32.h>



@interface UMDiameterAvpFTSRouteSelector : UMDiameterAvpUnsigned32
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

