//
//  UMDiameterAvpQoS_Capability.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:32:28.185000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpQoS_Capability.h"
#import "UMDiameterAvpQoS_Profile_Template.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpQoS_Capability


- (NSString *)avpType
{
    return @"QoS-Capability";
}

- (uint32_t)avpCode
{
    return 578;
}

+ (uint32_t)avpCode
{
    return 578;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_qos_profile_template.count > 0)
    {
        for(UMDiameterAvpQoS_Profile_Template *o in _var_qos_profile_template)
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


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpQoS_Profile_Template  avpCode])
        {
            UMDiameterAvpQoS_Profile_Template *avp2 = [[UMDiameterAvpQoS_Profile_Template alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_qos_profile_template == NULL)
            {
                _var_qos_profile_template = @[avp];
            }
            else
            {
                _var_qos_profile_template = [_var_qos_profile_template arrayByAddingObject:avp];
            }
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

