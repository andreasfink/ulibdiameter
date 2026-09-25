//
//  UMDiameterAvpAMBR.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpAMBR.h>
#import <ulibdiameter/UMDiameterAvpMax_Requested_Bandwidth_UL.h>
#import <ulibdiameter/UMDiameterAvpMax_Requested_Bandwidth_DL.h>
#import <ulibdiameter/UMDiameterAvpExtended_Max_Requested_BW_UL.h>
#import <ulibdiameter/UMDiameterAvpExtended_Max_Requested_BW_DL.h>
#import <ulibdiameter/UMDiameterAvpAVP.h>

@implementation UMDiameterAvpAMBR


- (NSString *)avpType
{
    return @"AMBR";
}

- (uint32_t)avpCode
{
    return 1435;
}

+ (uint32_t)avpCode
{
    return 1435;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_max_requested_bandwidth_ul)
    {
        [_var_max_requested_bandwidth_ul beforeEncode];
        [arr addObject:_var_max_requested_bandwidth_ul];
    }
    if(_var_max_requested_bandwidth_dl)
    {
        [_var_max_requested_bandwidth_dl beforeEncode];
        [arr addObject:_var_max_requested_bandwidth_dl];
    }
    if(_var_extended_max_requested_bw_ul)
    {
        [_var_extended_max_requested_bw_ul beforeEncode];
        [arr addObject:_var_extended_max_requested_bw_ul];
    }
    if(_var_extended_max_requested_bw_dl)
    {
        [_var_extended_max_requested_bw_dl beforeEncode];
        [arr addObject:_var_extended_max_requested_bw_dl];
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
        if(avp.avpCode == [UMDiameterAvpMax_Requested_Bandwidth_UL  avpCode])
        {
            _var_max_requested_bandwidth_ul = [[UMDiameterAvpMax_Requested_Bandwidth_UL alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_max_requested_bandwidth_ul];
        }
        else if(avp.avpCode == [UMDiameterAvpMax_Requested_Bandwidth_DL avpCode])
        {
            _var_max_requested_bandwidth_dl = [[UMDiameterAvpMax_Requested_Bandwidth_DL alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_max_requested_bandwidth_dl];
        }
        else if(avp.avpCode == [UMDiameterAvpExtended_Max_Requested_BW_UL avpCode])
        {
            _var_extended_max_requested_bw_ul = [[UMDiameterAvpExtended_Max_Requested_BW_UL alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_extended_max_requested_bw_ul];
        }
        else if(avp.avpCode == [UMDiameterAvpExtended_Max_Requested_BW_DL avpCode])
        {
            _var_extended_max_requested_bw_dl = [[UMDiameterAvpExtended_Max_Requested_BW_DL alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_extended_max_requested_bw_dl];
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
    [s appendFormat:@"<td class=\"mandatory\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[max-requested-bandwidth-ul]",webName];
        [UMDiameterAvpMax_Requested_Bandwidth_UL appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[max-requested-bandwidth-dl]",webName];
        [UMDiameterAvpMax_Requested_Bandwidth_DL appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[extended-max-requested-bw-ul]",webName];
        [UMDiameterAvpExtended_Max_Requested_BW_UL appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[extended-max-requested-bw-dl]",webName];
        [UMDiameterAvpExtended_Max_Requested_BW_DL appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Max-Requested-Bandwidth-UL"] = [_var_max_requested_bandwidth_ul objectValue];
	dict[@"Max-Requested-Bandwidth-DL"] = [_var_max_requested_bandwidth_dl objectValue];
	dict[@"Extended-Max-Requested-BW-UL"] = [_var_extended_max_requested_bw_ul objectValue];
	dict[@"Extended-Max-Requested-BW-DL"] = [_var_extended_max_requested_bw_dl objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"ambr";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMax_Requested_Bandwidth_UL definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMax_Requested_Bandwidth_DL definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpExtended_Max_Requested_BW_UL definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpExtended_Max_Requested_BW_DL definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

