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
    //NSLog(@"UMDiameterAvpAddress setStringValue:%@",string);
    /* http://www.iana.org/assignments/address-family-numbers/address-family-numbers.xhtml */
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
        uint8_t bytes[18];
        bytes[0]=0x00;
        bytes[1]=0x02; /* IPV6 */
        NSData *d = [UMSocket sockaddrFromAddress:string port:0 socketFamily:AF_INET6];
        const struct sockaddr_in6 *sa = d.bytes;
        for(int i=0;i<16;i++)
        {
#ifdef __APPLE__
            bytes[i+2] = sa->sin6_addr.__u6_addr.__u6_addr8[i];
#else
            bytes[i+2] = sa->sin6_addr.__in6_u.__u6_addr8[i];
#endif
        }
        [self setDataValue:[NSData dataWithBytes:&bytes length:6]];
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
            return [NSString stringWithFormat:@"ipv4:%d.%d.%d.%d",bytes[2],bytes[3],bytes[4],bytes[5]];
        }
    }
    else if(len==18)
    {
        if((bytes[0] == 0) & (bytes[1] == 0x01))
        {
            return [NSString stringWithFormat:@"ipv6:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x:%02x%02x",
                    bytes[2],bytes[3],
                    bytes[4],bytes[5],
                    bytes[6],bytes[7],
                    bytes[8],bytes[9],
                    bytes[10],bytes[11],
                    bytes[12],bytes[13],
                    bytes[14],bytes[15],
                    bytes[16],bytes[17]];
        }
    }
    return NULL;
}

@end
