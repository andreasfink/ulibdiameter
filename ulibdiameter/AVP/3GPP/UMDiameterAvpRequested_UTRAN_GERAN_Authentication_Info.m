//
//  UMDiameterAvpRequested_UTRAN_GERAN_Authentication_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 11:13:54.490000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRequested_UTRAN_GERAN_Authentication_Info.h"

@implementation UMDiameterAvpRequested_UTRAN_GERAN_Authentication_Info


- (NSString *)avpType
{
    return @"Requested-UTRAN-GERAN-Authentication-Info";
}

- (uint32_t)avpCode
{
    return 1409;
}

+ (uint32_t)avpCode
{
    return 1409;
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
    if(_var_number_of_requested_vectors)
    {
        [arr addObject:_var_number_of_requested_vectors];
    }
    if(_var_immediate_response_preferred)
    {
        [arr addObject:_var_immediate_response_preferred];
    }
    if(_var_re_synchronization_info)
    {
        [arr addObject:_var_re_synchronization_info];
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
        if(avp.avpCode == [UMDiameterAvpNumber_Of_Requested_Vectors  avpCode])
        {
            avp = [[UMDiameterAvpNumber_Of_Requested_Vectors alloc]initWithAvp:avp];
            _var_number_of_requested_vectors = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpImmediate_Response_Preferred avpCode])
        {
            avp = [[UMDiameterAvpImmediate_Response_Preferred alloc]initWithAvp:avp];
            _var_immediate_response_preferred = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpRe_synchronization_Info avpCode])
        {
            avp = [[UMDiameterAvpRe_synchronization_Info alloc]initWithAvp:avp];
            _var_re_synchronization_info = avp;
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

