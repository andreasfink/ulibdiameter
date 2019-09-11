//
//  UMDiameterAvpServer_Capabilities.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
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


@end

