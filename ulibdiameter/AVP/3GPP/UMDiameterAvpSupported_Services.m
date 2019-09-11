//
//  UMDiameterAvpSupported_Services.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSupported_Services.h"
#import "UMDiameterAvpSupported_Monitoring_Events.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpSupported_Services


- (NSString *)avpType
{
    return @"Supported-Services";
}

- (uint32_t)avpCode
{
    return 3143;
}

+ (uint32_t)avpCode
{
    return 3143;
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
    if(_var_supported_monitoring_events)
    {
        [arr addObject:_var_supported_monitoring_events];
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

