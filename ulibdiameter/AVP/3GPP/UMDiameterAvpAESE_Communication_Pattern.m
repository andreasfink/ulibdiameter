//
//  UMDiameterAvpAESE_Communication_Pattern.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:34.608000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAESE_Communication_Pattern.h"
#import "UMDiameterAvpSCEF_Reference_ID.h"
#import "UMDiameterAvpSCEF_ID.h"
#import "UMDiameterAvpSCEF_Reference_ID_for_Deletion.h"
#import "UMDiameterAvpCommunication_Pattern_Set.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpAESE_Communication_Pattern


- (NSString *)avpType
{
    return @"AESE-Communication-Pattern";
}

- (uint32_t)avpCode
{
    return 3113;
}

+ (uint32_t)avpCode
{
    return 3113;
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
    if(_var_scef_reference_id)
    {
        [arr addObject:_var_scef_reference_id];
    }
    if(_var_scef_id)
    {
        [arr addObject:_var_scef_id];
    }
    if(_var_scef_reference_id_for_deletion.count > 0)
    {
        for(UMDiameterAvpSCEF_Reference_ID_for_Deletion *o in _var_scef_reference_id_for_deletion)
        {
            [arr addObject:o];
        }
    }
    if(_var_communication_pattern_set.count > 0)
    {
        for(UMDiameterAvpCommunication_Pattern_Set *o in _var_communication_pattern_set)
        {
            [arr addObject:o];
        }
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
    [s appendFormat:@"<td class=\"mandatory\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[scef-reference-id]",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpSCEF_Reference_ID appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[scef-id]",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpSCEF_ID appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[][scef-reference-id-for-deletion]",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpSCEF_Reference_ID_for_Deletion appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[][communication-pattern-set]",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpCommunication_Pattern_Set appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[][avp]",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpAVP appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

