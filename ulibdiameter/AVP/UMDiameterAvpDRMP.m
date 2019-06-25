//
//  UMDiameterAvpDRMP.m
//  ulibdiameter
//
//  Created by Andreas Fink on 07.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpDRMP.h"

@implementation UMDiameterAvpDRMP

- (NSString *)avpType
{
    return @"DRMP";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_DRMP;
}

- (UMDiameterAvpDRMP *)initWithString:(NSString *)str
{
    self = [super init];
    if(self)
    {
        [self setStringValue:str];
    }
    return self;
}

- (NSString *)stringValue
{
    if((_value >=0) && (_value <16))
    {
        return [NSString stringWithFormat:@"PRIORITY_%d",(int)_value];
    }
    return [NSString stringWithFormat:@"undefined(%d)",(int)_value];
}

- (void)setStringValue:(NSString *)str
{
    if([str hasCaseInsensitivePrefix:@"PRIORITY_"])
    {
        str = [str substringFromIndex:9];
    }
    _value = atoi(str.UTF8String);
}

@end
