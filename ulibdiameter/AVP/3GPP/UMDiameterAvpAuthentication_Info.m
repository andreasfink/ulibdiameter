//
//  UMDiameterAvpAuthentication_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:21.078000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAuthentication_Info.h"
#import "UMDiameterAvpE_UTRAN_Vector.h"
#import "UMDiameterAvpUTRAN_Vector.h"
#import "UMDiameterAvpGERAN_Vector.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpAuthentication_Info


- (NSString *)avpType
{
    return @"Authentication-Info";
}

- (uint32_t)avpCode
{
    return 1413;
}

+ (uint32_t)avpCode
{
    return 1413;
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
    if(_var_e_utran_vector.count > 0)
    {
        for(UMDiameterAvpE_UTRAN_Vector *o in _var_e_utran_vector)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_utran_vector.count > 0)
    {
        for(UMDiameterAvpUTRAN_Vector *o in _var_utran_vector)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_geran_vector.count > 0)
    {
        for(UMDiameterAvpGERAN_Vector *o in _var_geran_vector)
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
    [s appendFormat:@"<td class=\"mandatory\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[e-utran-vector][]",webName];
        [UMDiameterAvpE_UTRAN_Vector appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[utran-vector][]",webName];
        [UMDiameterAvpUTRAN_Vector appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[geran-vector][]",webName];
        [UMDiameterAvpGERAN_Vector appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
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
		if(_var_e_utran_vector.count>0)
		{
			for(UMDiameterAvp *avp in _var_e_utran_vector)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"E-UTRAN-Vector"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_utran_vector.count>0)
		{
			for(UMDiameterAvp *avp in _var_utran_vector)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"UTRAN-Vector"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_geran_vector.count>0)
		{
			for(UMDiameterAvp *avp in _var_geran_vector)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"GERAN-Vector"] = arr;
		}
	}
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"authentication-info";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    [entries addObject:[UMDiameterAvpE_UTRAN_Vector definition]];
    [entries addObject:[UMDiameterAvpUTRAN_Vector definition]];
    [entries addObject:[UMDiameterAvpGERAN_Vector definition]];
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

