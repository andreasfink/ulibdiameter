//
//  UMDiameterAvpExternal_Client.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 12:46:31.997000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpExternal_Client.h"
#import "UMDiameterAvpClient_Identity.h";
#import "UMDiameterAvpGMLC_Restriction.h";
#import "UMDiameterAvpNotification_To_UE_User.h";
#import "UMDiameterAvpAVP.h";

@implementation UMDiameterAvpExternal_Client


- (NSString *)avpType
{
    return @"External-Client";
}

- (uint32_t)avpCode
{
    return 1479;
}

+ (uint32_t)avpCode
{
    return 1479;
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
    if(_var_client_identity)
    {
        [arr addObject:_var_client_identity];
    }
    if(_var_gmlc_restriction)
    {
        [arr addObject:_var_gmlc_restriction];
    }
    if(_var_notification_to_ue_user)
    {
        [arr addObject:_var_notification_to_ue_user];
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
        if(avp.avpCode == [UMDiameterAvpClient_Identity  avpCode])
        {
            avp = [[UMDiameterAvpClient_Identity alloc]initWithAvp:avp];
            _var_client_identity = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpGMLC_Restriction avpCode])
        {
            avp = [[UMDiameterAvpGMLC_Restriction alloc]initWithAvp:avp];
            _var_gmlc_restriction = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpNotification_To_UE_User avpCode])
        {
            avp = [[UMDiameterAvpNotification_To_UE_User alloc]initWithAvp:avp];
            _var_notification_to_ue_user = avp;
            [knownAVPs addObject:avp];
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

