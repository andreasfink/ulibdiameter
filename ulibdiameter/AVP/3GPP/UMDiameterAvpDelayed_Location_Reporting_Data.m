//
//  UMDiameterAvpDelayed_Location_Reporting_Data.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDelayed_Location_Reporting_Data.h"
#import "UMDiameterAvpTermination_Cause.h"
#import "UMDiameterAvpServing_Node.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpDelayed_Location_Reporting_Data


- (NSString *)avpType
{
    return @"Delayed-Location-Reporting-Data";
}

- (uint32_t)avpCode
{
    return 2555;
}

+ (uint32_t)avpCode
{
    return 2555;
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
    if(_var_termination_cause)
    {
        [_var_termination_cause beforeEncode];
        [arr addObject:_var_termination_cause];
    }
    if(_var_serving_node)
    {
        [_var_serving_node beforeEncode];
        [arr addObject:_var_serving_node];
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
        if(avp.avpCode == [UMDiameterAvpTermination_Cause  avpCode])
        {
            _var_termination_cause = [[UMDiameterAvpTermination_Cause alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_termination_cause];
        }
        else if(avp.avpCode == [UMDiameterAvpServing_Node avpCode])
        {
            _var_serving_node = [[UMDiameterAvpServing_Node alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_serving_node];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[termination-cause]",webName];
        [UMDiameterAvpTermination_Cause appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[serving-node]",webName];
        [UMDiameterAvpServing_Node appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Termination-Cause"] = [_var_termination_cause objectValue];
	dict[@"Serving-Node"] = [_var_serving_node objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"delayed-location-reporting-data";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpTermination_Cause definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpServing_Node definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

