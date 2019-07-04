//
//  UMDiameterAvpLCS_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:29:38.359000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLCS_Info.h"
#import "UMDiameterAvpGMLC_Number.h"
#import "UMDiameterAvpLCS_PrivacyException.h"
#import "UMDiameterAvpMO_LR.h"
#import "UMDiameterAvpAVP.h"

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
    if(_var_gmlc_number.count > 0)
    {
        for(UMDiameterAvpGMLC_Number *o in _var_gmlc_number)
        {
            [arr addObject:o];
        }
    }
    if(_var_lcs_privacyexception.count > 0)
    {
        for(UMDiameterAvpLCS_PrivacyException *o in _var_lcs_privacyexception)
        {
            [arr addObject:o];
        }
    }
    if(_var_mo_lr.count > 0)
    {
        for(UMDiameterAvpMO_LR *o in _var_mo_lr)
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
        if(avp.avpCode == [UMDiameterAvpGMLC_Number  avpCode])
        {
            UMDiameterAvpGMLC_Number *avp2 = [[UMDiameterAvpGMLC_Number alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_gmlc_number == NULL)
            {
                _var_gmlc_number = @[avp2];
            }
            else
            {
                _var_gmlc_number = [_var_gmlc_number arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpLCS_PrivacyException avpCode])
        {
            UMDiameterAvpLCS_PrivacyException *avp2 = [[UMDiameterAvpLCS_PrivacyException alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_lcs_privacyexception == NULL)
            {
                _var_lcs_privacyexception = @[avp2];
            }
            else
            {
                _var_lcs_privacyexception = [_var_lcs_privacyexception arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpMO_LR avpCode])
        {
            UMDiameterAvpMO_LR *avp2 = [[UMDiameterAvpMO_LR alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_mo_lr == NULL)
            {
                _var_mo_lr = @[avp2];
            }
            else
            {
                _var_mo_lr = [_var_mo_lr arrayByAddingObject:avp2];
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

