//
//  UMDiameterAvpSecondary_Charging_Collection_Function_Name.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 22:48:02.389000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpDiameterURI.h"



@interface UMDiameterAvpSecondary_Charging_Collection_Function_Name : UMDiameterAvpDiameterURI
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

