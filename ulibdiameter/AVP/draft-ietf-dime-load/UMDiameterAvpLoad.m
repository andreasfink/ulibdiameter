//
//  UMDiameterAvpLoad.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:19.065000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLoad.h"
#import "UMDiameterAvpLoad_Type.h"
#import "UMDiameterAvpLoad_Value.h"
#import "UMDiameterAvpSourceID.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpLoad


- (NSString *)avpType
{
    return @"Load";
}

- (uint32_t)avpCode
{
    return 650;
}

+ (uint32_t)avpCode
{
    return 650;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_load_type)
    {
        [_var_load_type beforeEncode];
        [arr addObject:_var_load_type];
    }
    if(_var_load_value)
    {
        [_var_load_value beforeEncode];
        [arr addObject:_var_load_value];
    }
    if(_var_sourceid)
    {
        [_var_sourceid beforeEncode];
        [arr addObject:_var_sourceid];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[load-type]",webName];
        [UMDiameterAvpLoad_Type appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[load-value]",webName];
        [UMDiameterAvpLoad_Value appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[sourceid]",webName];
        [UMDiameterAvpSourceID appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Load-Type"] = [_var_load_type objectValue];
	dict[@"Load-Value"] = [_var_load_value objectValue];
	dict[@"SourceID"] = [_var_sourceid objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"load";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    [entries addObject:[UMDiameterAvpLoad_Type definition]];
    [entries addObject:[UMDiameterAvpLoad_Value definition]];
    [entries addObject:[UMDiameterAvpSourceID definition]];
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

