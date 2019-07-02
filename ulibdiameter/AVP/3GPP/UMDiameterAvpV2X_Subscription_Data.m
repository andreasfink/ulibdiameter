//
//  UMDiameterAvpV2X_Subscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 12:46:31.997000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpV2X_Subscription_Data.h"
#import "UMDiameterAvpV2X_Permission.h";
#import "UMDiameterAvpUE_PC5_AMBR.h";
#import "UMDiameterAvpAVP.h";

@implementation UMDiameterAvpV2X_Subscription_Data


- (NSString *)avpType
{
    return @"V2X-Subscription-Data";
}

- (uint32_t)avpCode
{
    return 1688;
}

+ (uint32_t)avpCode
{
    return 1688;
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
    if(_var_v2x_permission)
    {
        [arr addObject:_var_v2x_permission];
    }
    if(_var_ue_pc5_ambr)
    {
        [arr addObject:_var_ue_pc5_ambr];
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

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpV2X_Permission  avpCode])
        {
            avp = [[UMDiameterAvpV2X_Permission alloc]initWithAvp:avp];
            _var_v2x_permission = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpUE_PC5_AMBR avpCode])
        {
            avp = [[UMDiameterAvpUE_PC5_AMBR alloc]initWithAvp:avp];
            _var_ue_pc5_ambr = avp;
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
    _var_avp = unknownAVPs;
    [knownAVPs addObject:[_var_avp copy]];
    [self setArray:knownAVPs];
}


@end

