//
//  UMDiameterAvpUser_CSG_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:29:38.359000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUser_CSG_Information.h"
#import "UMDiameterAvpCSG_ID.h"
#import "UMDiameterAvpCSG_Access_Mode.h"
#import "UMDiameterAvpCSG_Membership_Indication.h"

@implementation UMDiameterAvpUser_CSG_Information


- (NSString *)avpType
{
    return @"User-CSG-Information";
}

- (uint32_t)avpCode
{
    return 2319;
}

+ (uint32_t)avpCode
{
    return 2319;
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
    if(_var_csg_access_mode)
    {
        [arr addObject:_var_csg_access_mode];
    }
    if(_var_csg_membership_indication)
    {
        [arr addObject:_var_csg_membership_indication];
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
        else if(avp.avpCode == [UMDiameterAvpCSG_Access_Mode avpCode])
        {
            _var_csg_access_mode = [[UMDiameterAvpCSG_Access_Mode alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_csg_access_mode];
        }
        else if(avp.avpCode == [UMDiameterAvpCSG_Membership_Indication avpCode])
        {
            _var_csg_membership_indication = [[UMDiameterAvpCSG_Membership_Indication alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_csg_membership_indication];
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
    [self setArray:knownAVPs];
}


@end

