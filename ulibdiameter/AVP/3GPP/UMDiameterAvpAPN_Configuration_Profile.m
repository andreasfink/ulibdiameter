//
//  UMDiameterAvpAPN_Configuration_Profile.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAPN_Configuration_Profile.h"

@implementation UMDiameterAvpAPN_Configuration_Profile


- (NSString *)avpType
{
    return @"APN-Configuration-Profile";
}

- (uint32_t)avpCode
{
    return 1429;
}

+ (uint32_t)avpCode
{
    return 1429;
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
    if(_context_identifier)
    {
        [arr addObject:_context_identifier]
    }
    if(_additional_context_identifier)
    {
        [arr addObject:_additional_context_identifier]
    }
    if(_all_apn_configurations_included_indicator)
    {
        [arr addObject:_all_apn_configurations_included_indicator]
    }
    if(_apn_configuration.count > 0)
    {
        for(UMDiameterAvpAPN_Configuration *o in _apn_configuration)
        {
            [arr addObject:o]
        }
    }
    if(_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _avp)
        {
            [arr addObject:o]
        }
    }
    [self setAvps:arr];
}


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAVP *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpContext_Identifier  avpCode])
        {
            avp = [[UMDiameterAvpContext_Identifier alloc]initWithAvp:avp];
            _context_identifier = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAdditional_Context_Identifier avpCode])
        {
            avp = [[UMDiameterAvpAdditional_Context_Identifier alloc]initWithAvp:avp];
            _additional_context_identifier = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAll_APN_Configurations_Included_Indicator avpCode])
        {
            avp = [[UMDiameterAvpAll_APN_Configurations_Included_Indicator alloc]initWithAvp:avp];
            _all_apn_configurations_included_indicator = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAPN_Configuration avpCode])
        {
            avp = [[UMDiameterAvpAPN_Configuration alloc]initWithAvp:avp];
            _apn_configuration = avp;
            [knownAVPs addObject:avp];
            if(_apn_configuration == NULL)
            {
                _apn_configuration = @[avp];
            }
            else
            {
                _apn_configuration = [_apn_configuration arrayByAddingObject:avp]
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
    _avp = unknownAVPs;
    [knownAVPs addObject:[_avp copy]];
    [self setArray:knownAVPs];
}


@end

