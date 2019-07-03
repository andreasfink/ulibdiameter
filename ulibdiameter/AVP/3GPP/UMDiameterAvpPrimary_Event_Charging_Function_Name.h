//
//  UMDiameterAvpPrimary_Event_Charging_Function_Name.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 15:00:31.981000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpDiameterURI.h"



@interface UMDiameterAvpPrimary_Event_Charging_Function_Name : UMDiameterAvpDiameterURI
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

