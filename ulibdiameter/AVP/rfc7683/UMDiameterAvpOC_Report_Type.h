//
//  UMDiameterAvpOC_Report_Type.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 09:15:57.082000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpEnumerated.h"



@interface UMDiameterAvpOC_Report_Type : UMDiameterAvpEnumerated
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

