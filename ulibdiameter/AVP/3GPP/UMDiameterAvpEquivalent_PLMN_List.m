//
//  UMDiameterAvpEquivalent_PLMN_List.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:20.551000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEquivalent_PLMN_List.h"
#import "UMDiameterAvpVisited_PLMN_Id.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpEquivalent_PLMN_List


- (NSString *)avpType
{
    return @"Equivalent-PLMN-List";
}

- (uint32_t)avpCode
{
    return 1637;
}

+ (uint32_t)avpCode
{
    return 1637;
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
    if(_var_visited_plmn_id.count > 0)
    {
        for(UMDiameterAvpVisited_PLMN_Id *o in _var_visited_plmn_id)
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

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpVisited_PLMN_Id  avpCode])
        {
            avp = [[UMDiameterAvpVisited_PLMN_Id alloc]initWithAvp:avp];
            _var_visited_plmn_id = avp;
            [knownAVPs addObject:avp];
            if(_var_visited_plmn_id == NULL)
            {
                _var_visited_plmn_id = @[avp];
            }
            else
            {
                _var_visited_plmn_id = [_var_visited_plmn_id arrayByAddingObject:avp]
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

