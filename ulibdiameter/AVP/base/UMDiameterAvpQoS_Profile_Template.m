//
//  UMDiameterAvpQoS_Profile_Template.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 10:35:09.074000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpQoS_Profile_Template.h"
#import "UMDiameterAvpVendor_Id.h"
#import "UMDiameterAvpQoS_Profile_Id.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpQoS_Profile_Template


- (NSString *)avpType
{
    return @"QoS-Profile-Template";
}

- (uint32_t)avpCode
{
    return 574;
}

+ (uint32_t)avpCode
{
    return 574;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_vendor_id)
    {
        [arr addObject:_var_vendor_id];
    }
    if(_var_qos_profile_id)
    {
        [arr addObject:_var_qos_profile_id];
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
        if(avp.avpCode == [UMDiameterAvpVendor_Id  avpCode])
        {
            _var_vendor_id = [[UMDiameterAvpVendor_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_vendor_id];
        }
        else if(avp.avpCode == [UMDiameterAvpQoS_Profile_Id avpCode])
        {
            _var_qos_profile_id = [[UMDiameterAvpQoS_Profile_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_qos_profile_id];
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

