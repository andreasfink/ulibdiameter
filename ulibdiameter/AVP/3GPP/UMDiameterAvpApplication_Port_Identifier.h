//
//  UMDiameterAvpApplication_Port_Identifier.h
//  ulibdiameter
//
//  Created by afink on 2021-03-26 22:38:32.093081
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUnsigned32.h"



@interface UMDiameterAvpApplication_Port_Identifier : UMDiameterAvpUnsigned32
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

