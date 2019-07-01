//
//  UMDiameterAvpLCS_PrivacyException.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

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
    if(_ss_code)
    {
        [arr addObject:_ss_code]
    }
    if(_ss_status)
    {
        [arr addObject:_ss_status]
    }
    if(_notification_to_ue_user)
    {
        [arr addObject:_notification_to_ue_user]
    }
    if(_external_client.count > 0)
    {
        for(UMDiameterAvpExternal_Client *o in _external_client)
        {
            [arr addObject:o]
        }
    }
    if(_plmn_client.count > 0)
    {
        for(UMDiameterAvpPLMN_Client *o in _plmn_client)
        {
            [arr addObject:o]
        }
    }
    if(_service_type.count > 0)
    {
        for(UMDiameterAvpService_Type *o in _service_type)
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
        if(avp.avpCode == [UMDiameterAvpSS_Code  avpCode])
        {
            avp = [[UMDiameterAvpSS_Code alloc]initWithAvp:avp];
            _ss_code = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSS_Status avpCode])
        {
            avp = [[UMDiameterAvpSS_Status alloc]initWithAvp:avp];
            _ss_status = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpNotification_To_UE_User avpCode])
        {
            avp = [[UMDiameterAvpNotification_To_UE_User alloc]initWithAvp:avp];
            _notification_to_ue_user = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpExternal_Client avpCode])
        {
            avp = [[UMDiameterAvpExternal_Client alloc]initWithAvp:avp];
            _external_client = avp;
            [knownAVPs addObject:avp];
            if(_external_client == NULL)
            {
                _external_client = @[avp];
            }
            else
            {
                _external_client = [_external_client arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpPLMN_Client avpCode])
        {
            avp = [[UMDiameterAvpPLMN_Client alloc]initWithAvp:avp];
            _plmn_client = avp;
            [knownAVPs addObject:avp];
            if(_plmn_client == NULL)
            {
                _plmn_client = @[avp];
            }
            else
            {
                _plmn_client = [_plmn_client arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpService_Type avpCode])
        {
            avp = [[UMDiameterAvpService_Type alloc]initWithAvp:avp];
            _service_type = avp;
            [knownAVPs addObject:avp];
            if(_service_type == NULL)
            {
                _service_type = @[avp];
            }
            else
            {
                _service_type = [_service_type arrayByAddingObject:avp]
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

