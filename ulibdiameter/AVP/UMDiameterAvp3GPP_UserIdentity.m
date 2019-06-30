//
//  UMDiameterAvp3GPP_UserIdentity.m
//  ulibdiameter
//
//  Created by Andreas Fink on 25.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp3GPP_UserIdentity.h"
#import "UMDiameterAvpAll.h"

/*
 User-Identity ::= <AVP header: 700 10415>
 [Public-Identity] [MSISDN] [External-Identifier] *[AVP]
 */
@implementation UMDiameterAvp3GPP_UserIdentity

- (NSString *)avpType
{
    return @"User-Identity";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_3GPP_User_Identity;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = UMDiameterVendorId_3GPP;
}

- (NSString *)stringValue
{
    return NULL;
}

-(void)setStringValue:(NSString *)str
{
}

- (void)beforeEncode
{
    if(_public_identity.length  > 0)
    {
        UMDiameterAvp3GPP_Public_Identity *avp = [[UMDiameterAvp3GPP_Public_Identity alloc]init];
        avp.stringValue = _public_identity;
        [self appendAvp:avp];
    }
    else if(_msisdn)
    {
        UMDiameterAvp3GPP_MSISDN *avp = [[UMDiameterAvp3GPP_MSISDN alloc]init];
        avp.stringValue = _msisdn;
        [self appendAvp:avp];

    }
    else if(_external_identifier)
    {
        UMDiameterAvp3GPP_External_Identifier *avp = [[UMDiameterAvp3GPP_External_Identifier alloc]init];
        avp.stringValue = _external_identifier;
        [self appendAvp:avp];

    }
    for(UMDiameterAvp *avp in _additional_avps)
    {
        [self appendAvp:avp];
    }
}
@end
