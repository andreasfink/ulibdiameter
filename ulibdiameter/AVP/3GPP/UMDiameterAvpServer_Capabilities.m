//
//  UMDiameterAvpServer_Capabilities.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpServer_Capabilities.h"
#import "UMDiameterAvpMandatory_Capability.h"
#import "UMDiameterAvpOptional_Capability.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpServer_Capabilities


- (NSString *)avpType
{
    return @"Server-Capabilities";
}

- (uint32_t)avpCode
{
    return 603;
}

+ (uint32_t)avpCode
{
    return 603;
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
    if(_var_mandatory_capability.count > 0)
    {
        for(UMDiameterAvpMandatory_Capability *o in _var_mandatory_capability)
        {
            [arr addObject:o];
        }
    }
    if(_var_optional_capability.count > 0)
    {
        for(UMDiameterAvpOptional_Capability *o in _var_optional_capability)
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[mandatory-capability][]",webName];
        [UMDiameterAvpMandatory_Capability appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[optional-capability][]",webName];
        [UMDiameterAvpOptional_Capability appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

