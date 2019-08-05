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


- (NSString *) methodsWithPrefix:(NSString *)avpPrefix
                            user:(NSString *)user
                            date:(NSString *)date
                       directory:(NSString *)dir
                       mandatory:(BOOL)mandatory;

- (NSString *)groupHeaderFileWithPrefix:(NSString *)prefix
                              avpPrefix:(NSString *)avpPrefix
                                   user:(NSString *)user
                                   date:(NSString *)date;


- (NSString *)includesForHeaderWithPrefix:(NSString *)avpPrefix;
- (NSString *)includesForMethodsWithPrefix:(NSString *)avpPrefix;
- (NSString *)variablesForHeaderWithPrefix:(NSString *)avpPrefix;
- (NSString *)propertiesForHeaderWithPrefix:(NSString *)avpPrefix;


@end

