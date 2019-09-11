//
//  UMDiameterAvpLCS_PrivacyException.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLCS_PrivacyException.h"
#import "UMDiameterAvpSS_Code.h"
#import "UMDiameterAvpSS_Status.h"
#import "UMDiameterAvpNotification_To_UE_User.h"
#import "UMDiameterAvpExternal_Client.h"
#import "UMDiameterAvpPLMN_Client.h"
#import "UMDiameterAvpService_Type.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpLCS_PrivacyException


- (NSString *)avpType
{
    return @"LCS-PrivacyException";
}

- (uint32_t)avpCode
{
    return 1475;
}

+ (uint32_t)avpCode
{
    return 1475;
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
    if(_var_ss_code)
    {
        [arr addObject:_var_ss_code];
    }
    if(_var_ss_status)
    {
        [arr addObject:_var_ss_status];
    }
    if(_var_notification_to_ue_user)
    {
        [arr addObject:_var_notification_to_ue_user];
    }
    if(_var_external_client.count > 0)
    {
        for(UMDiameterAvpExternal_Client *o in _var_external_client)
        {
            [arr addObject:o];
        }
    }
    if(_var_plmn_client.count > 0)
    {
        for(UMDiameterAvpPLMN_Client *o in _var_plmn_client)
        {
            [arr addObject:o];
        }
    }
    if(_var_service_type.count > 0)
    {
        for(UMDiameterAvpService_Type *o in _var_service_type)
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

