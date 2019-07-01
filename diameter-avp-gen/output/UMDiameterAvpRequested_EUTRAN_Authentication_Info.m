//
//  UMDiameterAvpRequested_EUTRAN_Authentication_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpRequested_EUTRAN_Authentication_Info


- (NSString *)avpType
{
    return @"Requested-EUTRAN-Authentication-Info";
}

- (uint32_t)avpCode
{
    return 1408;
}

+ (uint32_t)avpCode
{
    return 1408;
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
    if(_number_of_requested_vectors)
    {
        [arr addObject:_number_of_requested_vectors]
    }
    if(_immediate_response_preferred)
    {
        [arr addObject:_immediate_response_preferred]
    }
    if(_re_synchronization_info)
    {
        [arr addObject:_re_synchronization_info]
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
        if(avp.avpCode == [UMDiameterAvpNumber_Of_Requested_Vectors  avpCode])
        {
            avp = [[UMDiameterAvpNumber_Of_Requested_Vectors alloc]initWithAvp:avp];
            _number_of_requested_vectors = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpImmediate_Response_Preferred avpCode])
        {
            avp = [[UMDiameterAvpImmediate_Response_Preferred alloc]initWithAvp:avp];
            _immediate_response_preferred = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpRe_synchronization_Info avpCode])
        {
            avp = [[UMDiameterAvpRe_synchronization_Info alloc]initWithAvp:avp];
            _re_synchronization_info = avp;
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
    _avp = unknownAVPs;
    [knownAVPs addObject:[_avp copy]];
    [self setArray:knownAVPs];
}


@end

