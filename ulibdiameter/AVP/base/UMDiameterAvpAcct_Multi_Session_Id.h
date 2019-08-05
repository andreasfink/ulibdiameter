//
//  UMDiameterAvpAcct_Multi_Session_Id.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.174000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUTF8String.h"



@interface UMDiameterAvpAcct_Multi_Session_Id : UMDiameterAvpUTF8String
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

