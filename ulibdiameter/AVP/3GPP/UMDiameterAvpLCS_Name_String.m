//
//  UMDiameterAvpLCS_Name_String.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:13:09.603000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLCS_Name_String.h"

@implementation UMDiameterAvpLCS_Name_String


- (NSString *)avpType
{
    return @"LCS-Name-String";
}

- (uint32_t)avpCode
{
    return 1238;
}

+ (uint32_t)avpCode
{
    return 1238;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

