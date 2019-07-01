//
//  UMDiameterAvpVPLMN_CSG_Subscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpVPLMN_CSG_Subscription_Data.h"

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
    if(_csg_id)
    {
        [arr addObject:_csg_id]
    }
    if(_expiration_date)
    {
        [arr addObject:_expiration_date]
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
        if(avp.avpCode == [UMDiameterAvpCSG_Id  avpCode])
        {
            avp = [[UMDiameterAvpCSG_Id alloc]initWithAvp:avp];
            _csg_id = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpExpiration_Date avpCode])
        {
            avp = [[UMDiameterAvpExpiration_Date alloc]initWithAvp:avp];
            _expiration_date = avp;
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

