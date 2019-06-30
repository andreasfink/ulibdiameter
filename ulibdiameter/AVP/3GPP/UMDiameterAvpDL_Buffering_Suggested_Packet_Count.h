//
//  UMDiameterAvpDL_Buffering_Suggested_Packet_Count.h
//  ulibdiameter
//
//  Created by afink on 2019-06-30 23:29:55.405000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpInteger32.h"


@interface UMDiameterAvpDL_Buffering_Suggested_Packet_Count : UMDiameterAvpInteger32

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
@end

