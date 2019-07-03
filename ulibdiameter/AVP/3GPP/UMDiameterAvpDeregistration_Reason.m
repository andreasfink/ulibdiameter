//
//  UMDiameterAvpDeregistration_Reason.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 20:46:38.515000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDeregistration_Reason.h"
#import "UMDiameterAvpReason_Code.h"
#import "UMDiameterAvpReason_Info.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpDeregistration_Reason


- (NSString *)avpType
{
    return @"Deregistration-Reason";
}

- (uint32_t)avpCode
{
    return 615;
}

+ (uint32_t)avpCode
{
    return 615;
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
    if(_var_reason_code)
    {
        [arr addObject:_var_reason_code];
    }
    if(_var_reason_info)
    {
        [arr addObject:_var_reason_info];
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
        if(avp.avpCode == [UMDiameterAvpReason_Code  avpCode])
        {
            _var_reason_code = [[UMDiameterAvpReason_Code alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_reason_code];
        }
        else if(avp.avpCode == [UMDiameterAvpReason_Info avpCode])
        {
            _var_reason_info = [[UMDiameterAvpReason_Info alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_reason_info];
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

