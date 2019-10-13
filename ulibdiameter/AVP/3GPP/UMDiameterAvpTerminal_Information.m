//
//  UMDiameterAvpTerminal_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpTerminal_Information.h"
#import "UMDiameterAvpIMEI.h"
#import "UMDiameterAvp3GPP2_MEID.h"
#import "UMDiameterAvpSoftware_Version.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpTerminal_Information


- (NSString *)avpType
{
    return @"Terminal-Information";
}

- (uint32_t)avpCode
{
    return 1401;
}

+ (uint32_t)avpCode
{
    return 1401;
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
    if(_var_imei)
    {
        [_var_imei beforeEncode];
        [arr addObject:_var_imei];
    }
    if(_var_3gpp2_meid)
    {
        [_var_3gpp2_meid beforeEncode];
        [arr addObject:_var_3gpp2_meid];
    }
    if(_var_software_version)
    {
        [_var_software_version beforeEncode];
        [arr addObject:_var_software_version];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[imei]",webName];
        [UMDiameterAvpIMEI appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[3gpp2-meid]",webName];
        [UMDiameterAvp3GPP2_MEID appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[software-version]",webName];
        [UMDiameterAvpSoftware_Version appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

