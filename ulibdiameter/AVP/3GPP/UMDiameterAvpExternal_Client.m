//
//  UMDiameterAvpExternal_Client.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

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
    if(_client_identity)
    {
        [arr addObject:_client_identity]
    }
    if(_gmlc_restriction)
    {
        [arr addObject:_gmlc_restriction]
    }
    if(_notification_to_ue_user)
    {
        [arr addObject:_notification_to_ue_user]
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
        if(avp.avpCode == [UMDiameterAvpClient_Identity  avpCode])
        {
            avp = [[UMDiameterAvpClient_Identity alloc]initWithAvp:avp];
            _client_identity = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpGMLC_Restriction avpCode])
        {
            avp = [[UMDiameterAvpGMLC_Restriction alloc]initWithAvp:avp];
            _gmlc_restriction = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpNotification_To_UE_User avpCode])
        {
            avp = [[UMDiameterAvpNotification_To_UE_User alloc]initWithAvp:avp];
            _notification_to_ue_user = avp;
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
    _avp = unknownAVPs;
    [knownAVPs addObject:[_avp copy]];
    [self setArray:knownAVPs];
}


@end

