//
//  UMDiameterAvpServing_Node.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpServing_Node.h"
#import "UMDiameterAvpSGSN_Number.h"
#import "UMDiameterAvpSGSN_Name.h"
#import "UMDiameterAvpSGSN_Realm.h"
#import "UMDiameterAvpMME_Name.h"
#import "UMDiameterAvpMME_Realm.h"
#import "UMDiameterAvpMSC_Number.h"
#import "UMDiameterAvp3GPP_AAA_Server_Name.h"
#import "UMDiameterAvpLCS_Capabilities_Sets.h"
#import "UMDiameterAvpGMLC_Address.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpServing_Node


- (NSString *)avpType
{
    return @"Serving-Node";
}

- (uint32_t)avpCode
{
    return 2401;
}

+ (uint32_t)avpCode
{
    return 2401;
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
    if(_var_sgsn_number)
    {
        [arr addObject:_var_sgsn_number];
    }
    if(_var_sgsn_name)
    {
        [arr addObject:_var_sgsn_name];
    }
    if(_var_sgsn_realm)
    {
        [arr addObject:_var_sgsn_realm];
    }
    if(_var_mme_name)
    {
        [arr addObject:_var_mme_name];
    }
    if(_var_mme_realm)
    {
        [arr addObject:_var_mme_realm];
    }
    if(_var_msc_number)
    {
        [arr addObject:_var_msc_number];
    }
    if(_var_3gpp_aaa_server_name)
    {
        [arr addObject:_var_3gpp_aaa_server_name];
    }
    if(_var_lcs_capabilities_sets)
    {
        [arr addObject:_var_lcs_capabilities_sets];
    }
    if(_var_gmlc_address)
    {
        [arr addObject:_var_gmlc_address];
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

