//
//  UMDiameterAvpSIP_Digest_Authenticate.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
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


//- (void)afterDecode
/* skipped as there's no properties to decode */


@end

