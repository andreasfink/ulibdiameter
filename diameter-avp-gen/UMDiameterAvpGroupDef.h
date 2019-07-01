//
//  UMDiameterAvpGroupDef.h
//  diameter-avp-gen
//
//  Created by Andreas Fink on 01.07.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

@class UMDiameterGeneratorAVP;

@interface UMDiameterAvpGroupDef : UMObject
{
    NSString *_avpGroupName;
    NSString *_objectName;
    NSString *_webName;
    NSInteger _avpCode;
    NSInteger _vendor;
    NSArray<UMDiameterGeneratorAVP *> *_avps;
}

@property(readwrite,strong,atomic)  NSString *avpGroupName;
@property(readwrite,assign,atomic)  NSInteger avpCode;
@property(readwrite,assign,atomic)  NSInteger vendor;
@property(readwrite,strong,atomic)  NSArray<UMDiameterGeneratorAVP *>  *avps;

- (UMDiameterAvpGroupDef *)initWithString:(NSString *)s;
- (UMDiameterAvpGroupDef *)initWithString:(NSString *)s error:(NSError **)e;
- (BOOL)parseString:(NSString *)s error:(NSError **)eptr;
- (BOOL)parseFirstLine:(NSString *)s error:(NSError **)eptr; /* returns YES on success */

- (NSString *)headerFileWithPrefix:(NSString *)prefix
                         avpPrefix:(NSString *)avpPrefix
                              user:(NSString *)user
                              date:(NSString *)date;

- (NSString *)methodFileWithPrefix:(NSString *)prefix
                         avpPrefix:(NSString *)avpPrefix
                              user:(NSString *)user
                              date:(NSString *)date;
@end

