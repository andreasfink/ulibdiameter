//
//  UMDiameterAvpWLAN_offloadability.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpWLAN_offloadability.h"

@implementation UMDiameterAvpWLAN_offloadability


- (NSString *)avpType
{
    return @"WLAN-offloadability";
}

- (uint32_t)avpCode
{
    return 1667;
}

+ (uint32_t)avpCode
{
    return 1667;
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
    if(_wlan_offloadability_eutran)
    {
        [arr addObject:_wlan_offloadability_eutran]
    }
    if(_wlan_offloadability_utran)
    {
        [arr addObject:_wlan_offloadability_utran]
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
        if(avp.avpCode == [UMDiameterAvpWLAN_offloadability_EUTRAN  avpCode])
        {
            avp = [[UMDiameterAvpWLAN_offloadability_EUTRAN alloc]initWithAvp:avp];
            _wlan_offloadability_eutran = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpWLAN_offloadability_UTRAN avpCode])
        {
            avp = [[UMDiameterAvpWLAN_offloadability_UTRAN alloc]initWithAvp:avp];
            _wlan_offloadability_utran = avp;
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

