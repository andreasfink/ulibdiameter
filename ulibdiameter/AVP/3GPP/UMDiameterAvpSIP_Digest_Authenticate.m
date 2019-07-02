//
//  UMDiameterAvpSIP_Digest_Authenticate.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:20.551000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSIP_Digest_Authenticate.h"
#import "UMDiameterAvpDigest_Realm.h"
#import "UMDiameterAvpDigest_Algorithm.h"
#import "UMDiameterAvpDigest_QoP.h"
#import "UMDiameterAvpDigest_HA1.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpSIP_Digest_Authenticate


- (NSString *)avpType
{
    return @"SIP-Digest-Authenticate";
}

- (uint32_t)avpCode
{
    return 635;
}

+ (uint32_t)avpCode
{
    return 635;
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
    if(_var_digest_realm)
    {
        [arr addObject:_var_digest_realm];
    }
    if(_var_digest_algorithm)
    {
        [arr addObject:_var_digest_algorithm];
    }
    if(_var_digest_qop)
    {
        [arr addObject:_var_digest_qop];
    }
    if(_var_digest_ha1)
    {
        [arr addObject:_var_digest_ha1];
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
        if(avp.avpCode == [UMDiameterAvpDigest_Realm  avpCode])
        {
            avp = [[UMDiameterAvpDigest_Realm alloc]initWithAvp:avp];
            _var_digest_realm = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpDigest_Algorithm avpCode])
        {
            avp = [[UMDiameterAvpDigest_Algorithm alloc]initWithAvp:avp];
            _var_digest_algorithm = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpDigest_QoP avpCode])
        {
            avp = [[UMDiameterAvpDigest_QoP alloc]initWithAvp:avp];
            _var_digest_qop = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpDigest_HA1 avpCode])
        {
            avp = [[UMDiameterAvpDigest_HA1 alloc]initWithAvp:avp];
            _var_digest_ha1 = avp;
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

