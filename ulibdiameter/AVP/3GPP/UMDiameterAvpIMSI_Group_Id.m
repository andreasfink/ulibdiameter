//
//  UMDiameterAvpIMSI_Group_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpIMSI_Group_Id.h"
#import "UMDiameterAvpGroup_Service_Id.h"
#import "UMDiameterAvpGroup_PLMN_Id.h"
#import "UMDiameterAvpLocal_Group_Id.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpIMSI_Group_Id


- (NSString *)avpType
{
    return @"IMSI-Group-Id";
}

- (uint32_t)avpCode
{
    return 1675;
}

+ (uint32_t)avpCode
{
    return 1675;
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
    if(_var_group_service_id)
    {
        [_var_group_service_id beforeEncode];
        [arr addObject:_var_group_service_id];
    }
    if(_var_group_plmn_id)
    {
        [_var_group_plmn_id beforeEncode];
        [arr addObject:_var_group_plmn_id];
    }
    if(_var_local_group_id)
    {
        [_var_local_group_id beforeEncode];
        [arr addObject:_var_local_group_id];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[group-service-id]",webName];
        [UMDiameterAvpGroup_Service_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[group-plmn-id]",webName];
        [UMDiameterAvpGroup_PLMN_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[local-group-id]",webName];
        [UMDiameterAvpLocal_Group_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

