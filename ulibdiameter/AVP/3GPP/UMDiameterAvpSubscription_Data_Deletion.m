//
//  UMDiameterAvpSubscription_Data_Deletion.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSubscription_Data_Deletion.h"

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
    if(_dsr_flags)
    {
        [arr addObject:_dsr_flags]
    }
    if(_scef_id)
    {
        [arr addObject:_scef_id]
    }
    if(_context_identifier.count > 0)
    {
        for(UMDiameterAvpContext_Identifier *o in _context_identifier)
        {
            [arr addObject:o]
        }
    }
    if(_trace_reference)
    {
        [arr addObject:_trace_reference]
    }
    if(_ts_code.count > 0)
    {
        for(UMDiameterAvpTS_Code *o in _ts_code)
        {
            [arr addObject:o]
        }
    }
    if(_ss_code.count > 0)
    {
        for(UMDiameterAvpSS_Code *o in _ss_code)
        {
            [arr addObject:o]
        }
    }
    if(_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _avp)
        {
            [arr addObject:o]
        }
    }
    [self setAvps:arr];
}


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAVP *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpDSR_Flags  avpCode])
        {
            avp = [[UMDiameterAvpDSR_Flags alloc]initWithAvp:avp];
            _dsr_flags = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSCEF_ID avpCode])
        {
            avp = [[UMDiameterAvpSCEF_ID alloc]initWithAvp:avp];
            _scef_id = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpContext_Identifier avpCode])
        {
            avp = [[UMDiameterAvpContext_Identifier alloc]initWithAvp:avp];
            _context_identifier = avp;
            [knownAVPs addObject:avp];
            if(_context_identifier == NULL)
            {
                _context_identifier = @[avp];
            }
            else
            {
                _context_identifier = [_context_identifier arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpTrace_Reference avpCode])
        {
            avp = [[UMDiameterAvpTrace_Reference alloc]initWithAvp:avp];
            _trace_reference = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpTS_Code avpCode])
        {
            avp = [[UMDiameterAvpTS_Code alloc]initWithAvp:avp];
            _ts_code = avp;
            [knownAVPs addObject:avp];
            if(_ts_code == NULL)
            {
                _ts_code = @[avp];
            }
            else
            {
                _ts_code = [_ts_code arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpSS_Code avpCode])
        {
            avp = [[UMDiameterAvpSS_Code alloc]initWithAvp:avp];
            _ss_code = avp;
            [knownAVPs addObject:avp];
            if(_ss_code == NULL)
            {
                _ss_code = @[avp];
            }
            else
            {
                _ss_code = [_ss_code arrayByAddingObject:avp]
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
    _avp = unknownAVPs;
    [knownAVPs addObject:[_avp copy]];
    [self setArray:knownAVPs];
}


@end

