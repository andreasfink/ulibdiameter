//
//  UMDiameterPacket.m
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterPacket.h"

@implementation UMDiameterPacket

- (void)calculateLength
{

}
- (NSData *)packedData
{

    uint8_t header[20];

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
    return data;
}


@end
