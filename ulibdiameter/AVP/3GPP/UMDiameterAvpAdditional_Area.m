//
//  UMDiameterAvpAdditional_Area.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:21.078000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAdditional_Area.h"
#import "UMDiameterAvpArea_Type.h"
#import "UMDiameterAvpArea_Identification.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpAdditional_Area


- (NSString *)avpType
{
    return @"Additional-Area";
}

- (uint32_t)avpCode
{
    return 2565;
}

+ (uint32_t)avpCode
{
    return 2565;
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
    if(_var_area_type)
    {
        [_var_area_type beforeEncode];
        [arr addObject:_var_area_type];
    }
    if(_var_area_identification)
    {
        [_var_area_identification beforeEncode];
        [arr addObject:_var_area_identification];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[area-type]",webName];
        [UMDiameterAvpArea_Type appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[area-identification]",webName];
        [UMDiameterAvpArea_Identification appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Area-Type"] = [_var_area_type objectValue];
	dict[@"Area-Identification"] = [_var_area_identification objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"additional-area";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    [entries addObject:[UMDiameterAvpArea_Type definition]];
    [entries addObject:[UMDiameterAvpArea_Identification definition]];
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

