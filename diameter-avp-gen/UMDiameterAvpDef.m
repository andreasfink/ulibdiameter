//
//  UMDiameterAvpDef.m
//  diameter-avp-gen
//
//  Created by Andreas Fink on 30.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpDef.h"
#import "UMDiameterAvpGroupDef.h"

@implementation UMDiameterAvpDef

- (UMDiameterAvpDef *)initWithString:(NSString *)str
{
    self = [super init];
    if(self)
    {
        NSError *e=NULL;
        [self parseString:str error:&e];
        if(e)
        {
            NSLog(@"Can not parse %@. Error %@",str,e);
            return NULL;
        }
    }
    return self;
}

- (void)parseString:(NSString *)str error:(NSError **)eptr
{
    NSArray *a = [str componentsSeparatedByString:@"\t"];
    if(a.count < 4)
    {
        *eptr = [NSError errorWithDomain:@"PARSING" code:101 userInfo:@{@"reason":@"Line does not consist of 4 or 5 parts"}];
        NSLog(@"Line:%@",str);
        return;
    }

    /* example:
     0: 1665
     1: SIPTO-Local-Network-Permission
     2: 7.3.6
     3: Unsigned32
     4: V
     */
    _avpCode = [a[0] integerValue];
    _standardsName = a[1];
    _definitionReference = a[2];
    _typeDefinition = a[3];
    if(a.count >4)
    {
        NSString *flags = a[4];
        NSArray *b = [flags componentsSeparatedByString:@","];
        for(NSString *flag in b)
        {
            if([flag isEqualToString:@"M"])
            {
                _mandatoryFlag = YES;
            }
            else if([flag isEqualToString:@"V"])
            {
                _vendorFlag = YES;
            }
        }
    }

    if(a.count > 5)
    {
        _vendorCode = [a[5] integerValue];
    }
    else
    {
        _vendorCode = 10415;
    }
}

- (void)parseGroupDef:(NSString *)filecontent
 				error:(NSError **)eptr
{
	NSAssert(eptr!=NULL,@"error pointer can not be NULL");
	_groupDef = [[UMDiameterAvpGroupDef alloc]init];
	[_groupDef parseString:filecontent error:eptr];
	if(*eptr==NULL)
	{
		_isGroup=YES;
	}
}

- (NSString *)headerFileNameWithPrefix:(NSString *)prefix
                             directory:(NSString *)dir
                                exists:(BOOL *)exists
{
    NSString *oname = [self objectNameWithPrefix:prefix];
    NSString *path = [NSString stringWithFormat:@"%@/%@.h",dir,oname];
    NSFileManager *fm = [NSFileManager defaultManager];
    *exists = [fm fileExistsAtPath:path];
    return path;
}

- (NSString *)objectNameWithPrefix:(NSString *)prefix
{
    if(_objectName == NULL)
    {
        _objectName = [NSString stringWithFormat:@"%@%@",prefix,
                       [_standardsName stringByReplacingOccurrencesOfString:@"-" withString:@"_"]];
        _objectName =[_objectName trim];
    }
    return _objectName;
}

- (NSString *)objectTypeWithPrefix:(NSString *)prefix
{
    if(_objectType == NULL)
    {
        _objectType = [NSString stringWithFormat:@"%@%@",
                       prefix,
                       [_typeDefinition stringByReplacingOccurrencesOfString:@"-" withString:@"_"]];
        _objectType = [_objectType trim];
    }
    return _objectType;
}



- (NSString *)methodsFileNameWithPrefix:(NSString *)prefix
                              directory:(NSString *)dir
                                 exists:(BOOL *)exists
{
    NSString *oname = [self objectNameWithPrefix:prefix];
    NSString *path = [NSString stringWithFormat:@"%@/%@.m",dir,oname];
    NSFileManager *fm = [NSFileManager defaultManager];
    *exists = [fm fileExistsAtPath:path];
    return path;
}



- (NSString *) headerFileWithPrefix:(NSString *)prefix
                               user:(NSString *)user
                               date:(NSString *)date
                          directory:(NSString *)dir
{
    NSString *objectName = [self objectNameWithPrefix:prefix];
    NSString *objectType = [self objectTypeWithPrefix:prefix];

    NSMutableString *s = [[NSMutableString alloc]init];
    
    [s appendString:@"//\n"];
    [s appendFormat:@"//  %@.h\n",objectName];
    [s appendString:@"//  ulibdiameter\n"];
    [s appendString:@"//\n"];
    [s appendFormat:@"//  Created by %@ on %@\n",user,date];
    [s appendString:@"//  Copyright © 2019 Andreas Fink. All rights reserved.\n"];
    [s appendString:@"//\n"];
    [s appendString:@"\n"];
    [s appendFormat:@"#import \"%@.h\"\n",objectType];
    [s appendString:@"\n"];
    if((_groupDef) && (_isGroup))
    {
        [s appendString:[_groupDef includesForHeaderWithPrefix:prefix]];
    }
    [s appendString:@"\n"];
    [s appendString:@"\n"];
    [s appendFormat:@"@interface %@ : %@\n",objectName,objectType];
    [s appendString:@"{\n"];
    if((_groupDef) && (_isGroup))
    {
        [s appendString:[_groupDef variablesForHeaderWithPrefix:prefix]];
    }
    [s appendString:@"}\n"];
    [s appendString:@"\n"];
    if((_groupDef) && (_isGroup))
    {
        [s appendString:[_groupDef propertiesForHeaderWithPrefix:prefix]];
    }
    [s appendString:@"\n"];

    [s appendString:@"- (NSString *)avpType;\n"];
    [s appendString:@"- (uint32_t)avpCode;\n"];
    [s appendString:@"+ (uint32_t)avpCode;\n"];

    [s appendString:@"\n"];

    [s appendString:@"@end\n"];
    [s appendString:@"\n"];
    return s;
}


- (NSString *) methodsFileWithPrefix:(NSString *)prefix
                                user:(NSString *)user
                                date:(NSString *)date
                           directory:(NSString *)dir
{
    NSString *objectName = [self objectNameWithPrefix:prefix];
    //NSString *objectType = [self objectTypeWithPrefix:prefix];
    NSMutableString *s = [[NSMutableString alloc]init];
    [s appendString:@"//\n"];
    [s appendFormat:@"//  %@.m\n",objectName];
    [s appendString:@"//  ulibdiameter\n"];
    [s appendString:@"//\n"];
    [s appendFormat:@"//  Created by %@ on %@\n",user,date];
    [s appendFormat:@"//  Copyright © 2019 Andreas Fink. All rights reserved.\n"];
    [s appendString:@"//\n"];
    [s appendString:@"\n"];
    [s appendString:@"#import \"UMDiameterAvp.h\"\n"];
    [s appendFormat:@"#import \"%@.h\"\n",objectName];

    if((_groupDef) && (_isGroup))
    {
        [s appendString:[_groupDef includesForMethodsWithPrefix:prefix]];
    }
    [s appendString:@"\n"];
    [s appendFormat:@"@implementation %@\n",objectName];
    [s appendString:@"\n"];
    [s appendString:@"\n"];
    [s appendString:@"- (NSString *)avpType\n"];
    [s appendString:@"{\n"];
    [s appendFormat:@"    return @\"%@\";\n",_standardsName];
    [s appendString:@"}\n"];
    [s appendString:@"\n"];
    [s appendString:@"- (uint32_t)avpCode\n"];
    [s appendString:@"{\n"];
    [s appendFormat:@"    return %ld;\n",(long)_avpCode];
    [s appendString:@"}\n"];
    [s appendString:@"\n"];
    [s appendString:@"+ (uint32_t)avpCode\n"];
    [s appendString:@"{\n"];
    [s appendFormat:@"    return %ld;\n",(long)_avpCode];
    [s appendString:@"}\n"];

    [s appendString:@"\n"];
    [s appendString:@"- (void)genericInitialisation\n"];
    [s appendString:@"{\n"];
    [s appendString:@"    [super genericInitialisation];\n"];
    if((_vendorFlag) && (_mandatoryFlag))
    {
        [s appendString:@"    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;\n"];
    }
    else if(_vendorFlag)
    {
        [s appendString:@"    _avpFlags = UMDiameterAvpFlag_Vendor;\n"];
    }
    else if(_mandatoryFlag)
    {
        [s appendString:@"    _avpFlags = UMDiameterAvpFlag_Mandatory;\n"];
    }
    if(_vendorFlag)
    {
        [s appendFormat:@"    _avpVendorId = %ld;\n",(long)_vendorCode];
    }
    [s appendString:@"}\n"];


    [s appendString:@"\n"];

    if((_groupDef) && (_isGroup))
    {
        [s appendString:[_groupDef methodsWithPrefix:prefix
                                                user:user
                                                date:date
                                           directory:dir
                                           mandatory:_mandatoryFlag]];
    }
    [s appendString:@"\n"];
    [s appendString:@"@end\n"];
    [s appendString:@"\n"];
    return s;
}

@end
