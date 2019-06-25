//
//  UMDiameterAvp3GPP_Supported_Features.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp3GPP_Supported_Features.h"

#import "UMDiameterAvpAll.h"

/*
 Supported-Features ::= < A VP header: 628 10415 >
 { Vendor-Id }
 { Feature-List-ID }
 { Feature-List }
 *[AVP]
 */

@implementation UMDiameterAvp3GPP_Supported_Features


- (NSString *)avpType
{
    return @"Supported-Features";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_3GPP_Supported_Features;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor; /* optionally mandatory */
    _avpVendorId = UMDiameterApplicationId_3GPP;
    _vendor_id = UMDiameterApplicationId_3GPP;
}

- (UMDiameterAvp3GPP_Supported_Features *)initWithString:(NSString *)str
{
    self = [super init];
    if(self)
    {
        [self setStringValue:str];
    }
    return self;
}

- (NSString *)stringValue
{
    return [NSString stringWithFormat:@"%u:%u",_feature_list_id,_feature_list];
}

- (void)setStringValue:(NSString *)str
{
    uint32_t a;
    uint32_t b;
    sscanf(str.UTF8String,"%u:%u",&a,&b);
    _feature_list_id = a;
    _feature_list = b;
}

- (void)beforeEncode
{
    
    UMDiameterAvpVendorId *avp0 = [[UMDiameterAvpVendorId alloc]init];
    [avp0 setFlagMandatory:YES];
    avp0.value = _avpVendorId;
    [self appendAvp:avp0];


    UMDiameterAvp3GPP_Feature_List_ID *avp1 = [[UMDiameterAvp3GPP_Feature_List_ID alloc]init];
    [avp1 setFlagMandatory:YES];
    avp1.value = _feature_list_id;
    [self appendAvp:avp1];


    UMDiameterAvp3GPP_Feature_List *avp2 = [[UMDiameterAvp3GPP_Feature_List alloc]init];
    [avp2 setFlagMandatory:YES];
    avp2.value = _feature_list;
    [self appendAvp:avp2];

    for(UMDiameterAvp *avp in _additional_avps)
    {
        [self appendAvp:avp];
    }
}

@end
