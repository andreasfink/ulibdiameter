//
//  UMDiameterAvpExternal_Client.m
//  ulibdiameter
//
//  Created by afink on 2021-03-21 13:35:20.533812
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpExternal_Client.h"
#import "UMDiameterAvpClient_Identity.h"
#import "UMDiameterAvpGMLC_Restriction.h"
#import "UMDiameterAvpNotification_To_UE_User.h"
#import "UMDiameterAvpAVP.h"

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
        [_var_client_identity beforeEncode];
        [arr addObject:_var_client_identity];
    }
    if(_var_gmlc_restriction)
    {
        [_var_gmlc_restriction beforeEncode];
        [arr addObject:_var_gmlc_restriction];
    }
    if(_var_notification_to_ue_user)
    {
        [_var_notification_to_ue_user beforeEncode];
        [arr addObject:_var_notification_to_ue_user];
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
            [o beforeEncode];
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
        if(avp.avpCode == [UMDiameterAvpClient_Identity  avpCode])
        {
            _var_client_identity = [[UMDiameterAvpClient_Identity alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_client_identity];
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
    if(unknownAVPs.count>0)
    {
        _var_avp = unknownAVPs;
        [knownAVPs addObject:[_var_avp copy]];
    }
    [self setArray:knownAVPs];
}

+ (void)appendWebDiameterParameters:(NSMutableString *)s webName:(NSString *)webName  comment:(NSString *)webComment css:(NSString *)cssClass
{
    [s appendString:@"<tr>\n"];
    [s appendFormat:@"<td class=\"mandatory\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[client-identity]",webName];
        [UMDiameterAvpClient_Identity appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[gmlc-restriction]",webName];
        [UMDiameterAvpGMLC_Restriction appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[notification-to-ue-user]",webName];
        [UMDiameterAvpNotification_To_UE_User appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Client-Identity"] = [_var_client_identity objectValue];
	dict[@"GMLC-Restriction"] = [_var_gmlc_restriction objectValue];
	dict[@"Notification-To-UE-User"] = [_var_notification_to_ue_user objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"external-client";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpClient_Identity definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpGMLC_Restriction definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpNotification_To_UE_User definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

