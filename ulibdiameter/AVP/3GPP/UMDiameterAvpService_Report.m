//
//  UMDiameterAvpService_Report.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpService_Report.h"
#import "UMDiameterAvpService_Result.h"
#import "UMDiameterAvpNode_Type.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpService_Report


- (NSString *)avpType
{
    return @"Service-Report";
}

- (uint32_t)avpCode
{
    return 3152;
}

+ (uint32_t)avpCode
{
    return 3152;
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
    if(_var_service_result)
    {
        [_var_service_result beforeEncode];
        [arr addObject:_var_service_result];
    }
    if(_var_node_type)
    {
        [_var_node_type beforeEncode];
        [arr addObject:_var_node_type];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[service-result]",webName];
        [UMDiameterAvpService_Result appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[node-type]",webName];
        [UMDiameterAvpNode_Type appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Service-Result"] = [_var_service_result objectValue];
	dict[@"Node-Type"] = [_var_node_type objectValue];
	return dict;
}


@end

