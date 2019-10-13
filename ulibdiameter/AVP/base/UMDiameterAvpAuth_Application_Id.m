//
//  UMDiameterAvpAuth_Application_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:53.138000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAuth_Application_Id.h"

@implementation UMDiameterAvpAuth_Application_Id


- (NSString *)avpType
{
    return @"Auth-Application-Id";
}

- (uint32_t)avpCode
{
    return 258;
}

+ (uint32_t)avpCode
{
    return 258;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

