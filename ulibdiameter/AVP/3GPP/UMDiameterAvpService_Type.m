//
//  UMDiameterAvpService_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpService_Type.h"
#import "UMDiameterAvpServiceTypeIdentity.h"
#import "UMDiameterAvpGMLC_Restriction.h"
#import "UMDiameterAvpNotification_To_UE_User.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpService_Type


- (NSString *)avpType
{
    return @"Service-Type";
}

- (uint32_t)avpCode
{
    return 1483;
}

+ (uint32_t)avpCode
{
    return 1483;
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
    if(_var_servicetypeidentity)
    {
        [arr addObject:_var_servicetypeidentity];
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

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpServiceTypeIdentity  avpCode])
        {
            _var_servicetypeidentity = [[UMDiameterAvpServiceTypeIdentity alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_servicetypeidentity];
        }
        else if(avp.avpCode == [UMDiameterAvpGMLC_Restriction avpCode])
        {
            _var_gmlc_restriction = [[UMDiameterAvpGMLC_Restriction alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_gmlc_restriction];
        }
        else if(avp.avpCode == [UMDiameterAvpNotification_To_UE_User avpCode])
        {
            _var_notification_to_ue_user = [[UMDiameterAvpNotification_To_UE_User alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_notification_to_ue_user];
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

