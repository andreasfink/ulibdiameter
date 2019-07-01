//
//  UMDiameterAvpMME_User_State.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpMME_User_State


- (NSString *)avpType
{
    return @"MME-User-State";
}

- (uint32_t)avpCode
{
    return 1497;
}

+ (uint32_t)avpCode
{
    return 1497;
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
    if(_mme_location_information)
    {
        [arr addObject:_mme_location_information]
    }
    if(_sgsn_location_information)
    {
        [arr addObject:_sgsn_location_information]
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
        if(avp.avpCode == [UMDiameterAvpMME_Location_Information  avpCode])
        {
            avp = [[UMDiameterAvpMME_Location_Information alloc]initWithAvp:avp];
            _mme_location_information = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSGSN_Location_Information avpCode])
        {
            avp = [[UMDiameterAvpSGSN_Location_Information alloc]initWithAvp:avp];
            _sgsn_location_information = avp;
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

