//
//  UMDiameterAvpArea_Scope.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:17:01.105000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpArea_Scope.h"
#import "UMDiameterAvpCell_Global_Identity.h"
#import "UMDiameterAvpE_UTRAN_Cell_Global_Identity.h"
#import "UMDiameterAvpRouting_Area_Identity.h"
#import "UMDiameterAvpLocation_Area_Identity.h"
#import "UMDiameterAvpTracking_Area_Identity.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpArea_Scope


- (NSString *)avpType
{
    return @"Area-Scope";
}

- (uint32_t)avpCode
{
    return 1624;
}

+ (uint32_t)avpCode
{
    return 1624;
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
    if(_var_cell_global_identity.count > 0)
    {
        for(UMDiameterAvpCell_Global_Identity *o in _var_cell_global_identity)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_e_utran_cell_global_identity.count > 0)
    {
        for(UMDiameterAvpE_UTRAN_Cell_Global_Identity *o in _var_e_utran_cell_global_identity)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_routing_area_identity.count > 0)
    {
        for(UMDiameterAvpRouting_Area_Identity *o in _var_routing_area_identity)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_location_area_identity.count > 0)
    {
        for(UMDiameterAvpLocation_Area_Identity *o in _var_location_area_identity)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_tracking_area_identity.count > 0)
    {
        for(UMDiameterAvpTracking_Area_Identity *o in _var_tracking_area_identity)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[cell-global-identity][]",webName];
        [UMDiameterAvpCell_Global_Identity appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[e-utran-cell-global-identity][]",webName];
        [UMDiameterAvpE_UTRAN_Cell_Global_Identity appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[routing-area-identity][]",webName];
        [UMDiameterAvpRouting_Area_Identity appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[location-area-identity][]",webName];
        [UMDiameterAvpLocation_Area_Identity appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[tracking-area-identity][]",webName];
        [UMDiameterAvpTracking_Area_Identity appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_cell_global_identity.count>0)
		{
			for(UMDiameterAvp *avp in _var_cell_global_identity)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Cell-Global-Identity"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_e_utran_cell_global_identity.count>0)
		{
			for(UMDiameterAvp *avp in _var_e_utran_cell_global_identity)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"E-UTRAN-Cell-Global-Identity"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_routing_area_identity.count>0)
		{
			for(UMDiameterAvp *avp in _var_routing_area_identity)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Routing-Area-Identity"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_location_area_identity.count>0)
		{
			for(UMDiameterAvp *avp in _var_location_area_identity)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Location-Area-Identity"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_tracking_area_identity.count>0)
		{
			for(UMDiameterAvp *avp in _var_tracking_area_identity)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Tracking-Area-Identity"] = arr;
		}
	}
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"area-scope";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    [entries addObject:[UMDiameterAvpCell_Global_Identity definition]];
    [entries addObject:[UMDiameterAvpE_UTRAN_Cell_Global_Identity definition]];
    [entries addObject:[UMDiameterAvpRouting_Area_Identity definition]];
    [entries addObject:[UMDiameterAvpLocation_Area_Identity definition]];
    [entries addObject:[UMDiameterAvpTracking_Area_Identity definition]];
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

