//
//  UMDiameterAvpMonitoring_Event_Report.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMonitoring_Event_Report.h"
#import "UMDiameterAvpSCEF_Reference_ID.h"
#import "UMDiameterAvpSCEF_ID.h"
#import "UMDiameterAvpReachability_Information.h"
#import "UMDiameterAvpEPS_Location_Information.h"
#import "UMDiameterAvpMonitoring_Type.h"
#import "UMDiameterAvpLoss_Of_Connectivity_Reason.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpMonitoring_Event_Report


- (NSString *)avpType
{
    return @"Monitoring-Event-Report";
}

- (uint32_t)avpCode
{
    return 3123;
}

+ (uint32_t)avpCode
{
    return 3123;
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
        [_var_scef_reference_id beforeEncode];
        [arr addObject:_var_scef_reference_id];
    }
    if(_var_scef_id)
    {
        [_var_scef_id beforeEncode];
        [arr addObject:_var_scef_id];
    }
    if(_var_reachability_information)
    {
        [_var_reachability_information beforeEncode];
        [arr addObject:_var_reachability_information];
    }
    if(_var_eps_location_information)
    {
        [_var_eps_location_information beforeEncode];
        [arr addObject:_var_eps_location_information];
    }
    if(_var_monitoring_type)
    {
        [_var_monitoring_type beforeEncode];
        [arr addObject:_var_monitoring_type];
    }
    if(_var_loss_of_connectivity_reason)
    {
        [_var_loss_of_connectivity_reason beforeEncode];
        [arr addObject:_var_loss_of_connectivity_reason];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[scef-reference-id]",webName];
        [UMDiameterAvpSCEF_Reference_ID appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[scef-id]",webName];
        [UMDiameterAvpSCEF_ID appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[reachability-information]",webName];
        [UMDiameterAvpReachability_Information appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[eps-location-information]",webName];
        [UMDiameterAvpEPS_Location_Information appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[monitoring-type]",webName];
        [UMDiameterAvpMonitoring_Type appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[loss-of-connectivity-reason]",webName];
        [UMDiameterAvpLoss_Of_Connectivity_Reason appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

