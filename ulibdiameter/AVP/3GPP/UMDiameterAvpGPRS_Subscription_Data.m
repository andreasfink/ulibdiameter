//
//  UMDiameterAvpGPRS_Subscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:34:59.588000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGPRS_Subscription_Data.h"
#import "UMDiameterAvpComplete_Data_List_Included_Indicator.h"
#import "UMDiameterAvpPDP_Context.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpGPRS_Subscription_Data


- (NSString *)avpType
{
    return @"GPRS-Subscription-Data";
}

- (uint32_t)avpCode
{
    return 1467;
}

+ (uint32_t)avpCode
{
    return 1467;
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
    if(_var_complete_data_list_included_indicator)
    {
        [arr addObject:_var_complete_data_list_included_indicator];
    }
    if(_var_pdp_context.count > 0)
    {
        for(UMDiameterAvpPDP_Context *o in _var_pdp_context)
        {
            [arr addObject:o];
        }
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
        if(avp.avpCode == [UMDiameterAvpComplete_Data_List_Included_Indicator  avpCode])
        {
            _var_complete_data_list_included_indicator = [[UMDiameterAvpComplete_Data_List_Included_Indicator alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_complete_data_list_included_indicator];
        }
        else if(avp.avpCode == [UMDiameterAvpPDP_Context avpCode])
        {
            UMDiameterAvpPDP_Context *avp2 = [[UMDiameterAvpPDP_Context alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_pdp_context == NULL)
            {
                _var_pdp_context = @[avp];
            }
            else
            {
                _var_pdp_context = [_var_pdp_context arrayByAddingObject:avp];
            }
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

