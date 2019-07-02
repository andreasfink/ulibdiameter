//
//  UMDiameterAvpSubscription_Data_Deletion.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 12:46:31.997000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSubscription_Data_Deletion.h"
#import "UMDiameterAvpDSR_Flags.h";
#import "UMDiameterAvpSCEF_ID.h";
#import "UMDiameterAvpContext_Identifier.h";
#import "UMDiameterAvpTrace_Reference.h";
#import "UMDiameterAvpTS_Code.h";
#import "UMDiameterAvpSS_Code.h";
#import "UMDiameterAvpAVP.h";

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


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpDSR_Flags  avpCode])
        {
            avp = [[UMDiameterAvpDSR_Flags alloc]initWithAvp:avp];
            _var_dsr_flags = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSCEF_ID avpCode])
        {
            avp = [[UMDiameterAvpSCEF_ID alloc]initWithAvp:avp];
            _var_scef_id = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpContext_Identifier avpCode])
        {
            avp = [[UMDiameterAvpContext_Identifier alloc]initWithAvp:avp];
            _var_context_identifier = avp;
            [knownAVPs addObject:avp];
            if(_var_context_identifier == NULL)
            {
                _var_context_identifier = @[avp];
            }
            else
            {
                _var_context_identifier = [_var_context_identifier arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_Reference avpCode])
        {
            avp = [[UMDiameterAvpTrace_Reference alloc]initWithAvp:avp];
            _var_trace_reference = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpTS_Code avpCode])
        {
            avp = [[UMDiameterAvpTS_Code alloc]initWithAvp:avp];
            _var_ts_code = avp;
            [knownAVPs addObject:avp];
            if(_var_ts_code == NULL)
            {
                _var_ts_code = @[avp];
            }
            else
            {
                _var_ts_code = [_var_ts_code arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpSS_Code avpCode])
        {
            avp = [[UMDiameterAvpSS_Code alloc]initWithAvp:avp];
            _var_ss_code = avp;
            [knownAVPs addObject:avp];
            if(_var_ss_code == NULL)
            {
                _var_ss_code = @[avp];
            }
            else
            {
                _var_ss_code = [_var_ss_code arrayByAddingObject:avp]
            }
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

