//
//  UMDiameterAvpCSG_Subscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 15:00:31.981000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCSG_Subscription_Data.h"
#import "UMDiameterAvpCSG_ID.h"
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
        else if(avp.avpCode == [UMDiameterAvpService_Selection avpCode])
        {
            UMDiameterAvpService_Selection *avp2 = [[UMDiameterAvpService_Selection alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_service_selection == NULL)
            {
                _var_service_selection = @[avp2];
            }
            else
            {
                _var_service_selection = [_var_service_selection arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpVisited_PLMN_Id avpCode])
        {
            _var_visited_plmn_id = [[UMDiameterAvpVisited_PLMN_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_visited_plmn_id];
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

