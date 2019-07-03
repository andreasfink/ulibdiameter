//
//  UMDiameterAvpService_Report.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 20:46:38.515000
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


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpService_Result  avpCode])
        {
            _var_service_result = [[UMDiameterAvpService_Result alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_service_result];
        }
        else if(avp.avpCode == [UMDiameterAvpNode_Type avpCode])
        {
            _var_node_type = [[UMDiameterAvpNode_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_node_type];
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

