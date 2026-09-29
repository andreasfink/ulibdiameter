//
//  UMDiameterAvpUser_Identifier.m
//  ulibdiameter
//
//  Created by afink on 2021-03-26 21:07:51.067649
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpUser_Identifier.h>
#import <ulibdiameter/UMDiameterAvpUser_Name.h>
#import <ulibdiameter/UMDiameterAvpMSISDN.h>
#import <ulibdiameter/UMDiameterAvpExternal_Identifier.h>
#import <ulibdiameter/UMDiameterAvpLMSI.h>
#import <ulibdiameter/UMDiameterAvpAVP.h>

@implementation UMDiameterAvpUser_Identifier


- (NSString *)avpType
{
    return @"User-Identifier";
}

- (uint32_t)avpCode
{
    return 3102;
}

+ (uint32_t)avpCode
{
    return 3102;
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
    if(_var_user_name)
    {
        [_var_user_name beforeEncode];
        [arr addObject:_var_user_name];
    }
    if(_var_msisdn)
    {
        [_var_msisdn beforeEncode];
        [arr addObject:_var_msisdn];
    }
    if(_var_external_identifier)
    {
        [_var_external_identifier beforeEncode];
        [arr addObject:_var_external_identifier];
    }
    if(_var_lmsi)
    {
        [_var_lmsi beforeEncode];
        [arr addObject:_var_lmsi];
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
        if(avp.avpCode == [UMDiameterAvpUser_Name  avpCode])
        {
            _var_user_name = [[UMDiameterAvpUser_Name alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_user_name];
        }
        else if(avp.avpCode == [UMDiameterAvpMSISDN avpCode])
        {
            _var_msisdn = [[UMDiameterAvpMSISDN alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_msisdn];
        }
        else if(avp.avpCode == [UMDiameterAvpExternal_Identifier avpCode])
        {
            _var_external_identifier = [[UMDiameterAvpExternal_Identifier alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_external_identifier];
        }
        else if(avp.avpCode == [UMDiameterAvpLMSI avpCode])
        {
            _var_lmsi = [[UMDiameterAvpLMSI alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_lmsi];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[user-name]",webName];
        [UMDiameterAvpUser_Name appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[msisdn]",webName];
        [UMDiameterAvpMSISDN appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[external-identifier]",webName];
        [UMDiameterAvpExternal_Identifier appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[lmsi]",webName];
        [UMDiameterAvpLMSI appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"User-Name"] = [_var_user_name objectValue];
	dict[@"MSISDN"] = [_var_msisdn objectValue];
	dict[@"External-Identifier"] = [_var_external_identifier objectValue];
	dict[@"LMSI"] = [_var_lmsi objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"user-identifier";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpUser_Name definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMSISDN definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpExternal_Identifier definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpLMSI definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

