//
//  UMDiameterAvpRedirect_Host_Usage.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 11:14:01.984000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpEnumerated.h"



@interface UMDiameterAvpRedirect_Host_Usage : UMDiameterAvpEnumerated
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

