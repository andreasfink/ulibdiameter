//
//  UMDiameterAvpPLMN_ID_List.m
//  ulibdiameter
//
//  Created by afink on 2021-03-21 13:35:20.533812
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPLMN_ID_List.h"
#import "UMDiameterAvpVisited_PLMN_Id.h"
#import "UMDiameterAvpPeriodic_Location_Support_Indicator.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpPLMN_ID_List


- (NSString *)avpType
{
    return @"PLMN-ID-List";
}

- (uint32_t)avpCode
{
    return 2544;
}

+ (uint32_t)avpCode
{
    return 2544;
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
    if(_var_visited_plmn_id)
    {
        [_var_visited_plmn_id beforeEncode];
        [arr addObject:_var_visited_plmn_id];
    }
    if(_var_periodic_location_support_indicator)
    {
        [_var_periodic_location_support_indicator beforeEncode];
        [arr addObject:_var_periodic_location_support_indicator];
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
        if(avp.avpCode == [UMDiameterAvpVisited_PLMN_Id  avpCode])
        {
            _var_visited_plmn_id = [[UMDiameterAvpVisited_PLMN_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_visited_plmn_id];
        }
        else if(avp.avpCode == [UMDiameterAvpPeriodic_Location_Support_Indicator avpCode])
        {
            _var_periodic_location_support_indicator = [[UMDiameterAvpPeriodic_Location_Support_Indicator alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_periodic_location_support_indicator];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[visited-plmn-id]",webName];
        [UMDiameterAvpVisited_PLMN_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[periodic-location-support-indicator]",webName];
        [UMDiameterAvpPeriodic_Location_Support_Indicator appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Visited-PLMN-Id"] = [_var_visited_plmn_id objectValue];
	dict[@"Periodic-Location-Support-Indicator"] = [_var_periodic_location_support_indicator objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"plmn-id-list";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpVisited_PLMN_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpPeriodic_Location_Support_Indicator definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

