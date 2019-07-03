//
//  UMDiameterAvpUE_Reachability_Configuration.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUE_Reachability_Configuration.h"
#import "UMDiameterAvpReachability_Type.h"
#import "UMDiameterAvpMaximum_Response_Time.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpUE_Reachability_Configuration


- (NSString *)avpType
{
    return @"UE-Reachability-Configuration";
}

- (uint32_t)avpCode
{
    return 3129;
}

+ (uint32_t)avpCode
{
    return 3129;
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
    if(_var_reachability_type)
    {
        [arr addObject:_var_reachability_type];
    }
    if(_var_maximum_response_time)
    {
        [arr addObject:_var_maximum_response_time];
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
        if(avp.avpCode == [UMDiameterAvpReachability_Type  avpCode])
        {
            _var_reachability_type = [[UMDiameterAvpReachability_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_reachability_type];
        }
        else if(avp.avpCode == [UMDiameterAvpMaximum_Response_Time avpCode])
        {
            _var_maximum_response_time = [[UMDiameterAvpMaximum_Response_Time alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_maximum_response_time];
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

