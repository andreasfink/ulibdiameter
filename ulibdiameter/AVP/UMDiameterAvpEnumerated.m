//
//  UMDiameterAvpEnumerated.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpEnumerated.h"

@implementation UMDiameterAvpEnumerated

- (NSString *)avpType
{
    return @"Enumerated";
}

- (UMDiameterAvpEnumerated *)initWithEnumDef:(NSDictionary *)dict value:(NSString *)val
{
    if((dict == NULL) || (val.length == 0))
    {
        return NULL;
    }
    NSNumber *n = dict[val];
    if(![n isKindOfClass:[NSNumber class]])
    {
        return NULL;
    }
    self = [super initWithNumber:n];
    return self;
}
@end
