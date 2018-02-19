//
//  UMDiameterPacket.m
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterPacket.h"
#import "UMDiameterAvp.h"
#import "UMDiameterCommandFlags.h"

@implementation UMDiameterPacket

- (UMDiameterPacket *)init
{
    self = [super init];
    if(self)
    {
        _avps = [[UMSynchronizedArray alloc]init];
    }
    return self;
}


- (UMDiameterPacket *)initWithData:(NSData *)packet
{
    return [self initWithData:packet atPosition:NULL];
}

- (UMDiameterPacket *)initWithData:(NSData *)packet atPosition:(NSInteger *)posPtr
{
    NSInteger pos;
    if(posPtr==NULL)
    {
        pos = 0;
    }
    else
    {
        pos = *posPtr;
    }
    if(packet.length < (pos+20) )
    {
        return NULL;
    }

    NSInteger startpos = pos;
    uint8_t header[20];
    memcpy(header,&packet.bytes[startpos],20);
    pos += 20;
    uint32_t _messageLength = (header[1] << 16) || (header[2] << 8) || ( header[3]);

    if(packet.length < _messageLength)
    {
        return NULL;
    }

    self = [super init];
    if(self)
    {
        _version = header[0];
        _commandFlags = header[4];
        _commandCode = (header[5] << 16) || (header[6] << 8) || ( header[7]);
        _applicationId =  (header[8] << 24) || (header[9] << 16) || (header[10] << 8) || ( header[11]);
        _hopByHopIdentifier =  (header[12] << 24) || (header[13] << 16) || (header[14] << 8) || ( header[15]);
        _endToEndIdentifier =  (header[16] << 24) || (header[17] << 16) || (header[18] << 8) || ( header[19]);

        while(packet.length >= (pos+8))
        {
            uint8_t avpheader[8];
            memcpy(avpheader,&packet.bytes[pos],8);

            NSUInteger avplen = (avpheader[5] << 16)|| (avpheader[6] << 8) || (avpheader[7]);
            if(packet.length < (pos+avplen))
            {
                @throw([NSException exceptionWithName:@"INVALID_PACKET" reason:@"AVP Packets longer than surrounding packet" userInfo:NULL]);
            }
            NSData *avpdata = [NSData dataWithBytes:&packet.bytes[pos] length:avplen];
            UMDiameterAvp *avp = [[UMDiameterAvp alloc]initWithData:avpdata];
            if(avp)
            {
                [_avps addObject:avp];
            }
            pos += avplen;
        }
        *posPtr = pos;
    }
    return self;
}


- (NSData *)packedData
{

    uint8_t header[20];

    uint32_t _messageLength = 20;

    NSUInteger n = _avps.count;
    for(NSUInteger i = 0;i<n;i++)
    {
        UMDiameterAvp *avp = _avps[i];
        _messageLength += avp.packetLength;
    }

    header[0] = _version & 0xFF;
    header[1] = _messageLength & 0x00FF0000 >> 16;
    header[2] = _messageLength & 0x0000FF00 >> 8;
    header[3] = _messageLength & 0x000000FF >> 0;
    header[4] = _commandFlags & 0x000000FF >> 0;
    header[5] = _commandCode & 0x00FF0000 >> 16;
    header[6] = _commandCode & 0x0000FF00 >> 8;
    header[7] = _commandCode & 0x000000FF >> 0;
    header[8] = _applicationId & 0xFF00000 >> 24;
    header[9] = _applicationId & 0x00FF0000 >> 16;
    header[10] = _applicationId & 0x0000FF00 >> 8;
    header[11] = _applicationId & 0x000000FF >> 0;
    header[12] = _hopByHopIdentifier & 0xFF00000 >> 24;
    header[13] = _hopByHopIdentifier & 0x00FF0000 >> 16;
    header[14] = _hopByHopIdentifier & 0x0000FF00 >> 8;
    header[15] = _hopByHopIdentifier & 0x000000FF >> 0;
    header[16] = _endToEndIdentifier & 0xFF00000 >> 24;
    header[17] = _endToEndIdentifier & 0x00FF0000 >> 16;
    header[18] = _endToEndIdentifier & 0x0000FF00 >> 8;
    header[19] = _endToEndIdentifier & 0x000000FF >> 0;


    NSMutableData *data = [NSMutableData dataWithBytes:header length:sizeof(header)];

    for(NSUInteger i = 0;i<n;i++)
    {
        UMDiameterAvp *avp = _avps[i];
        [data appendData: avp.packetData];
    }
    NSUInteger dlen = data.length;
    if((dlen % 4) !=0)
    {
        @throw([NSException exceptionWithName:@"ALIGNMENT" reason:@"packet does not have aligned length" userInfo:NULL]);
    }
    return data;
}

- (BOOL)flagRequest
{
    if(_commandFlags & UMDiameterCommandFlag_Request )
    {
        return YES;
    }
    return NO;
}

- (BOOL)flagProxyable
{
    if(_commandFlags & UMDiameterCommandFlag_Proxyable )
    {
        return YES;
    }
    return NO;
}

- (BOOL)flagError
{
    if(_commandFlags & UMDiameterCommandFlag_Error )
    {
        return YES;
    }
    return NO;
}

- (BOOL)flagTransmit
{
    if(_commandFlags & UMDiameterCommandFlag_Transmit )
    {
        return YES;
    }
    return NO;
}


- (void)setFlagRequest:(BOOL)flag
{
    if(flag)
    {
        _commandFlags |=  UMDiameterCommandFlag_Request;
    }
    else
    {
        _commandFlags &= ~UMDiameterCommandFlag_Request;
    }
}

- (void)setFlagProxyable:(BOOL)flag
{
    if(flag)
    {
        _commandFlags |=  UMDiameterCommandFlag_Proxyable;
    }
    else
    {
        _commandFlags &= ~UMDiameterCommandFlag_Proxyable;
    }
}

- (void)setFlagError:(BOOL)flag
{
    if(flag)
    {
        _commandFlags |=  UMDiameterCommandFlag_Error;
    }
    else
    {
        _commandFlags &= ~UMDiameterCommandFlag_Error;
    }
}

- (void)setFlagTransmit:(BOOL)flag
{
    if(flag)
    {
        _commandFlags |=  UMDiameterCommandFlag_Transmit;
    }
    else
    {
        _commandFlags &= ~UMDiameterCommandFlag_Transmit;
    }
}

@end
