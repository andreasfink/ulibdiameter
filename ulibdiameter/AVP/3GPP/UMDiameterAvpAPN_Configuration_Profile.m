//
//  UMDiameterAvpAPN_Configuration_Profile.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAPN_Configuration_Profile.h"
#import "UMDiameterAvpContext_Identifier.h"
#import "UMDiameterAvpAdditional_Context_Identifier.h"
#import "UMDiameterAvpAll_APN_Configurations_Included_Indicator.h"
#import "UMDiameterAvpAPN_Configuration.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpAPN_Configuration_Profile


- (NSString *)avpType
{
    return @"APN-Configuration-Profile";
}

- (uint32_t)avpCode
{
    return 1429;
}

+ (uint32_t)avpCode
{
    return 1429;
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
    if(_var_context_identifier)
    {
        [arr addObject:_var_context_identifier];
    }
    if(_var_additional_context_identifier)
    {
        [arr addObject:_var_additional_context_identifier];
    }
    if(_var_all_apn_configurations_included_indicator)
    {
        [arr addObject:_var_all_apn_configurations_included_indicator];
    }
    if(_var_apn_configuration.count > 0)
    {
        for(UMDiameterAvpAPN_Configuration *o in _var_apn_configuration)
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


@end

