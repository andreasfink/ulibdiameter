//
//  UMDiameterAvpEPS_Subscribed_QoS_Profile.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpEPS_Subscribed_QoS_Profile


- (NSString *)avpType
{
    return @"EPS-Subscribed-QoS-Profile";
}

- (uint32_t)avpCode
{
    return 1431;
}

+ (uint32_t)avpCode
{
    return 1431;
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
    if(_qos_class_identifier)
    {
        [arr addObject:_qos_class_identifier]
    }
    if(_allocation_retention_priority)
    {
        [arr addObject:_allocation_retention_priority]
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
        if(avp.avpCode == [UMDiameterAvpQoS_Class_Identifier  avpCode])
        {
            avp = [[UMDiameterAvpQoS_Class_Identifier alloc]initWithAvp:avp];
            _qos_class_identifier = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAllocation_Retention_Priority avpCode])
        {
            avp = [[UMDiameterAvpAllocation_Retention_Priority alloc]initWithAvp:avp];
            _allocation_retention_priority = avp;
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

