//
//  UMDiameterAvpAcct_Application_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:28.749000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAcct_Application_Id.h"

@implementation UMDiameterAvpAcct_Application_Id


- (NSString *)avpType
{
    return @"Acct-Application-Id";
}

- (uint32_t)avpCode
{
    return 259;
}

+ (uint32_t)avpCode
{
    return 259;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

