//
//  UMDiameterAvpAccounting_Record_Number.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 14:58:07.234000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned32.h"



@interface UMDiameterAvpAccounting_Record_Number : UMDiameterAvpUnsigned32
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

