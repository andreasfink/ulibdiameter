//
//  UMDiameterAvpVendor_Specific_Application_Id.h
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@interface UMDiameterAvpVendor_Specific_Application_Id : UMDiameterAvpGrouped
{
    NSNumber *_vendor;
    NSNumber *_application;
}

- (UMDiameterAvpVendor_Specific_Application_Id *)initWithString:(NSString *)str;

@end
