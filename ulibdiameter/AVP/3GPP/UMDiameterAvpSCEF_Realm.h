//
//  UMDiameterAvpSCEF_Realm.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:17:01.105000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpDiameterIdentity.h"



@interface UMDiameterAvpSCEF_Realm : UMDiameterAvpDiameterIdentity
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

