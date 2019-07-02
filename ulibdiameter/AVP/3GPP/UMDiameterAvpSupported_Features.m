//
//  UMDiameterAvpSupported_Features.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 12:46:31.997000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSupported_Features.h"
#import "UMDiameterAvpVendor_Id.h";
#import "UMDiameterAvpFeature_List_ID.h";
#import "UMDiameterAvpFeature_List.h";
#import "UMDiameterAvpAVP.h";

@implementation UMDiameterAvpSupported_Features


- (NSString *)avpType
{
    return @"Supported-Features";
}

- (uint32_t)avpCode
{
    return 628;
}

+ (uint32_t)avpCode
{
    return 628;
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
    if(_var_vendor_id)
    {
        [arr addObject:_var_vendor_id];
    }
    if(_var_feature_list_id)
    {
        [arr addObject:_var_feature_list_id];
    }
    if(_var_feature_list)
    {
        [arr addObject:_var_feature_list];
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
        if(avp.avpCode == [UMDiameterAvpVendor_Id  avpCode])
        {
            avp = [[UMDiameterAvpVendor_Id alloc]initWithAvp:avp];
            _var_vendor_id = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpFeature_List_ID avpCode])
        {
            avp = [[UMDiameterAvpFeature_List_ID alloc]initWithAvp:avp];
            _var_feature_list_id = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpFeature_List avpCode])
        {
            avp = [[UMDiameterAvpFeature_List alloc]initWithAvp:avp];
            _var_feature_list = avp;
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

