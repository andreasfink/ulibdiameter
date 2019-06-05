//
//  UMDiameterAvpDiameterIdentity.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpDiameterIdentity.h"

@implementation UMDiameterAvpDiameterIdentity



- (NSString *)avpType
{
    return @"DiameterIdentity";
}


- (UMSynchronizedSortedDictionary *)objectValue
{
    UMSynchronizedSortedDictionary *dict = [super objectValue];
    NSString *s = [[NSString alloc]initWithData:_avpData encoding:NSUTF8StringEncoding];
    if(s)
    {
        dict[@"octet-string"] = s;
    }
    return dict;
}
@end
