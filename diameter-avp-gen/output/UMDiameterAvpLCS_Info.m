//
//  UMDiameterAvpLCS_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpLCS_Info


- (NSString *)avpType
{
    return @"LCS-Info";
}

- (uint32_t)avpCode
{
    return 1473;
}

+ (uint32_t)avpCode
{
    return 1473;
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
    if(_gmlc_number.count > 0)
    {
        for(UMDiameterAvpGMLC_Number *o in _gmlc_number)
        {
            [arr addObject:o]
        }
    }
    if(_lcs_privacyexception.count > 0)
    {
        for(UMDiameterAvpLCS_PrivacyException *o in _lcs_privacyexception)
        {
            [arr addObject:o]
        }
    }
    if(_mo_lr.count > 0)
    {
        for(UMDiameterAvpMO_LR *o in _mo_lr)
        {
            [arr addObject:o]
        }
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
        if(avp.avpCode == [UMDiameterAvpGMLC_Number  avpCode])
        {
            avp = [[UMDiameterAvpGMLC_Number alloc]initWithAvp:avp];
            _gmlc_number = avp;
            [knownAVPs addObject:avp];
            if(_gmlc_number == NULL)
            {
                _gmlc_number = @[avp];
            }
            else
            {
                _gmlc_number = [_gmlc_number arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpLCS_PrivacyException avpCode])
        {
            avp = [[UMDiameterAvpLCS_PrivacyException alloc]initWithAvp:avp];
            _lcs_privacyexception = avp;
            [knownAVPs addObject:avp];
            if(_lcs_privacyexception == NULL)
            {
                _lcs_privacyexception = @[avp];
            }
            else
            {
                _lcs_privacyexception = [_lcs_privacyexception arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpMO_LR avpCode])
        {
            avp = [[UMDiameterAvpMO_LR alloc]initWithAvp:avp];
            _mo_lr = avp;
            [knownAVPs addObject:avp];
            if(_mo_lr == NULL)
            {
                _mo_lr = @[avp];
            }
            else
            {
                _mo_lr = [_mo_lr arrayByAddingObject:avp]
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
    _avp = unknownAVPs;
    [knownAVPs addObject:[_avp copy]];
    [self setArray:knownAVPs];
}


@end

