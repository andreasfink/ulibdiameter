//
//  UMDiameterAvpESMLC_Cell_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpESMLC_Cell_Info.h"
#import "UMDiameterAvpECGI.h"
#import "UMDiameterAvpCell_Portion_ID.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpESMLC_Cell_Info


- (NSString *)avpType
{
    return @"ESMLC-Cell-Info";
}

- (uint32_t)avpCode
{
    return 2552;
}

+ (uint32_t)avpCode
{
    return 2552;
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
    if(_var_ecgi)
    {
        [arr addObject:_var_ecgi];
    }
    if(_var_cell_portion_id)
    {
        [arr addObject:_var_cell_portion_id];
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[ecgi]",webName];
        [UMDiameterAvpECGI appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[cell-portion-id]",webName];
        [UMDiameterAvpCell_Portion_ID appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end
