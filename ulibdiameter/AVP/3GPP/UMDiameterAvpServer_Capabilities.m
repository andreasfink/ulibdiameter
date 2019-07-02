//
//  UMDiameterAvpServer_Capabilities.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 22:48:02.389000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpServer_Capabilities.h"
#import "UMDiameterAvpMandatory_Capability.h"
#import "UMDiameterAvpOptional_Capability.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpServer_Capabilities


- (NSString *)avpType
{
    return @"Server-Capabilities";
}

- (uint32_t)avpCode
{
    return 603;
}

+ (uint32_t)avpCode
{
    return 603;
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
    if(_var_mandatory_capability.count > 0)
    {
        for(UMDiameterAvpMandatory_Capability *o in _var_mandatory_capability)
        {
            [arr addObject:o];
        }
    }
    if(_var_optional_capability.count > 0)
    {
        for(UMDiameterAvpOptional_Capability *o in _var_optional_capability)
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
        if(avp.avpCode == [UMDiameterAvpMandatory_Capability  avpCode])
        {
            UMDiameterAvpMandatory_Capability *avp2 = [[UMDiameterAvpMandatory_Capability alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_mandatory_capability == NULL)
            {
                _var_mandatory_capability = @[avp];
            }
            else
            {
                _var_mandatory_capability = [_var_mandatory_capability arrayByAddingObject:avp];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpOptional_Capability avpCode])
        {
            UMDiameterAvpOptional_Capability *avp2 = [[UMDiameterAvpOptional_Capability alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_optional_capability == NULL)
            {
                _var_optional_capability = @[avp];
            }
            else
            {
                _var_optional_capability = [_var_optional_capability arrayByAddingObject:avp];
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

