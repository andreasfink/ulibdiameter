//
//  UMDiameterAvpOC_OLR.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:02.199216
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOC_OLR.h"
#import "UMDiameterAvpOC_Sequence_Number.h"
#import "UMDiameterAvpOC_Report_Type.h"
#import "UMDiameterAvpOC_Reduction_Percentage.h"
#import "UMDiameterAvpOC_Validity_Duration.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpOC_OLR


- (NSString *)avpType
{
    return @"OC-OLR";
}

- (uint32_t)avpCode
{
    return 623;
}

+ (uint32_t)avpCode
{
    return 623;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_oc_sequence_number)
    {
        [_var_oc_sequence_number beforeEncode];
        [arr addObject:_var_oc_sequence_number];
    }
    if(_var_oc_report_type)
    {
        [_var_oc_report_type beforeEncode];
        [arr addObject:_var_oc_report_type];
    }
    if(_var_oc_reduction_percentage)
    {
        [_var_oc_reduction_percentage beforeEncode];
        [arr addObject:_var_oc_reduction_percentage];
    }
    if(_var_oc_validity_duration)
    {
        [_var_oc_validity_duration beforeEncode];
        [arr addObject:_var_oc_validity_duration];
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
        if(avp.avpCode == [UMDiameterAvpOC_Sequence_Number  avpCode])
        {
            _var_oc_sequence_number = [[UMDiameterAvpOC_Sequence_Number alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_oc_sequence_number];
        }
        else if(avp.avpCode == [UMDiameterAvpOC_Report_Type avpCode])
        {
            _var_oc_report_type = [[UMDiameterAvpOC_Report_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_oc_report_type];
        }
        else if(avp.avpCode == [UMDiameterAvpOC_Reduction_Percentage avpCode])
        {
            _var_oc_reduction_percentage = [[UMDiameterAvpOC_Reduction_Percentage alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_oc_reduction_percentage];
        }
        else if(avp.avpCode == [UMDiameterAvpOC_Validity_Duration avpCode])
        {
            _var_oc_validity_duration = [[UMDiameterAvpOC_Validity_Duration alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_oc_validity_duration];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[oc-sequence-number]",webName];
        [UMDiameterAvpOC_Sequence_Number appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[oc-report-type]",webName];
        [UMDiameterAvpOC_Report_Type appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[oc-reduction-percentage]",webName];
        [UMDiameterAvpOC_Reduction_Percentage appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[oc-validity-duration]",webName];
        [UMDiameterAvpOC_Validity_Duration appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"OC-Sequence-Number"] = [_var_oc_sequence_number objectValue];
	dict[@"OC-Report-Type"] = [_var_oc_report_type objectValue];
	dict[@"OC-Reduction-Percentage"] = [_var_oc_reduction_percentage objectValue];
	dict[@"OC-Validity-Duration"] = [_var_oc_validity_duration objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"oc-olr";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpOC_Sequence_Number definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpOC_Report_Type definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpOC_Reduction_Percentage definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpOC_Validity_Duration definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

