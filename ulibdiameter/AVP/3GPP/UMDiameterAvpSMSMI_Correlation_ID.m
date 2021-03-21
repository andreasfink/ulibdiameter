//
//  UMDiameterAvpSMSMI_Correlation_ID.m
//  ulibdiameter
//
//  Created by afink on 2021-03-21 13:35:20.533812
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSMSMI_Correlation_ID.h"
#import "UMDiameterAvpHSS_ID.h"
#import "UMDiameterAvpOriginating_SIP_URI.h"
#import "UMDiameterAvpDestination_SIP_URI.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpSMSMI_Correlation_ID


- (NSString *)avpType
{
    return @"SMSMI-Correlation-ID";
}

- (uint32_t)avpCode
{
    return 3324;
}

+ (uint32_t)avpCode
{
    return 3324;
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
    if(_var_hss_id)
    {
        [_var_hss_id beforeEncode];
        [arr addObject:_var_hss_id];
    }
    if(_var_originating_sip_uri)
    {
        [_var_originating_sip_uri beforeEncode];
        [arr addObject:_var_originating_sip_uri];
    }
    if(_var_destination_sip_uri)
    {
        [_var_destination_sip_uri beforeEncode];
        [arr addObject:_var_destination_sip_uri];
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
        if(avp.avpCode == [UMDiameterAvpHSS_ID  avpCode])
        {
            _var_hss_id = [[UMDiameterAvpHSS_ID alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_hss_id];
        }
        else if(avp.avpCode == [UMDiameterAvpOriginating_SIP_URI avpCode])
        {
            _var_originating_sip_uri = [[UMDiameterAvpOriginating_SIP_URI alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_originating_sip_uri];
        }
        else if(avp.avpCode == [UMDiameterAvpDestination_SIP_URI avpCode])
        {
            _var_destination_sip_uri = [[UMDiameterAvpDestination_SIP_URI alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_destination_sip_uri];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[hss-id]",webName];
        [UMDiameterAvpHSS_ID appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[originating-sip-uri]",webName];
        [UMDiameterAvpOriginating_SIP_URI appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[destination-sip-uri]",webName];
        [UMDiameterAvpDestination_SIP_URI appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"HSS-ID"] = [_var_hss_id objectValue];
	dict[@"Originating-SIP-URI"] = [_var_originating_sip_uri objectValue];
	dict[@"Destination-SIP-URI"] = [_var_destination_sip_uri objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"smsmi-correlation-id";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpHSS_ID definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpOriginating_SIP_URI definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpDestination_SIP_URI definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

