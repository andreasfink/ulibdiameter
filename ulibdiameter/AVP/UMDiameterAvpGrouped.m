//
//  UMDiameterAvpGrouped.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpGrouped



- (NSString *)avpType
{
    return @"Grouped";
}

- (UMDiameterAvp *)initWithAvp:(UMDiameterAvp *)avp
{
    self = [super init];
    if(self)
    {
        _avpCode = avp.avpCode;
        _avpFlags = avp.avpFlags;
        _avpVendorId = avp.avpVendorId;
        _avpData = avp.avpData;
        if([avp isKindOfClass:[UMDiameterAvpGrouped class]])
        {
            
            UMDiameterAvpGrouped *avpg = (UMDiameterAvpGrouped *)avp;
            NSArray *a = [avpg array];
            _grouped_avps = [[UMSynchronizedArray alloc]initWithArray:a];
        }
        [self afterDecode];
    }
    return self;
}

- (void)afterDecode
{
    _grouped_avps = [[UMSynchronizedArray alloc]init];
    NSInteger pos = 0;
    while(_avpData.length >= (pos+8))
    {
        uint8_t avpheader[8];
        memcpy(avpheader,&_avpData.bytes[pos],8);

        NSUInteger avplen = (avpheader[5] << 16)| (avpheader[6] << 8) | (avpheader[7]);
        if(_avpData.length < (pos+avplen))
        {
            @throw([NSException exceptionWithName:@"INVALID_PACKET" reason:@"AVP Group Packets longer than surrounding packet" userInfo:NULL]);
        }
        NSData *subavpdata = [NSData dataWithBytes:&_avpData.bytes[pos] length:avplen];
        UMDiameterAvp *avp = [[UMDiameterAvp alloc]initWithData:subavpdata];
        if(avp)
        {
            [_grouped_avps addObject:avp];
        }
        pos += avplen;
    }
}

- (void)beforeEncode
{
    NSMutableData *d = [[NSMutableData alloc]init];

    NSInteger n = _grouped_avps.count;
    for(NSInteger i=0;i<n;i++)
    {
        UMDiameterAvp *entry = _grouped_avps[i];
        NSData *d2 = [entry packetData];
        [d appendData:d2];
    }
    _avpData = d;
}

- (NSArray *)array
{
    return [_grouped_avps arrayCopy];
}

- (void)setArray:(NSArray *)array
{
    _grouped_avps = [[UMSynchronizedArray alloc]init];
    for(id item in array)
    {
        [_grouped_avps addObject:item];
    }
}

- (void)appendAvp:(UMDiameterAvp *)avp
{
    if(_grouped_avps==NULL)
    {
        _grouped_avps = [[UMSynchronizedArray alloc]init];
    }
    [_grouped_avps addObject:avp];
}

- (void)appendAvps:(NSArray <UMDiameterAvp *>*)avps;
{
    for(UMDiameterAvp *avp in avps)
    {
        [self appendAvp:avp];
    }
}

- (void)setDataValue:(NSData *)data
{
    _avpData = data;
}

- (void)setStringValue:(NSString *)string
{
    UMJsonParser *parser = [[UMJsonParser alloc]init];
    id obj =  [parser objectWithString:string];
    if ([obj isKindOfClass:[NSDictionary class]])
    {
        [self setDictionaryValue:(NSDictionary *)obj];
    }
}

- (void)setDictionaryValue:(NSDictionary *)dict
{
    UMAssert(0,@"please overload setDictionaryValue:");
}

- (UMSynchronizedSortedDictionary *)dictionaryValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    for(UMDiameterAvp *avp in _grouped_avps)
    {
        NSString *key = [avp avpType];
        id value = [avp objectValue];
        dict[key] = value;
    }
    return dict;
}

-(id)objectValue
{
    return [self dictionaryValue];
}


@end
