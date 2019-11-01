//
//  UMDiameterAvpOC_Report_Type.h
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:36.354000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpEnumerated.h"



@interface UMDiameterAvpOC_Report_Type : UMDiameterAvpEnumerated
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

