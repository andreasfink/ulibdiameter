//
//  UMDiameterAvpSubscription_Data_Deletion.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSubscription_Data_Deletion.h"
#import "UMDiameterAvpDSR_Flags.h"
#import "UMDiameterAvpSCEF_ID.h"
#import "UMDiameterAvpContext_Identifier.h"
#import "UMDiameterAvpTrace_Reference.h"
#import "UMDiameterAvpTS_Code.h"
#import "UMDiameterAvpSS_Code.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpSubscription_Data_Deletion


- (NSString *)avpType
{
    return @"Subscription-Data-Deletion";
}

- (uint32_t)avpCode
{
    return 1685;
}

+ (uint32_t)avpCode
{
    return 1685;
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
    if(_var_dsr_flags)
    {
        [arr addObject:_var_dsr_flags];
    }
    if(_var_scef_id)
    {
        [arr addObject:_var_scef_id];
    }
    if(_var_context_identifier.count > 0)
    {
        for(UMDiameterAvpContext_Identifier *o in _var_context_identifier)
        {
            [arr addObject:o];
        }
    }
    if(_var_trace_reference)
    {
        [arr addObject:_var_trace_reference];
    }
    if(_var_ts_code.count > 0)
    {
        for(UMDiameterAvpTS_Code *o in _var_ts_code)
        {
            [arr addObject:o];
        }
    }
    if(_var_ss_code.count > 0)
    {
        for(UMDiameterAvpSS_Code *o in _var_ss_code)
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

