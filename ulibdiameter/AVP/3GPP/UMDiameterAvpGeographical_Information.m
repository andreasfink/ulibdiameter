//
//  UMDiameterAvpGeographical_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGeographical_Information.h"

@implementation UMDiameterAvpGeographical_Information


- (NSString *)avpType
{
    return @"Geographical-Information";
}

- (uint32_t)avpCode
{
    return 1608;
}

+ (uint32_t)avpCode
{
    return 1608;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

