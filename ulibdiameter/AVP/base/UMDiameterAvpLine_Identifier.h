//
//  UMDiameterAvpLine_Identifier.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 13:49:36.549000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpOctetString.h"



@interface UMDiameterAvpLine_Identifier : UMDiameterAvpOctetString
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

