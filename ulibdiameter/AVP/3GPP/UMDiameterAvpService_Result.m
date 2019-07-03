//
//  UMDiameterAvpService_Result.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 15:00:31.981000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpService_Result.h"
#import "UMDiameterAvpVendor_Id.h"
#import "UMDiameterAvpService_Result_Code.h"

@implementation UMDiameterAvpService_Result


- (NSString *)avpType
{
    return @"Service-Result";
}

- (uint32_t)avpCode
{
    return 3146;
}

+ (uint32_t)avpCode
{
    return 3146;
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
    if(_var_vendor_id.count > 0)
    {
        for(UMDiameterAvpVendor_Id *o in _var_vendor_id)
        {
            [arr addObject:o];
        }
    }
    if(_var_service_result_code)
    {
        [arr addObject:_var_service_result_code];
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
        if(avp.avpCode == [UMDiameterAvpVendor_Id  avpCode])
        {
            UMDiameterAvpVendor_Id *avp2 = [[UMDiameterAvpVendor_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_vendor_id == NULL)
            {
                _var_vendor_id = @[avp2];
            }
            else
            {
                _var_vendor_id = [_var_vendor_id arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpService_Result_Code avpCode])
        {
            _var_service_result_code = [[UMDiameterAvpService_Result_Code alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_service_result_code];
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

