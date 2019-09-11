//
//  UMDiameterAvpLCS_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
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


//- (void)afterDecode
/* skipped as there's no properties to decode */


@end

