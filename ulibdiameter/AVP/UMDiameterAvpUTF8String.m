//
//  UMDiameterAvpUTF8String.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpUTF8String.h"

@implementation UMDiameterAvpUTF8String

- (NSString *)avpType
{
    return @"UTF8String";
}

- (NSString *)value
{
    return [[NSString alloc] initWithData:_avpData encoding:NSUTF8StringEncoding];
}

- (void)setValue:(NSString *)v
{
    _avpData = [v dataUsingEncoding:NSUTF8StringEncoding];
}



- (UMSynchronizedSortedDictionary *)objectValue
{
    UMSynchronizedSortedDictionary *dict = [super objectValue];
    dict[@"utf8-string"] = [self value];
    return dict;
}
@end
