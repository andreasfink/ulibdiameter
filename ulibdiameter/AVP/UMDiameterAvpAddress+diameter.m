//
//  UMDiameterAvpAddress+diameter.m
//  ulibdiameter
//
//  Created by Andreas Fink on 13.10.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAddress+diameter.h"


@implementation UMDiameterAvpAddress (diameter)

- (void)setStringValue:(NSString *)string
{
    if([string hasPrefix:@"ipv4:"])
    {
        string =  [UMSocket deunifyIp:string];
        NSArray *arr = [string  componentsSeparatedByString:@"."];
        if(arr.count==4)
        {
            uint8_t bytes[6];
            bytes[0]=0x00;
            bytes[1]=0x01;
            bytes[2]=[arr[0] intValue] & 0xFF;
            bytes[3]=[arr[1] intValue] & 0xFF;
            bytes[4]=[arr[2] intValue] & 0xFF;
            bytes[5]=[arr[3] intValue] & 0xFF;
            [self setDataValue:[NSData dataWithBytes:&bytes length:6]];
        }
    }
    else if([string hasPrefix:@"ipv6:"])
    {
        /* FIXME: we need to encode IPv6 here */
            uint8_t bytes[6];
            bytes[0]=0x00;
            bytes[1]=0x02; /* ? */
    }
    else
    {
        NSArray *arr = [string  componentsSeparatedByString:@"."];
        if(arr.count==4)
        {
            uint8_t bytes[6];
            bytes[0]=0x00;
            bytes[1]=0x01;
            bytes[2]=[arr[0] intValue] & 0xFF;
            bytes[3]=[arr[1] intValue] & 0xFF;
            bytes[4]=[arr[2] intValue] & 0xFF;
            bytes[5]=[arr[3] intValue] & 0xFF;
            [self setDataValue:[NSData dataWithBytes:&bytes length:6]];
        }
    }
}

- (NSString *)stringValue
{
    uint8_t *bytes = (uint8_t *)_avpData.bytes;
    int len = (int)_avpData.length;
    if(len==6)
    {
        if((bytes[0] == 0) & (bytes[1] == 0x01))
        {
            return [NSString stringWithFormat:@"%d.%d.%d.%d",bytes[2],bytes[3],bytes[4],bytes[5]];
        }
    }
    return NULL;
}

@end
