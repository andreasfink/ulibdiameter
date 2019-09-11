//
//  UMDiameterAvpCSG_Subscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
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


//- (void)afterDecode
/* skipped as there's no properties to decode */


@end

