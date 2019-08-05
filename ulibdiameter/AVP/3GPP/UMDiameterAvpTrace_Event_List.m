//
//  UMDiameterAvpTrace_Event_List.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpTrace_Event_List.h"

@implementation UMDiameterAvpTrace_Event_List


- (NSString *)avpType
{
    return @"Trace-Event-List";
}

- (uint32_t)avpCode
{
    return 1465;
}

+ (uint32_t)avpCode
{
    return 1465;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

