//
//  UMDiameterAvpPrimary_Event_Charging_Function_Name.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpDiameterURI.h>



@interface UMDiameterAvpPrimary_Event_Charging_Function_Name : UMDiameterAvpDiameterURI
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

