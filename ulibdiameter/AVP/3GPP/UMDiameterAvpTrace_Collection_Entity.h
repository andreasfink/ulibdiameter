//
//  UMDiameterAvpTrace_Collection_Entity.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 12:46:31.997000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAddress.h"



@interface UMDiameterAvpTrace_Collection_Entity : UMDiameterAvpAddress
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

