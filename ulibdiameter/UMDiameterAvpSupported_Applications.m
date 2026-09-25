//
//  UMDiameterAvpSupported_Applications.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpSupported_Applications.h>
#import <ulibdiameter/UMDiameterAvpAuth_Application_Id.h>
#import <ulibdiameter/UMDiameterAvpAcct_Application_Id.h>
#import <ulibdiameter/UMDiameterAvpVendor_Specific_Application_Id.h>
#import <ulibdiameter/UMDiameterAvpAVP.h>

@implementation UMDiameterAvpSupported_Applications


- (NSString *)avpType
{
    return @"Supported-Applications";
}

- (uint32_t)avpCode
{
    return 631;
}

+ (uint32_t)avpCode
{
    return 631;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_auth_application_id.count > 0)
    {
        for(UMDiameterAvpAuth_Application_Id *o in _var_auth_application_id)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_acct_application_id.count > 0)
    {
        for(UMDiameterAvpAcct_Application_Id *o in _var_acct_application_id)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_vendor_specific_application_id.count > 0)
    {
        for(UMDiameterAvpVendor_Specific_Application_Id *o in _var_vendor_specific_application_id)
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
        if(avp.avpCode == [UMDiameterAvpAuth_Application_Id  avpCode])
        {
            UMDiameterAvpAuth_Application_Id *avp2 = [[UMDiameterAvpAuth_Application_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_auth_application_id == NULL)
            {
                _var_auth_application_id = @[avp2];
            }
            else
            {
                _var_auth_application_id = [_var_auth_application_id arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpAcct_Application_Id avpCode])
        {
            UMDiameterAvpAcct_Application_Id *avp2 = [[UMDiameterAvpAcct_Application_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_acct_application_id == NULL)
            {
                _var_acct_application_id = @[avp2];
            }
            else
            {
                _var_acct_application_id = [_var_acct_application_id arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpVendor_Specific_Application_Id avpCode])
        {
            UMDiameterAvpVendor_Specific_Application_Id *avp2 = [[UMDiameterAvpVendor_Specific_Application_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_vendor_specific_application_id == NULL)
            {
                _var_vendor_specific_application_id = @[avp2];
            }
            else
            {
                _var_vendor_specific_application_id = [_var_vendor_specific_application_id arrayByAddingObject:avp2];
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
    [s appendFormat:@"<td class=\"optional\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[auth-application-id][]",webName];
        [UMDiameterAvpAuth_Application_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[acct-application-id][]",webName];
        [UMDiameterAvpAcct_Application_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[vendor-specific-application-id][]",webName];
        [UMDiameterAvpVendor_Specific_Application_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_auth_application_id.count>0)
		{
			for(UMDiameterAvp *avp in _var_auth_application_id)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Auth-Application-Id"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_acct_application_id.count>0)
		{
			for(UMDiameterAvp *avp in _var_acct_application_id)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Acct-Application-Id"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_vendor_specific_application_id.count>0)
		{
			for(UMDiameterAvp *avp in _var_vendor_specific_application_id)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Vendor-Specific-Application-Id"] = arr;
		}
	}
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"supported-applications";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAuth_Application_Id definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAcct_Application_Id definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpVendor_Specific_Application_Id definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

