//
//  UMDiameterAvpSpecific_APN_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 15:00:31.981000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSpecific_APN_Info.h"
#import "UMDiameterAvpService_Selection.h"
#import "UMDiameterAvpMIP6_Agent_Info.h"
#import "UMDiameterAvpVisited_Network_Identifier.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpSpecific_APN_Info


- (NSString *)avpType
{
    return @"Specific-APN-Info";
}

- (uint32_t)avpCode
{
    return 1472;
}

+ (uint32_t)avpCode
{
    return 1472;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
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
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
            [arr addObject:o];
        }
    }
    [self setArray:arr];
}


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpService_Selection  avpCode])
        {
            _var_service_selection = [[UMDiameterAvpService_Selection alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_service_selection];
        }
        else if(avp.avpCode == [UMDiameterAvpMIP6_Agent_Info avpCode])
        {
            _var_mip6_agent_info = [[UMDiameterAvpMIP6_Agent_Info alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_mip6_agent_info];
        }
        else if(avp.avpCode == [UMDiameterAvpVisited_Network_Identifier avpCode])
        {
            _var_visited_network_identifier = [[UMDiameterAvpVisited_Network_Identifier alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_visited_network_identifier];
        }
        else
        {
             if(unknownAVPs==NULL)
             {
                 unknownAVPs = [[NSMutableArray alloc]init];
             }
             [unknownAVPs addObject:avp];
        }
    }
    _var_avp = unknownAVPs;
    [knownAVPs addObject:[_var_avp copy]];
    [self setArray:knownAVPs];
}


@end

