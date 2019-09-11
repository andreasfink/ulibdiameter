//
//  UMDiameterAvpSCSCF_Restoration_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
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


//- (void)afterDecode
/* skipped as there's no properties to decode */


@end

