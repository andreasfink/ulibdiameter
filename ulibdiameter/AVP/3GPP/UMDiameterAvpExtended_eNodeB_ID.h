//
//  UMDiameterAvpExtended_eNodeB_ID.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpOctetString.h"



@interface UMDiameterAvpExtended_eNodeB_ID : UMDiameterAvpOctetString
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

