//
//  UMDiameterAvpOrigin_State_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:53.138000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOrigin_State_Id.h"

@implementation UMDiameterAvpOrigin_State_Id


- (NSString *)avpType
{
    return @"Origin-State-Id";
}

- (uint32_t)avpCode
{
    return 278;
}

+ (uint32_t)avpCode
{
    return 278;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

