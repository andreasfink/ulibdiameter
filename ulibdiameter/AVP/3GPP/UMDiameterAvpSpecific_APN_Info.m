//
//  UMDiameterAvpSpecific_APN_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:20.551000
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

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpService_Selection  avpCode])
        {
            avp = [[UMDiameterAvpService_Selection alloc]initWithAvp:avp];
            _var_service_selection = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpMIP6_Agent_Info avpCode])
        {
            avp = [[UMDiameterAvpMIP6_Agent_Info alloc]initWithAvp:avp];
            _var_mip6_agent_info = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpVisited_Network_Identifier avpCode])
        {
            avp = [[UMDiameterAvpVisited_Network_Identifier alloc]initWithAvp:avp];
            _var_visited_network_identifier = avp;
            [knownAVPs addObject:avp];
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

