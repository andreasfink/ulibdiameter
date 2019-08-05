//
//  UMDiameterAvpRoute_Record.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:34.427000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpDiameterIdentity.h"



@interface UMDiameterAvpRoute_Record : UMDiameterAvpDiameterIdentity
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

