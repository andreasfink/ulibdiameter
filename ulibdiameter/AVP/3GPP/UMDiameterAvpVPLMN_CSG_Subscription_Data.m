//
//  UMDiameterAvpVPLMN_CSG_Subscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 20:46:38.515000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpVPLMN_CSG_Subscription_Data.h"
#import "UMDiameterAvpCSG_ID.h"
#import "UMDiameterAvpExpiration_Date.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpVPLMN_CSG_Subscription_Data


- (NSString *)avpType
{
    return @"VPLMN-CSG-Subscription-Data";
}

- (uint32_t)avpCode
{
    return 1641;
}

+ (uint32_t)avpCode
{
    return 1641;
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
    if(_var_csg_id)
    {
        [arr addObject:_var_csg_id];
    }
    if(_var_expiration_date)
    {
        [arr addObject:_var_expiration_date];
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
        if(avp.avpCode == [UMDiameterAvpCSG_ID  avpCode])
        {
            _var_csg_id = [[UMDiameterAvpCSG_ID alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_csg_id];
        }
        else if(avp.avpCode == [UMDiameterAvpExpiration_Date avpCode])
        {
            _var_expiration_date = [[UMDiameterAvpExpiration_Date alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_expiration_date];
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

