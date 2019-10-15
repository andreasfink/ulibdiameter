//
//  UMDiameterAvpAcct_Multi_Session_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:18.862000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAcct_Multi_Session_Id.h"

@implementation UMDiameterAvpAcct_Multi_Session_Id


- (NSString *)avpType
{
    return @"Acct-Multi-Session-Id";
}

- (uint32_t)avpCode
{
    return 50;
}

+ (uint32_t)avpCode
{
    return 50;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

