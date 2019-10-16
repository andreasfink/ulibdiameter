//
//  UMDiameterAvpRedirect_Host_Usage.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.128000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpEnumerated.h"



@interface UMDiameterAvpRedirect_Host_Usage : UMDiameterAvpEnumerated
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

