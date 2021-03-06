//
//  UMDiameterAvpeDRX_Cycle_Length.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpeDRX_Cycle_Length.h"
#import "UMDiameterAvpRAT_Type.h"
#import "UMDiameterAvpeDRX_Cycle_Length_Value.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpeDRX_Cycle_Length


- (NSString *)avpType
{
    return @"eDRX-Cycle-Length";
}

- (uint32_t)avpCode
{
    return 1691;
}

+ (uint32_t)avpCode
{
    return 1691;
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
    if(_var_rat_type)
    {
        [_var_rat_type beforeEncode];
        [arr addObject:_var_rat_type];
    }
    if(_var_edrx_cycle_length_value)
    {
        [_var_edrx_cycle_length_value beforeEncode];
        [arr addObject:_var_edrx_cycle_length_value];
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
        if(avp.avpCode == [UMDiameterAvpRAT_Type  avpCode])
        {
            _var_rat_type = [[UMDiameterAvpRAT_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_rat_type];
        }
        else if(avp.avpCode == [UMDiameterAvpeDRX_Cycle_Length_Value avpCode])
        {
            _var_edrx_cycle_length_value = [[UMDiameterAvpeDRX_Cycle_Length_Value alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_edrx_cycle_length_value];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[rat-type]",webName];
        [UMDiameterAvpRAT_Type appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[edrx-cycle-length-value]",webName];
        [UMDiameterAvpeDRX_Cycle_Length_Value appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"RAT-Type"] = [_var_rat_type objectValue];
	dict[@"eDRX-Cycle-Length-Value"] = [_var_edrx_cycle_length_value objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"edrx-cycle-length";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpRAT_Type definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpeDRX_Cycle_Length_Value definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

