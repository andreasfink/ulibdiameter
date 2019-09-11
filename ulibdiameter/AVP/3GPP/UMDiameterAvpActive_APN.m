//
//  UMDiameterAvpActive_APN.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpActive_APN.h"
#import "UMDiameterAvpContext_Identifier.h"
#import "UMDiameterAvpService_Selection.h"
#import "UMDiameterAvpMIP6_Agent_Info.h"
#import "UMDiameterAvpVisited_Network_Identifier.h"
#import "UMDiameterAvpSpecific_APN_Info.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpActive_APN


- (NSString *)avpType
{
    return @"Active-APN";
}

- (uint32_t)avpCode
{
    return 1612;
}

+ (uint32_t)avpCode
{
    return 1612;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_context_identifier)
    {
        [arr addObject:_var_context_identifier];
    }
    if(_var_service_selection)
    {
        [arr addObject:_var_service_selection];
    }
    if(_var_mip6_agent_info)
    {
        [arr addObject:_var_mip6_agent_info];
    }
    if(_var_visited_network_identifier)
    {
        [arr addObject:_var_visited_network_identifier];
    }
    if(_var_specific_apn_info.count > 0)
    {
        for(UMDiameterAvpSpecific_APN_Info *o in _var_specific_apn_info)
        {
            [arr addObject:o];
        }
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
            [arr addObject:o];
        }
    }
    [self setArray:arr];
}


//- (void)afterDecode
/* skipped as there's no properties to decode */


@end

