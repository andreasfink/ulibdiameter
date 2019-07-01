//
//  UMDiameterAvpTerminal_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpTerminal_Information


- (NSString *)avpType
{
    return @"Terminal-Information";
}

- (uint32_t)avpCode
{
    return 1401;
}

+ (uint32_t)avpCode
{
    return 1401;
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
    if(_imei)
    {
        [arr addObject:_imei]
    }
    if(_3gpp2_meid)
    {
        [arr addObject:_3gpp2_meid]
    }
    if(_software_version)
    {
        [arr addObject:_software_version]
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
        if(avp.avpCode == [UMDiameterAvpIMEI  avpCode])
        {
            avp = [[UMDiameterAvpIMEI alloc]initWithAvp:avp];
            _imei = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvp3GPP2_MEID avpCode])
        {
            avp = [[UMDiameterAvp3GPP2_MEID alloc]initWithAvp:avp];
            _3gpp2_meid = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSoftware_Version avpCode])
        {
            avp = [[UMDiameterAvpSoftware_Version alloc]initWithAvp:avp];
            _software_version = avp;
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

