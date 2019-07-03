//
//  UMDiameterAvpLCS_PrivacyException.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
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


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpSS_Code  avpCode])
        {
            _var_ss_code = [[UMDiameterAvpSS_Code alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_ss_code];
        }
        else if(avp.avpCode == [UMDiameterAvpSS_Status avpCode])
        {
            _var_ss_status = [[UMDiameterAvpSS_Status alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_ss_status];
        }
        else if(avp.avpCode == [UMDiameterAvpNotification_To_UE_User avpCode])
        {
            _var_notification_to_ue_user = [[UMDiameterAvpNotification_To_UE_User alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_notification_to_ue_user];
        }
        else if(avp.avpCode == [UMDiameterAvpExternal_Client avpCode])
        {
            UMDiameterAvpExternal_Client *avp2 = [[UMDiameterAvpExternal_Client alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_external_client == NULL)
            {
                _var_external_client = @[avp2];
            }
            else
            {
                _var_external_client = [_var_external_client arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpPLMN_Client avpCode])
        {
            UMDiameterAvpPLMN_Client *avp2 = [[UMDiameterAvpPLMN_Client alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_plmn_client == NULL)
            {
                _var_plmn_client = @[avp2];
            }
            else
            {
                _var_plmn_client = [_var_plmn_client arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpService_Type avpCode])
        {
            UMDiameterAvpService_Type *avp2 = [[UMDiameterAvpService_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_service_type == NULL)
            {
                _var_service_type = @[avp2];
            }
            else
            {
                _var_service_type = [_var_service_type arrayByAddingObject:avp2];
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

