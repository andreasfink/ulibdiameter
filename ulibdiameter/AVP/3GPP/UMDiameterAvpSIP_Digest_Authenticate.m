//
//  UMDiameterAvpSIP_Digest_Authenticate.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:19.173694
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSIP_Digest_Authenticate.h"
#import "UMDiameterAvpDigest_Realm.h"
#import "UMDiameterAvpDigest_Algorithm.h"
#import "UMDiameterAvpDigest_QoP.h"
#import "UMDiameterAvpDigest_HA1.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpSIP_Digest_Authenticate


- (NSString *)avpType
{
    return @"SIP-Digest-Authenticate";
}

- (uint32_t)avpCode
{
    return 635;
}

+ (uint32_t)avpCode
{
    return 635;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    /* _vendorFlag = YES, _vendorCode = 635 */
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 635;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_digest_realm)
    {
        [_var_digest_realm beforeEncode];
        [arr addObject:_var_digest_realm];
    }
    if(_var_digest_algorithm)
    {
        [_var_digest_algorithm beforeEncode];
        [arr addObject:_var_digest_algorithm];
    }
    if(_var_digest_qop)
    {
        [_var_digest_qop beforeEncode];
        [arr addObject:_var_digest_qop];
    }
    if(_var_digest_ha1)
    {
        [_var_digest_ha1 beforeEncode];
        [arr addObject:_var_digest_ha1];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[digest-realm]",webName];
        [UMDiameterAvpDigest_Realm appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[digest-algorithm]",webName];
        [UMDiameterAvpDigest_Algorithm appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[digest-qop]",webName];
        [UMDiameterAvpDigest_QoP appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[digest-ha1]",webName];
        [UMDiameterAvpDigest_HA1 appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Digest-Realm"] = [_var_digest_realm objectValue];
	dict[@"Digest-Algorithm"] = [_var_digest_algorithm objectValue];
	dict[@"Digest-QoP"] = [_var_digest_qop objectValue];
	dict[@"Digest-HA1"] = [_var_digest_ha1 objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"sip-digest-authenticate";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpDigest_Realm definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpDigest_Algorithm definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpDigest_QoP definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpDigest_HA1 definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

