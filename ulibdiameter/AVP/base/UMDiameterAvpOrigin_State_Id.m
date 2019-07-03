//
//  UMDiameterAvpOrigin_State_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 14:58:07.234000
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

