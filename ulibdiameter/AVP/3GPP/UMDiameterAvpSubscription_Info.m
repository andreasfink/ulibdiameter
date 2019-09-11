//
//  UMDiameterAvpSubscription_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSubscription_Info.h"
#import "UMDiameterAvpCall_ID_SIP_Header.h"
#import "UMDiameterAvpTo_SIP_Header.h"
#import "UMDiameterAvpRecord_Route.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpSubscription_Info


- (NSString *)avpType
{
    return @"Subscription-Info";
}

- (uint32_t)avpCode
{
    return 642;
}

+ (uint32_t)avpCode
{
    return 642;
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
    if(_var_call_id_sip_header)
    {
        [arr addObject:_var_call_id_sip_header];
    }
    if(_var_to_sip_header)
    {
        [arr addObject:_var_to_sip_header];
    }
    if(_var_record_route)
    {
        [arr addObject:_var_record_route];
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

