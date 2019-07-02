//
//  UMDiameterAvpAcct_Session_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 21:59:20.338000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAcct_Session_Id.h"

@implementation UMDiameterAvpAcct_Session_Id


- (NSString *)avpType
{
    return @"Acct-Session-Id";
}

- (uint32_t)avpCode
{
    return 44;
}

+ (uint32_t)avpCode
{
    return 44;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

