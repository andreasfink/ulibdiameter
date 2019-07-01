//
//  UMDiameterAvpExperimental_Result.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:36.720000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpExperimental_Result.h"

@implementation UMDiameterAvpExperimental_Result


- (NSString *)avpType
{
    return @"Experimental-Result";
}

- (uint32_t)avpCode
{
    return 297;
}

+ (uint32_t)avpCode
{
    return 297;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_vendor_id)
    {
        [arr addObject:_vendor_id]
    }
    if(_experimental_result_code)
    {
        [arr addObject:_experimental_result_code]
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
        if(avp.avpCode == [UMDiameterAvpVendor_Id  avpCode])
        {
            avp = [[UMDiameterAvpVendor_Id alloc]initWithAvp:avp];
            _vendor_id = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpExperimental_Result_Code avpCode])
        {
            avp = [[UMDiameterAvpExperimental_Result_Code alloc]initWithAvp:avp];
            _experimental_result_code = avp;
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
    [self setArray:knownAVPs];
}


@end

