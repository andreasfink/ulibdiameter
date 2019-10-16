//
//  UMDiameterAvpMME_User_State.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.293000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMME_User_State.h"
#import "UMDiameterAvpMME_Location_Information.h"
#import "UMDiameterAvpSGSN_Location_Information.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpMME_User_State


- (NSString *)avpType
{
    return @"MME-User-State";
}

- (uint32_t)avpCode
{
    return 1497;
}

+ (uint32_t)avpCode
{
    return 1497;
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


//- (void)afterDecode
/* skipped as there's no properties to decode */

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
    avpDef[@"name"] = @"mme-user-state";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    [entries addObject:[UMDiameterAvpMME_Location_Information definition]];
    [entries addObject:[UMDiameterAvpSGSN_Location_Information definition]];
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

