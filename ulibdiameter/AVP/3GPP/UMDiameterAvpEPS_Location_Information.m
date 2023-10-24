//
//  UMDiameterAvpEPS_Location_Information.m
//  ulibdiameter
//
//  Created by afink on 2021-03-24 11:49:54.159080
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEPS_Location_Information.h"
#import "UMDiameterAvpMME_Location_Information.h"
#import "UMDiameterAvpSGSN_Location_Information.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpEPS_Location_Information


- (NSString *)avpType
{
    return @"EPS-Location-Information";
}

- (uint32_t)avpCode
{
    return 1496;
}

+ (uint32_t)avpCode
{
    return 1496;
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
    if(_var_mme_location_information)
    {
        [_var_mme_location_information beforeEncode];
        [arr addObject:_var_mme_location_information];
    }
    if(_var_sgsn_location_information)
    {
        [_var_sgsn_location_information beforeEncode];
        [arr addObject:_var_sgsn_location_information];
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
        if(avp.avpCode == [UMDiameterAvpMME_Location_Information  avpCode])
        {
            _var_mme_location_information = [[UMDiameterAvpMME_Location_Information alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_mme_location_information];
        }
        else if(avp.avpCode == [UMDiameterAvpSGSN_Location_Information avpCode])
        {
            _var_sgsn_location_information = [[UMDiameterAvpSGSN_Location_Information alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_sgsn_location_information];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[mme-location-information]",webName];
        [UMDiameterAvpMME_Location_Information appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[sgsn-location-information]",webName];
        [UMDiameterAvpSGSN_Location_Information appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"MME-Location-Information"] = [_var_mme_location_information objectValue];
	dict[@"SGSN-Location-Information"] = [_var_sgsn_location_information objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"eps-location-information";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMME_Location_Information definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSGSN_Location_Information definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

