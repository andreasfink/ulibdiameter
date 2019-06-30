//
//  UMDiameterAvpUser_Id.h
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:24:58.634000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUTF8String.h"


@interface UMDiameterAvpUser_Id : UMDiameterAvpUTF8String

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
@end

