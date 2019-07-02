//
//  UMDiameterAvpEPS_Subscribed_QoS_Profile.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 12:46:31.997000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEPS_Subscribed_QoS_Profile.h"
#import "UMDiameterAvpQoS_Class_Identifier.h";
#import "UMDiameterAvpAllocation_Retention_Priority.h";
#import "UMDiameterAvpAVP.h";

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
    if(_var_qos_class_identifier)
    {
        [arr addObject:_var_qos_class_identifier];
    }
    if(_var_allocation_retention_priority)
    {
        [arr addObject:_var_allocation_retention_priority];
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
        if(avp.avpCode == [UMDiameterAvpQoS_Class_Identifier  avpCode])
        {
            avp = [[UMDiameterAvpQoS_Class_Identifier alloc]initWithAvp:avp];
            _var_qos_class_identifier = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAllocation_Retention_Priority avpCode])
        {
            avp = [[UMDiameterAvpAllocation_Retention_Priority alloc]initWithAvp:avp];
            _var_allocation_retention_priority = avp;
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

