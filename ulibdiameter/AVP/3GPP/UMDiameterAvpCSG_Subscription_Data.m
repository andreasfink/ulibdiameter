//
//  UMDiameterAvpCSG_Subscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:20.551000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCSG_Subscription_Data.h"
#import "UMDiameterAvpCSG_Id.h"
#import "UMDiameterAvpExpiration_Date.h"
#import "UMDiameterAvpService_Selection.h"
#import "UMDiameterAvpVisited_PLMN_Id.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpCSG_Subscription_Data


- (NSString *)avpType
{
    return @"CSG-Subscription-Data";
}

- (uint32_t)avpCode
{
    return 1436;
}

+ (uint32_t)avpCode
{
    return 1436;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
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
    if(_var_service_selection.count > 0)
    {
        for(UMDiameterAvpService_Selection *o in _var_service_selection)
        {
            [arr addObject:o];
        }
    }
    if(_var_visited_plmn_id)
    {
        [arr addObject:_var_visited_plmn_id];
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
        if(avp.avpCode == [UMDiameterAvpCSG_Id  avpCode])
        {
            avp = [[UMDiameterAvpCSG_Id alloc]initWithAvp:avp];
            _var_csg_id = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpExpiration_Date avpCode])
        {
            avp = [[UMDiameterAvpExpiration_Date alloc]initWithAvp:avp];
            _var_expiration_date = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpService_Selection avpCode])
        {
            avp = [[UMDiameterAvpService_Selection alloc]initWithAvp:avp];
            _var_service_selection = avp;
            [knownAVPs addObject:avp];
            if(_var_service_selection == NULL)
            {
                _var_service_selection = @[avp];
            }
            else
            {
                _var_service_selection = [_var_service_selection arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpVisited_PLMN_Id avpCode])
        {
            avp = [[UMDiameterAvpVisited_PLMN_Id alloc]initWithAvp:avp];
            _var_visited_plmn_id = avp;
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

