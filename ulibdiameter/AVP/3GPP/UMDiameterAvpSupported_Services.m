//
//  UMDiameterAvpSupported_Services.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:34:59.588000
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


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpSupported_Monitoring_Events  avpCode])
        {
            _var_supported_monitoring_events = [[UMDiameterAvpSupported_Monitoring_Events alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_supported_monitoring_events];
        }
        else
        {
             if(unknownAVPs==NULL)
             {
                 unknownAVPs = [[NSMutableArray alloc]init];
             }
             [unknownAVPs addObject:avp];
        }
    }
    _var_avp = unknownAVPs;
    [knownAVPs addObject:[_var_avp copy]];
    [self setArray:knownAVPs];
}


@end

