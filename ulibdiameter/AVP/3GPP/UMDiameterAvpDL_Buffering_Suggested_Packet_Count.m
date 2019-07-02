//
//  UMDiameterAvpDL_Buffering_Suggested_Packet_Count.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 11:13:54.490000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDL_Buffering_Suggested_Packet_Count.h"

@implementation UMDiameterAvpDL_Buffering_Suggested_Packet_Count


- (NSString *)avpType
{
    return @"DL-Buffering-Suggested-Packet-Count";
}

- (uint32_t)avpCode
{
    return 1674;
}

+ (uint32_t)avpCode
{
    return 1674;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

