//
//  UMDiameterAvpService_Report.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpService_Report.h"
#import "UMDiameterAvpService_Result.h"
#import "UMDiameterAvpNode_Type.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpService_Report


- (NSString *)avpType
{
    return @"Service-Report";
}

- (uint32_t)avpCode
{
    return 3152;
}

+ (uint32_t)avpCode
{
    return 3152;
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
    if(_var_service_result)
    {
        [arr addObject:_var_service_result];
    }
    if(_var_node_type)
    {
        [arr addObject:_var_node_type];
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


//- (void)afterDecode
/* skipped as there's no properties to decode */


@end

