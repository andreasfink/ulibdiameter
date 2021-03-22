//
//  UMDiameterAvpLoad.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:02.176628
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


- (void)afterDecode
{
    [super afterDecode];
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpLoad_Type  avpCode])
        {
            _var_load_type = [[UMDiameterAvpLoad_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_load_type];
        }
        else if(avp.avpCode == [UMDiameterAvpLoad_Value avpCode])
        {
            _var_load_value = [[UMDiameterAvpLoad_Value alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_load_value];
        }
        else if(avp.avpCode == [UMDiameterAvpSourceID avpCode])
        {
            _var_sourceid = [[UMDiameterAvpSourceID alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_sourceid];
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
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpLoad_Type definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpLoad_Value definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSourceID definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

