//
//  UMDiameterAvpMBSFN_Area.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMBSFN_Area.h"
#import "UMDiameterAvpMBSFN_Area_ID.h"
#import "UMDiameterAvpCarrier_Frequency.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpMBSFN_Area


- (NSString *)avpType
{
    return @"MBSFN-Area";
}

- (uint32_t)avpCode
{
    return 1694;
}

+ (uint32_t)avpCode
{
    return 1694;
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
    if(_var_mbsfn_area_id)
    {
        [_var_mbsfn_area_id beforeEncode];
        [arr addObject:_var_mbsfn_area_id];
    }
    if(_var_carrier_frequency)
    {
        [_var_carrier_frequency beforeEncode];
        [arr addObject:_var_carrier_frequency];
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
        if(avp.avpCode == [UMDiameterAvpMBSFN_Area_ID  avpCode])
        {
            _var_mbsfn_area_id = [[UMDiameterAvpMBSFN_Area_ID alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_mbsfn_area_id];
        }
        else if(avp.avpCode == [UMDiameterAvpCarrier_Frequency avpCode])
        {
            _var_carrier_frequency = [[UMDiameterAvpCarrier_Frequency alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_carrier_frequency];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[mbsfn-area-id]",webName];
        [UMDiameterAvpMBSFN_Area_ID appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[carrier-frequency]",webName];
        [UMDiameterAvpCarrier_Frequency appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"MBSFN-Area-ID"] = [_var_mbsfn_area_id objectValue];
	dict[@"Carrier-Frequency"] = [_var_carrier_frequency objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"mbsfn-area";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMBSFN_Area_ID definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpCarrier_Frequency definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

