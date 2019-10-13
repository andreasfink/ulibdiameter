//
//  UMDiameterAvpLCS_Requestor_Id_String.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLCS_Requestor_Id_String.h"

@implementation UMDiameterAvpLCS_Requestor_Id_String


- (NSString *)avpType
{
    return @"LCS-Requestor-Id-String";
}

- (uint32_t)avpCode
{
    return 1240;
}

+ (uint32_t)avpCode
{
    return 1240;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

