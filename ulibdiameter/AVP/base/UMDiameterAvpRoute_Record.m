//
//  UMDiameterAvpRoute_Record.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:50:57.979000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterAvpRoute_Record


- (NSString *)avpType
{
    return @"Route-Record";
}

- (uint32_t)avpCode
{
    return 282;
}

+ (uint32_t)avpCode
{
    return 282;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

