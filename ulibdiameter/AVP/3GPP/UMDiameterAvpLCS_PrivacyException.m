//
//  UMDiameterAvpLCS_PrivacyException.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
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
        [_var_ss_code beforeEncode];
        [arr addObject:_var_ss_code];
    }
    if(_var_ss_status)
    {
        [_var_ss_status beforeEncode];
        [arr addObject:_var_ss_status];
    }
    if(_var_notification_to_ue_user)
    {
        [_var_notification_to_ue_user beforeEncode];
        [arr addObject:_var_notification_to_ue_user];
    }
    if(_var_external_client.count > 0)
    {
        for(UMDiameterAvpExternal_Client *o in _var_external_client)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_plmn_client.count > 0)
    {
        for(UMDiameterAvpPLMN_Client *o in _var_plmn_client)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_service_type.count > 0)
    {
        for(UMDiameterAvpService_Type *o in _var_service_type)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
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
    [super afterDecode];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[ss-code]",webName];
        [UMDiameterAvpSS_Code appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[ss-status]",webName];
        [UMDiameterAvpSS_Status appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[notification-to-ue-user]",webName];
        [UMDiameterAvpNotification_To_UE_User appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[external-client][]",webName];
        [UMDiameterAvpExternal_Client appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[plmn-client][]",webName];
        [UMDiameterAvpPLMN_Client appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[service-type][]",webName];
        [UMDiameterAvpService_Type appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"SS-Code"] = [_var_ss_code objectValue];
	dict[@"SS-Status"] = [_var_ss_status objectValue];
	dict[@"Notification-To-UE-User"] = [_var_notification_to_ue_user objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_external_client.count>0)
		{
			for(UMDiameterAvp *avp in _var_external_client)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"External-Client"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_plmn_client.count>0)
		{
			for(UMDiameterAvp *avp in _var_plmn_client)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"PLMN-Client"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_service_type.count>0)
		{
			for(UMDiameterAvp *avp in _var_service_type)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Service-Type"] = arr;
		}
	}
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"lcs-privacyexception";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSS_Code definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSS_Status definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpNotification_To_UE_User definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpExternal_Client definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpPLMN_Client definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpService_Type definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

