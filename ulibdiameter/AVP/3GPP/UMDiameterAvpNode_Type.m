//
//  UMDiameterAvpNode_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:13:09.603000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpNode_Type.h"

@implementation UMDiameterAvpNode_Type


- (NSString *)avpType
{
    return @"Node-Type";
}

- (uint32_t)avpCode
{
    return 3153;
}

+ (uint32_t)avpCode
{
    return 3153;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

