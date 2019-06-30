//
//  UMDiameterAvpDef.h
//  diameter-avp-gen
//
//  Created by Andreas Fink on 30.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>


@interface UMDiameterAvpDef : UMObject
{
    NSInteger _avpCode;
    NSString *_standardsName;
    NSString *_definitionReference;
    NSString *_typeDefinition;
    BOOL    _mandatoryFlag;
    BOOL    _vendorFlag;
    NSInteger _vendorCode;
    
    NSString *_objectName;
    NSString *_objectType;
}

@property(readwrite,assign,atomic)  NSInteger avpCode;
@property(readwrite,strong,atomic)  NSString *standardsName;
@property(readwrite,strong,atomic)  NSString *definitionReference;
@property(readwrite,strong,atomic)  NSString *typeDefinition;
@property(readwrite,assign,atomic)  BOOL    mandatoryFlag;
@property(readwrite,assign,atomic)  BOOL    vendorFlag;
@property(readwrite,assign,atomic)  NSInteger   vendorCode;


- (UMDiameterAvpDef *)initWithString:(NSString *)str;
- (void)parseString:(NSString *)str error:(NSError **)eptr;
- (NSString *)objectNameWithPrefix:(NSString *)prefix;
- (NSString *)objectTypeWithPrefix:(NSString *)prefix;

- (NSString *)headerFileNameWithPrefix:(NSString *)prefix
                             directory:(NSString *)dir
                                exists:(BOOL *)exists;

- (NSString *)methodsFileNameWithPrefix:(NSString *)prefix
                              directory:(NSString *)dir
                                 exists:(BOOL *)exists;


- (NSString *) headerFileWithPrefix:(NSString *)prefix
                               user:(NSString *)user
                               date:(NSString *)date
                          directory:(NSString *)dir;

- (NSString *) methodsFileWithPrefix:(NSString *)prefix
                                user:(NSString *)user
                                date:(NSString *)date
                           directory:(NSString *)dir;

@end

