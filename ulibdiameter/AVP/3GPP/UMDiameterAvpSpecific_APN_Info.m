//
//  UMDiameterAvpSpecific_APN_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

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
    if(_service_selection)
    {
        [arr addObject:_service_selection]
    }
    if(_mip6_agent_info)
    {
        [arr addObject:_mip6_agent_info]
    }
    if(_visited_network_identifier)
    {
        [arr addObject:_visited_network_identifier]
    }
    if(_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _avp)
        {
            [arr addObject:o]
        }
    }
    [self setAvps:arr];
}


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAVP *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpService_Selection  avpCode])
        {
            avp = [[UMDiameterAvpService_Selection alloc]initWithAvp:avp];
            _service_selection = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpMIP6_Agent_Info avpCode])
        {
            avp = [[UMDiameterAvpMIP6_Agent_Info alloc]initWithAvp:avp];
            _mip6_agent_info = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpVisited_Network_Identifier avpCode])
        {
            avp = [[UMDiameterAvpVisited_Network_Identifier alloc]initWithAvp:avp];
            _visited_network_identifier = avp;
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
    _avp = unknownAVPs;
    [knownAVPs addObject:[_avp copy]];
    [self setArray:knownAVPs];
}


@end

