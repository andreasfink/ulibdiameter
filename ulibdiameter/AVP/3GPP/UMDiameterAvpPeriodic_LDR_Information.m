//
//  UMDiameterAvpPeriodic_LDR_Information.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpPeriodic_LDR_Information.h>
#import <ulibdiameter/UMDiameterAvpReporting_Amount.h>
#import <ulibdiameter/UMDiameterAvpReporting_Interval.h>
#import <ulibdiameter/UMDiameterAvpAVP.h>

@implementation UMDiameterAvpPeriodic_LDR_Information


- (NSString *)avpType
{
    return @"Periodic-LDR-Information";
}

- (uint32_t)avpCode
{
    return 2540;
}

+ (uint32_t)avpCode
{
    return 2540;
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
    if(_var_reporting_amount)
    {
        [_var_reporting_amount beforeEncode];
        [arr addObject:_var_reporting_amount];
    }
    if(_var_reporting_interval)
    {
        [_var_reporting_interval beforeEncode];
        [arr addObject:_var_reporting_interval];
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
        if(avp.avpCode == [UMDiameterAvpReporting_Amount  avpCode])
        {
            _var_reporting_amount = [[UMDiameterAvpReporting_Amount alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_reporting_amount];
        }
        else if(avp.avpCode == [UMDiameterAvpReporting_Interval avpCode])
        {
            _var_reporting_interval = [[UMDiameterAvpReporting_Interval alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_reporting_interval];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[reporting-amount]",webName];
        [UMDiameterAvpReporting_Amount appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[reporting-interval]",webName];
        [UMDiameterAvpReporting_Interval appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Reporting-Amount"] = [_var_reporting_amount objectValue];
	dict[@"Reporting-Interval"] = [_var_reporting_interval objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"periodic-ldr-information";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpReporting_Amount definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpReporting_Interval definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

