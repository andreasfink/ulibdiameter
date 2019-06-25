//
//  UMDiameterAvp3GPP_UserIdentity.h
//  ulibdiameter
//
//  Created by Andreas Fink on 25.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"


@interface UMDiameterAvp3GPP_UserIdentity : UMDiameterAvpGrouped
{
    NSString *_public_identity;
    NSString *_msisdn;
    NSString *_external_identifier;
    NSArray *_additional_avps;
}

@property(readwrite,strong,atomic)  NSString *public_identity;
@property(readwrite,strong,atomic)  NSString *msisdn;
@property(readwrite,strong,atomic)  NSString *external_identifier;
@property(readwrite,strong,atomic)  NSArray *additional_avps;

@end

