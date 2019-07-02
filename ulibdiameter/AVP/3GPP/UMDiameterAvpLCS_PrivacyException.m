//
//  UMDiameterAvpLCS_PrivacyException.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:20.551000
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

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpSS_Code  avpCode])
        {
            avp = [[UMDiameterAvpSS_Code alloc]initWithAvp:avp];
            _var_ss_code = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSS_Status avpCode])
        {
            avp = [[UMDiameterAvpSS_Status alloc]initWithAvp:avp];
            _var_ss_status = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpNotification_To_UE_User avpCode])
        {
            avp = [[UMDiameterAvpNotification_To_UE_User alloc]initWithAvp:avp];
            _var_notification_to_ue_user = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpExternal_Client avpCode])
        {
            avp = [[UMDiameterAvpExternal_Client alloc]initWithAvp:avp];
            _var_external_client = avp;
            [knownAVPs addObject:avp];
            if(_var_external_client == NULL)
            {
                _var_external_client = @[avp];
            }
            else
            {
                _var_external_client = [_var_external_client arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpPLMN_Client avpCode])
        {
            avp = [[UMDiameterAvpPLMN_Client alloc]initWithAvp:avp];
            _var_plmn_client = avp;
            [knownAVPs addObject:avp];
            if(_var_plmn_client == NULL)
            {
                _var_plmn_client = @[avp];
            }
            else
            {
                _var_plmn_client = [_var_plmn_client arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpService_Type avpCode])
        {
            avp = [[UMDiameterAvpService_Type alloc]initWithAvp:avp];
            _var_service_type = avp;
            [knownAVPs addObject:avp];
            if(_var_service_type == NULL)
            {
                _var_service_type = @[avp];
            }
            else
            {
                _var_service_type = [_var_service_type arrayByAddingObject:avp]
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

