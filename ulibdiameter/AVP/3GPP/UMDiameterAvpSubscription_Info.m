//
//  UMDiameterAvpSubscription_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:17:01.105000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSubscription_Info.h"
#import "UMDiameterAvpCall_ID_SIP_Header.h"
#import "UMDiameterAvpTo_SIP_Header.h"
#import "UMDiameterAvpRecord_Route.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpSubscription_Info


- (NSString *)avpType
{
    return @"Subscription-Info";
}

- (uint32_t)avpCode
{
    return 642;
}

+ (uint32_t)avpCode
{
    return 642;
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
    if(_var_call_id_sip_header)
    {
        [_var_call_id_sip_header beforeEncode];
        [arr addObject:_var_call_id_sip_header];
    }
    if(_var_to_sip_header)
    {
        [_var_to_sip_header beforeEncode];
        [arr addObject:_var_to_sip_header];
    }
    if(_var_record_route)
    {
        [_var_record_route beforeEncode];
        [arr addObject:_var_record_route];
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


//- (void)afterDecode
/* skipped as there's no properties to decode */

+ (void)appendWebDiameterParameters:(NSMutableString *)s webName:(NSString *)webName  comment:(NSString *)webComment css:(NSString *)cssClass
{
    [s appendString:@"<tr>\n"];
    [s appendFormat:@"<td class=\"optional\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[call-id-sip-header]",webName];
        [UMDiameterAvpCall_ID_SIP_Header appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[to-sip-header]",webName];
        [UMDiameterAvpTo_SIP_Header appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[record-route]",webName];
        [UMDiameterAvpRecord_Route appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Call-ID-SIP-Header"] = [_var_call_id_sip_header objectValue];
	dict[@"To-SIP-Header"] = [_var_to_sip_header objectValue];
	dict[@"Record-Route"] = [_var_record_route objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"subscription-info";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    [entries addObject:[UMDiameterAvpCall_ID_SIP_Header definition]];
    [entries addObject:[UMDiameterAvpTo_SIP_Header definition]];
    [entries addObject:[UMDiameterAvpRecord_Route definition]];
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

