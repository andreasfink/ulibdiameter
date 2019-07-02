//
//  UMDiameterAvpRestoration_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:20.551000
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

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpPath  avpCode])
        {
            avp = [[UMDiameterAvpPath alloc]initWithAvp:avp];
            _var_path = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpContact avpCode])
        {
            avp = [[UMDiameterAvpContact alloc]initWithAvp:avp];
            _var_contact = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpInitial_CSeq_Sequence_Number avpCode])
        {
            avp = [[UMDiameterAvpInitial_CSeq_Sequence_Number alloc]initWithAvp:avp];
            _var_initial_cseq_sequence_number = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSubscription_Info avpCode])
        {
            avp = [[UMDiameterAvpSubscription_Info alloc]initWithAvp:avp];
            _var_subscription_info = avp;
            [knownAVPs addObject:avp];
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

