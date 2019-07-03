//
//  UMDiameterAvpAssociated_Identities.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 20:46:38.515000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAssociated_Identities.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpAssociated_Identities


- (NSString *)avpType
{
    return @"Associated-Identities";
}

- (uint32_t)avpCode
{
    return 632;
}

+ (uint32_t)avpCode
{
    return 632;
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
    if(_var_user_name.count > 0)
    {
        for(UMDiameterAvpUser_Name *o in _var_user_name)
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
        if(avp.avpCode == [UMDiameterAvpUser_Name  avpCode])
        {
            UMDiameterAvpUser_Name *avp2 = [[UMDiameterAvpUser_Name alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_user_name == NULL)
            {
                _var_user_name = @[avp2];
            }
            else
            {
                _var_user_name = [_var_user_name arrayByAddingObject:avp2];
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

