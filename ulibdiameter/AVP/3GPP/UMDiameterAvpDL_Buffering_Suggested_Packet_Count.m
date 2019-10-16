//
//  UMDiameterAvpDL_Buffering_Suggested_Packet_Count.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.293000
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

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"dl-buffering-suggested-packet-count";
    avpDef[@"type"] = @"Integer32";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

