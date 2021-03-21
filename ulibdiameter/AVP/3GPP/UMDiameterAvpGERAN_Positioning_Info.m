//
//  UMDiameterAvpGERAN_Positioning_Info.m
//  ulibdiameter
//
//  Created by afink on 2021-03-21 13:35:20.533812
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGERAN_Positioning_Info.h"
#import "UMDiameterAvpGERAN_Positioning_Data.h"
#import "UMDiameterAvpGERAN_GANSS_Positioning_Data.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpGERAN_Positioning_Info


- (NSString *)avpType
{
    return @"GERAN-Positioning-Info";
}

- (uint32_t)avpCode
{
    return 2524;
}

+ (uint32_t)avpCode
{
    return 2524;
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
    if(_var_geran_positioning_data)
    {
        [_var_geran_positioning_data beforeEncode];
        [arr addObject:_var_geran_positioning_data];
    }
    if(_var_geran_ganss_positioning_data)
    {
        [_var_geran_ganss_positioning_data beforeEncode];
        [arr addObject:_var_geran_ganss_positioning_data];
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
        if(avp.avpCode == [UMDiameterAvpGERAN_Positioning_Data  avpCode])
        {
            _var_geran_positioning_data = [[UMDiameterAvpGERAN_Positioning_Data alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_geran_positioning_data];
        }
        else if(avp.avpCode == [UMDiameterAvpGERAN_GANSS_Positioning_Data avpCode])
        {
            _var_geran_ganss_positioning_data = [[UMDiameterAvpGERAN_GANSS_Positioning_Data alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_geran_ganss_positioning_data];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[geran-positioning-data]",webName];
        [UMDiameterAvpGERAN_Positioning_Data appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[geran-ganss-positioning-data]",webName];
        [UMDiameterAvpGERAN_GANSS_Positioning_Data appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"GERAN-Positioning-Data"] = [_var_geran_positioning_data objectValue];
	dict[@"GERAN-GANSS-Positioning-Data"] = [_var_geran_ganss_positioning_data objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"geran-positioning-info";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpGERAN_Positioning_Data definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpGERAN_GANSS_Positioning_Data definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

