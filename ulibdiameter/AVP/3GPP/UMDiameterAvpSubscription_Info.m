//
//  UMDiameterAvpSubscription_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:34:59.588000
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


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpCall_ID_SIP_Header  avpCode])
        {
            _var_call_id_sip_header = [[UMDiameterAvpCall_ID_SIP_Header alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_call_id_sip_header];
        }
        else if(avp.avpCode == [UMDiameterAvpTo_SIP_Header avpCode])
        {
            _var_to_sip_header = [[UMDiameterAvpTo_SIP_Header alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_to_sip_header];
        }
        else if(avp.avpCode == [UMDiameterAvpRecord_Route avpCode])
        {
            _var_record_route = [[UMDiameterAvpRecord_Route alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_record_route];
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

