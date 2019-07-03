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
#import "UMDiameterApplicationId.h"

@implementation UMDiameterPacket

- (UMDiameterPacket *)init
{
    self = [super init];
    if(self)
    {
        [self genericInitialisation];
    }
    return self;
}

- (UMDiameterPacket *)initWithJsonString:(NSString *)str
{
    self = [super init];
    if(self)
    {
        [self genericInitialisation];
        NSError *e=NULL;
        [self parseJsonString:str error:&e];
        if(e)
        {
            NSLog(@"Error Parsing Json String: %@\nJson=%@",e,str);
            return NULL;
        }
    }
    return self;
}

- (UMDiameterPacket *)initWithData:(NSData *)packet
{
    return [self initWithData:packet atPosition:NULL];
}

- (void)genericInitialisation
{
	_packet_avps = [[UMSynchronizedArray alloc]init];
    _version = 1;
}


#define PADDING_TO_4(a)  (((a + 3) / 4) * 4)

- (void)afterDecode
{
}

- (void)beforeEncode
{
}


- (UMDiameterPacket *)initWithData:(NSData *)packet atPosition:(NSInteger *)posPtr
{
    NSInteger pos=0;
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
    _messageLength = (header[1] << 16) | (header[2] << 8) | ( header[3]);

    if(packet.length < _messageLength)
    {
        return NULL;
    }

    self = [super init];
    if(self)
    {
		[self genericInitialisation];
        _version = header[0];
        _commandFlags = header[4];
        _commandCode = (header[5] << 16) | (header[6] << 8) | ( header[7]);
        _applicationId =  (header[8] << 24) | (header[9] << 16) | (header[10] << 8) | ( header[11]);
        _hopByHopIdentifier =  (header[12] << 24) | (header[13] << 16) | (header[14] << 8) | ( header[15]);
        _endToEndIdentifier =  (header[16] << 24) | (header[17] << 16) | (header[18] << 8) | ( header[19]);
        while(packet.length >= (pos+8))
        {
            uint8_t avpheader[8];
            memcpy(avpheader,&packet.bytes[pos],8);

			uint32_t avpCode = (avpheader[0] << 24) | (avpheader[1] << 16) | (avpheader[2] << 8) | (avpheader[3] << 0);
			NSUInteger avplen = (avpheader[5] << 16)| (avpheader[6] << 8) | (avpheader[7]);

            if(packet.length < (pos+avplen))
            {
                @throw([NSException exceptionWithName:@"INVALID_PACKET"
											   reason:@"AVP Packets longer than surrounding packet"
											 userInfo:NULL]);
            }
            NSData *avpdata = [NSData dataWithBytes:&packet.bytes[pos] length:avplen];
/*FIXME. read out vendor here */
            int avpVendor = 0;
            
            UMDiameterAvp *avp = [[UMDiameterAvp alloc]initWithData:avpdata avpCode:avpCode avpVendor:avpVendor];
            if(avp)
            {
                [_packet_avps addObject:avp];
            }
			NSInteger avplen_padded = PADDING_TO_4(avplen);
			pos  = pos + avplen_padded;

        }
		if(posPtr)
		{
        	*posPtr = pos;
		}
    }
    return self;
}


- (NSData *)packedData
{
    [self beforeEncode];

    uint8_t header[20];

    _messageLength = sizeof(header);

    NSUInteger n = _packet_avps.count;
    for(NSUInteger i = 0;i<n;i++)
    {
        UMDiameterAvp *avp = _packet_avps[i];
        [avp packetData]; /* forces the packetLength to be updated */
        _messageLength += avp.packetLength;
    }

    header[0] = _version & 0xFF;
    header[1] = (_messageLength & 0x00FF0000) >> 16;
    header[2] = (_messageLength & 0x0000FF00) >> 8;
    header[3] = (_messageLength & 0x000000FF) >> 0;
    header[4] = (_commandFlags & 0x000000FF) >> 0;
    header[5] = (_commandCode & 0x00FF0000) >> 16;
    header[6] = (_commandCode & 0x0000FF00) >> 8;
    header[7] = (_commandCode & 0x000000FF) >> 0;
    header[8] = (_applicationId & 0xFF00000) >> 24;
    header[9] = (_applicationId & 0x00FF0000) >> 16;
    header[10] = (_applicationId & 0x0000FF00) >> 8;
    header[11] = (_applicationId & 0x000000FF) >> 0;
    header[12] = (_hopByHopIdentifier & 0xFF00000) >> 24;
    header[13] = (_hopByHopIdentifier & 0x00FF0000) >> 16;
    header[14] = (_hopByHopIdentifier & 0x0000FF00) >> 8;
    header[15] = (_hopByHopIdentifier & 0x000000FF) >> 0;
    header[16] = (_endToEndIdentifier & 0xFF00000) >> 24;
    header[17] = (_endToEndIdentifier & 0x00FF0000) >> 16;
    header[18] = (_endToEndIdentifier & 0x0000FF00) >> 8;
    header[19] = (_endToEndIdentifier & 0x000000FF) >> 0;

    NSMutableData *data = [NSMutableData dataWithBytes:header length:sizeof(header)];

    int dlen=20;
    for(NSUInteger i = 0;i<n;i++)
    {
        UMDiameterAvp *avp = _packet_avps[i];
        NSData *avpData = avp.packetData;
        [data appendData:avpData];
        dlen+=avpData.length;
    }

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


- (void)appendAvp:(UMDiameterAvp *)avp
{
    [_packet_avps addObject:avp];
}


- (NSString *)getSessionIdentifier
{
    /* FIXME */
    return NULL;
}


- (NSString *)description
{
	BOOL isRequest = NO;
	NSMutableString *s = [[NSMutableString alloc]init];
	[s appendString:@"--- DIAMETER PACKET BEGIN --------------\n"];
	[s appendFormat:@"Version: 0x%02X\n",_version];
	[s appendFormat:@"Length: %d\n",_messageLength];
	[s appendFormat:@"Flags: 0x%2X",_commandFlags];
	if(_commandFlags & DIAMETER_COMMAND_FLAG_REQUEST)
	{
		[s appendString:@", Request"];
		isRequest = YES;
	}
	if(_commandFlags & DIAMETER_COMMAND_FLAG_PROXIABLE)
	{
		[s appendString:@", Proxyable"];
	}
	if(_commandFlags & DIAMETER_COMMAND_FLAG_ERROR)
	{
		[s appendString:@", Error"];
	}
	if(_commandFlags & DIAMETER_COMMAND_FLAG_POTENTIAL_RETRANSMIT)
	{
		[s appendString:@", Potential-Retransmit"];
	}
	[s appendString:@"\n"];

	NSString *cmd = UMDiameterCommandCode_description(_commandCode,isRequest);

	[s appendFormat:@"Command Code: %d %@\n",_commandCode,cmd];
	[s appendFormat:@"ApplicationId: %@ (%d)\n",[UMDiameterPacket applicationIdToString:_applicationId],_applicationId];
	[s appendFormat:@"Hop-by-Hop Identifier: 0x%08X\n",_hopByHopIdentifier];
	[s appendFormat:@"End-to-End Identifier: 0x%08X\n",_endToEndIdentifier];
	[s appendString:@"    ------------------------------------\n"];

	for(UMDiameterAvp *avp in _packet_avps)
	{
		NSString *m =[avp description];
		NSArray *lines = [m componentsSeparatedByString:@"\n"];
		for(NSString *line in lines)
		{
			if([line isEqualToString:@""])
				continue;
			[s appendFormat:@"    %@\n",line];
		}
		[s appendString:@"    ------------------------------------\n"];
	}
	[s appendString:@"--- DIAMETER PACKET END ----------------\n"];

	return s;
}

+(NSString *)applicationIdToString:(uint32_t)ai
{
	switch(ai)
	{
        case UMDiameterApplicationId_Diameter_Common_Messages:
            return @"Diameter Common Messages";
        case UMDiameterApplicationId_Diameter_Base_Accounting:
            return @"Diameter Base Accounting";
		case UMDiameterApplicationId_3GPP_S6a_S6d:
			return @"3GPP S6a/S6d";
        case UMDiameterApplicationId_3GPP_S9:
            return @"3GPP S9";
	}
    return [NSString stringWithFormat:@"APPLICATION(%u)",ai];
}


- (UMSynchronizedSortedDictionary *)objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    dict[@"version"] = @(_version);

    NSMutableArray *flags = [[NSMutableArray alloc]init];
    if(_commandFlags & UMDiameterCommandFlag_Request)
    {
        [flags addObject:@"REQUEST"];
    }
    if(_commandFlags & UMDiameterCommandFlag_Proxyable)
    {
        [flags addObject:@"PROXYABLE"];
    }
    if(_commandFlags & UMDiameterCommandFlag_Proxyable)
    {
        [flags addObject:@"ERROR"];
    }
    if(_commandFlags & UMDiameterCommandFlag_Proxyable)
    {
        [flags addObject:@"TRANSMIT"];
    }
    dict[@"commandFlags"] = [flags componentsJoinedByString:@","];
    dict[@"command"] = UMDiameterCommandCode_description(_commandCode, (_commandFlags & UMDiameterCommandFlag_Request));
    dict[@"commandCode"] = @(_commandCode);
    dict[@"application"] = [UMDiameterPacket applicationIdToString:_applicationId];
    dict[@"applicationId"] = @(_applicationId);
    dict[@"hopByHopIdentifier"] = @(_hopByHopIdentifier);
    dict[@"endToEndIdentifier"] = @(_endToEndIdentifier);
    NSMutableArray *a = [[NSMutableArray alloc]init];
    for(UMDiameterAvp *avp in _packet_avps)
    {
        [a addObject:[avp objectValue]];
    }
    if(a.count > 0)
    {
        dict[@"avp"] = a;
    }
    return dict;
}

- (void)setAvps:(NSArray<UMDiameterAvp *> *)avps
{
    
    _packet_avps = [[UMSynchronizedArray alloc]init];
    for(UMDiameterAvp *avp in avps)
    {
        [_packet_avps addObject:avp];
    }
}

- (void)parseJsonString:(NSString *)s error:(NSError **)eptr
{
    UMJsonParser *parser = [[UMJsonParser alloc]init];
    NSDictionary *result = [parser objectWithString:s error:eptr];
    [self parseDict:result error:eptr];
}


- (void)parseDict:(NSDictionary *)s error:(NSError **)eptr
{
    /* FIXME */
}

@end
