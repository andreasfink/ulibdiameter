//
//  UMDiameterAvpHostIpAddress.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpHostIpAddress.h"

@implementation UMDiameterAvpHostIpAddress


- (uint32_t)avpCode
{
    return UMDiameterAvpCode_HostIpAddress;
}

- (void)setHostIPv4Address:(NSString *)theAddr
{
    uint8_t b[2];
    b[0]=0;
    b[1]=1;
    NSData *d = [theAddr binaryIPAddress4];
    NSMutableData *data = [[NSMutableData alloc]initWithBytes:b length:sizeof(b)];
    [data appendData:d];
    [self setAvpData:data];
}


- (void)setHostIPv6Address:(NSString *)theAddr
{
    uint8_t b[2];
    b[0]=0;
    b[1]=2;
    NSData *d = [theAddr binaryIPAddress6];
    NSMutableData *data = [[NSMutableData alloc]initWithBytes:b length:sizeof(b)];
    [data appendData:d];
    [self setAvpData:data];
}

- (void)setHostIPAddress:(NSString *)theAddr
{

    if([theAddr isIPv6])
    {
        [self setHostIPv6Address:theAddr];
    }
    else
    {
        [self setHostIPv4Address:theAddr];
    }
}

@end
