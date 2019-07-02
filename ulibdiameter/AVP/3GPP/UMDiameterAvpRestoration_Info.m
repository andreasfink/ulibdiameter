//
//  UMDiameterAvpRestoration_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:13:25.004000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRestoration_Info.h"
#import "UMDiameterAvpPath.h"
#import "UMDiameterAvpContact.h"
#import "UMDiameterAvpInitial_CSeq_Sequence_Number.h"
#import "UMDiameterAvpSubscription_Info.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpRestoration_Info


- (NSString *)avpType
{
    return @"Restoration-Info";
}

- (uint32_t)avpCode
{
    return 649;
}

+ (uint32_t)avpCode
{
    return 649;
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
    if(_var_path)
    {
        [arr addObject:_var_path];
    }
    if(_var_contact)
    {
        [arr addObject:_var_contact];
    }
    if(_var_initial_cseq_sequence_number)
    {
        [arr addObject:_var_initial_cseq_sequence_number];
    }
    if(_var_subscription_info)
    {
        [arr addObject:_var_subscription_info];
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
        if(avp.avpCode == [UMDiameterAvpPath  avpCode])
        {
            _var_path = [[UMDiameterAvpPath alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_path];
        }
        else if(avp.avpCode == [UMDiameterAvpContact avpCode])
        {
            _var_contact = [[UMDiameterAvpContact alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_contact];
        }
        else if(avp.avpCode == [UMDiameterAvpInitial_CSeq_Sequence_Number avpCode])
        {
            _var_initial_cseq_sequence_number = [[UMDiameterAvpInitial_CSeq_Sequence_Number alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_initial_cseq_sequence_number];
        }
        else if(avp.avpCode == [UMDiameterAvpSubscription_Info avpCode])
        {
            _var_subscription_info = [[UMDiameterAvpSubscription_Info alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_subscription_info];
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

