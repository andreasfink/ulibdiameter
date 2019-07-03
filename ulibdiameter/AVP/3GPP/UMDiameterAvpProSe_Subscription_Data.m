//
//  UMDiameterAvpProSe_Subscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpProSe_Subscription_Data.h"
#import "UMDiameterAvpProSe_Permission.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpProSe_Subscription_Data


- (NSString *)avpType
{
    return @"ProSe-Subscription-Data";
}

- (uint32_t)avpCode
{
    return 3701;
}

+ (uint32_t)avpCode
{
    return 3701;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_prose_permission.count > 0)
    {
        for(UMDiameterAvpProSe_Permission *o in _var_prose_permission)
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
        if(avp.avpCode == [UMDiameterAvpProSe_Permission  avpCode])
        {
            UMDiameterAvpProSe_Permission *avp2 = [[UMDiameterAvpProSe_Permission alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_prose_permission == NULL)
            {
                _var_prose_permission = @[avp2];
            }
            else
            {
                _var_prose_permission = [_var_prose_permission arrayByAddingObject:avp2];
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

