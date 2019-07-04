//
//  UMDiameterAvpSCSCF_Restoration_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:29:38.359000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSCSCF_Restoration_Info.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpRestoration_Info.h"
#import "UMDiameterAvpSIP_Authentication_Scheme.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpSCSCF_Restoration_Info


- (NSString *)avpType
{
    return @"SCSCF-Restoration-Info";
}

- (uint32_t)avpCode
{
    return 639;
}

+ (uint32_t)avpCode
{
    return 639;
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
    if(_var_user_name)
    {
        [arr addObject:_var_user_name];
    }
    if(_var_restoration_info.count > 0)
    {
        for(UMDiameterAvpRestoration_Info *o in _var_restoration_info)
        {
            [arr addObject:o];
        }
    }
    if(_var_sip_authentication_scheme)
    {
        [arr addObject:_var_sip_authentication_scheme];
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
        if(avp.avpCode == [UMDiameterAvpUser_Name  avpCode])
        {
            _var_user_name = [[UMDiameterAvpUser_Name alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_user_name];
        }
        else if(avp.avpCode == [UMDiameterAvpRestoration_Info avpCode])
        {
            UMDiameterAvpRestoration_Info *avp2 = [[UMDiameterAvpRestoration_Info alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_restoration_info == NULL)
            {
                _var_restoration_info = @[avp2];
            }
            else
            {
                _var_restoration_info = [_var_restoration_info arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpSIP_Authentication_Scheme avpCode])
        {
            _var_sip_authentication_scheme = [[UMDiameterAvpSIP_Authentication_Scheme alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_sip_authentication_scheme];
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

