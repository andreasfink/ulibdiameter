//
//  UMDiameterAvpGroupDef.m
//  diameter-avp-gen
//
//  Created by Andreas Fink on 01.07.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGroupDef.h"
#import "UMDiameterGeneratorAVP.h"

@implementation UMDiameterAvpGroupDef


- (UMDiameterAvpGroupDef *)initWithString:(NSString *)s
{
    NSError *e = NULL;
    UMDiameterAvpGroupDef *def = [self initWithString:s error:&e];
    if(e)
    {
        NSLog(@"%@",e);
    }
    return def;
}

- (UMDiameterAvpGroupDef *)initWithString:(NSString *)s error:(NSError **)eptr
{
    self = [super init];
    if(self)
    {
        if([self parseString:s error:eptr]==NO)
        {
            return NULL;
        }
    }
    return self;
}

- (BOOL)parseString:(NSString *)s error:(NSError **)eptr
{
    NSArray *a = [s componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    if([self parseFirstLine:a[0] error:(NSError **)eptr] == NO)
    {
        return NO;
    }
    NSMutableArray<UMDiameterGeneratorAVP *> *avps = [[NSMutableArray alloc]init];
    for(NSInteger i=1;i<a.count;i++)
    {
        NSString *line = [a[i] trim];
        if(line.length > 0)
        {
            UMDiameterGeneratorAVP *avp = [[UMDiameterGeneratorAVP alloc]initWithString:line];
            if(avp == NULL)
            {
                return NO;
            }
            [avps addObject:avp];
        }
    }
    _avps = avps;
    [self convertNames];
    return YES;
}

- (void)convertNames
{
    _avpGroupName = [_avpGroupName trim];
    NSInteger count = [_avpGroupName length];
    NSMutableString *wname = [[NSMutableString alloc]init];
    NSMutableString *oname = [[NSMutableString alloc]init];
    for(NSInteger idx=0;idx<count;idx++)
    {
        unichar c = [_avpGroupName characterAtIndex:idx];
        unichar lowerC;
        if((c>='A') && (c<='Z'))
        {
            lowerC = c - 'A' + 'a';
        }
        else
        {
            lowerC = c;
        }
        if(c=='-')
        {
            [wname appendString:@"-"];
            [oname appendString:@"_"];
        }
        else
        {
            [wname appendFormat:@"%C",lowerC];
            [oname appendFormat:@"%C",c];
        }
    }
    _webName = wname;
    _objectName = oname;
}

- (BOOL)parseFirstLine:(NSString *)s error:(NSError **)eptr /* returns YES on success */
{
    s = [s trim];

    NSArray *a = [s componentsSeparatedByString:@"::="];
    if(a.count !=2)
    {
        *eptr = [NSError errorWithDomain:@"SYNTAX"
                                   code:1
                               userInfo:@{@"reason":@" ::== is no separating two parts in the first line" }];
        return NO;
    }
    NSString *avpGroupName = [a[0] trim];
    if(avpGroupName.length <2)
    {
        *eptr = [NSError errorWithDomain:@"SYNTAX"
                                    code:2
                                userInfo:@{@"reason":@"avpGroupName name is shorter than 2 characters" }];
        return NO;
    }


    if( ([avpGroupName characterAtIndex:0] != '<') ||
        ([avpGroupName characterAtIndex:([avpGroupName length] - 1)] != '>'))
    {
        *eptr = [NSError errorWithDomain:@"SYNTAX"
                                    code:3
                                userInfo:@{@"reason":@"no < or > in avpGroupName name" }];
        return NO;
    }
    _avpGroupName = [avpGroupName substringWithRange:NSMakeRange(1,[avpGroupName length] -2)];



    NSString *header = [a[1] trim];
    NSString *comment;
    a = [header componentsSeparatedByString:@";"];
    if(a.count == 1)
    {
        header = [a[0] trim];
        comment = NULL;
    }
    else if(a.count>1)
    {
        header = [a[0] trim];
        comment = a[1];
        for(NSInteger i=2;i<a.count;i++)
        {
            [comment stringByAppendingString:@";"];
            [comment stringByAppendingString:a[i]];
        }
    }


    if( ([header characterAtIndex:0] != '<') ||
       ([header characterAtIndex:([header length] - 1)] != '>'))
    {
        *eptr = [NSError errorWithDomain:@"SYNTAX"
                                    code:5
                                userInfo:@{@"reason" : @"no < or > in header" }];
        return NO;
    }
    header = [header substringWithRange:NSMakeRange(1,[header length] -2)];

    /* header is now something like "AVP Header: 316, REQ, PXY, 16777251" */
    NSArray *b = [header componentsSeparatedByString:@":"];
    if(b.count !=2)
    {
        *eptr = [NSError errorWithDomain:@"SYNTAX"
                                    code:6
                                userInfo:@{@"reason" : @"header does not have two components before and after : " }];
        return NO;
    }
    NSString *s1 = b[0];
    s1 = [s1 trim];
    if(! (([s1 isEqualToString:@"AVP Header"]) || /* this is used in most standards */
        ([s1 isEqualToString:@"AVP-Header"])))    /* this is used in the BNF definition in RFC 6733 */
    {
        *eptr = [NSError errorWithDomain:@"SYNTAX"
                                    code:7
                                userInfo:@{@"reason" : @"no keyword AVP Header or AVP-Header found" }];
        return NO;
    }

    NSString *s2 = b[1];
    NSArray *c = [s2 componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if(c.count<1)
    {
        *eptr = [NSError errorWithDomain:@"SYNTAX"
                                    code:7
                                userInfo:@{@"reason" : @"list of items after AVP-Header separated by whitespace is 0" }];
        return NO;
    }
    NSString *avpCodeString = c[0];
    _avpCode = [avpCodeString integerValue];
    if(c.count>1)
    {
    	NSString *avpVendor = c[1];
    	_vendor = [avpVendor integerValue];
	}
	else
	{
		_vendor = 0;
	}
    return YES;
}


- (NSString *)description
{
    NSMutableString *s = [[NSMutableString alloc]init];
    [s appendFormat:@"< %@ > ::= < AVP-Header: %ld",_avpGroupName,(long)_avpCode];
    if(_vendor)
    {
        [s appendFormat:@", %ld",(long)_vendor];
    }
    [s appendString:@" >\n"];

    for(UMDiameterGeneratorAVP *avp in _avps)
    {
        [s appendString:avp.description];
        [s appendString:@"\n"];
    }
    return s;
}



- (void)writeCommandParser
{


}


- (NSString *)includesForHeaderWithPrefix:(NSString *)avpPrefix
{
    NSMutableString *s = [[NSMutableString alloc]init];
    for(UMDiameterGeneratorAVP *avp in _avps)
    {
        [s appendFormat:@"@class %@%@;\n",avpPrefix,avp.objectName];
    }
    return s;
}

- (NSString *)includesForMethodsWithPrefix:(NSString *)avpPrefix
{
    NSMutableString *s = [[NSMutableString alloc]init];

    for(UMDiameterGeneratorAVP *avp in _avps)
    {
        [s appendFormat:@"#import "%@%@";\n",avpPrefix,avp.objectName];
    }
    return s;
}

- (NSString *)propertiesForHeaderWithPrefix:(NSString *)avpPrefix
{
    NSMutableString *s = [[NSMutableString alloc]init];
    if(avp.multiple)
    {
        [s appendFormat:@"\tNSArray<%@%@ *>\t*_%@;\n",avpPrefix,avp.objectName, avp.variableName];
    }
    else
    {
        [s appendFormat:@"\t%@%@\t*_%@;\n",avpPrefix,avp.objectName, avp.variableName];
    }
    return s;
}

- (NSString *)propertyLinesForHeaderWithPrefix:(NSString *)avpPrefix
{
    NSMutableString *s = [[NSMutableString alloc]init];
    if(avp.multiple)
    {
        [s appendFormat:@"\tNSArray<%@%@ *>\t*%@;\n",avpPrefix,avp.objectName, avp.variableName];
    }
    else
    {
        [s appendFormat:@"\t%@%@\t*%@;\n",avpPrefix,avp.objectName, avp.variableName];
    }
    return s;
}

    [s appendFormat:@"@interface %@%@ : UMDiameterPacket\n",prefix,_objectName];
    [s appendString:@"{\n"];
    for(UMDiameterGeneratorAVP *avp in _avps)
    {
        if(avp.multiple)
        {
            [s appendFormat:@"\tNSArray<%@%@ *>\t*%@;\n",avpPrefix,avp.objectName, avp.variableName];
        }
        else
        {
            [s appendFormat:@"\t%@%@\t*%@;\n",avpPrefix,avp.objectName, avp.variableName];
        }
    }
    [s appendString:@"}\n"];
    [s appendString:@"\n"];

    for(UMDiameterGeneratorAVP *avp in _avps)
    {
        if(avp.multiple)
        {
            [s appendFormat:@"@property(readwrite,strong,atomic)\tNSArray<%@%@ *>\t*%@;\n",avpPrefix,avp.objectName,avp.propertyName];
        }
        else
        {
            [s appendFormat:@"@property(readwrite,strong,atomic)\t%@%@\t*%@;\n",avpPrefix,avp.objectName,avp.propertyName];
        }
    }
    [s appendString:@"\n"];
    [s appendString:@"@end\n"];
    [s appendString:@"\n"];
    return s;

}
- (NSString *)groupHeaderFileWithPrefix:(NSString *)prefix
                         avpPrefix:(NSString *)avpPrefix
                              user:(NSString *)user
                              date:(NSString *)date
{
    NSMutableString *s = [[NSMutableString alloc]init];
    [s appendString:@"//\n"];
    [s appendFormat:@"//  %@%@.h\n",prefix,_objectName];
    [s appendString:@"//  ulibdiameter\n"];
    [s appendString:@"//\n"];
    [s appendFormat:@"//  Created by %@ on %@\n",user,[date stringValue]];
    [s appendString:@"//  Copyright © 2019 Andreas Fink. All rights reserved.\n"];
    [s appendString:@"//\n"];
    [s appendString:@"\n"];
    [s appendString:@"\n"];
    [s appendString:@"#import \"UMDiameterPacket.h\"\n"];
    [s appendString:@"\n"];

    for(UMDiameterGeneratorAVP *avp in _avps)
    {
        [s appendFormat:@"@class %@%@;\n",avpPrefix,avp.objectName];
    }

    [s appendFormat:@"@interface %@%@ : UMDiameterPacket\n",prefix,_objectName];
    [s appendString:@"{\n"];
    for(UMDiameterGeneratorAVP *avp in _avps)
    {
        if(avp.multiple)
        {
            [s appendFormat:@"\tNSArray<%@%@ *>\t*%@;\n",avpPrefix,avp.objectName, avp.variableName];
        }
        else
        {
            [s appendFormat:@"\t%@%@\t*%@;\n",avpPrefix,avp.objectName, avp.variableName];
        }
    }
    [s appendString:@"}\n"];
    [s appendString:@"\n"];

    for(UMDiameterGeneratorAVP *avp in _avps)
    {
        if(avp.multiple)
        {
            [s appendFormat:@"@property(readwrite,strong,atomic)\tNSArray<%@%@ *>\t*%@;\n",avpPrefix,avp.objectName,avp.propertyName];
        }
        else
        {
            [s appendFormat:@"@property(readwrite,strong,atomic)\t%@%@\t*%@;\n",avpPrefix,avp.objectName,avp.propertyName];
        }
    }
    [s appendString:@"\n"];
    [s appendString:@"@end\n"];
    [s appendString:@"\n"];
    return s;
}

- (NSString *)methodFileWithPrefix:(NSString *)prefix
                         avpPrefix:(NSString *)avpPrefix
                              user:(NSString *)user
                              date:(NSString *)date
{
    NSMutableString *s = [[NSMutableString alloc]init];
    [s appendString:@"//\n"];
    [s appendFormat:@"//  %@%@.m\n",prefix,_objectName];
    [s appendString:@"//  ulibdiameter\n"];
    [s appendString:@"//\n"];
    [s appendFormat:@"//  Created by %@ on %@\n",user,[date stringValue]];
    [s appendString:@"//  Copyright © 2019 Andreas Fink. All rights reserved.\n"];
    [s appendString:@"//\n"];
    [s appendString:@"\n"];
    [s appendString:@"\n"];
    [s appendFormat:@"#import \"%@%@.h\"\n",prefix,_objectName];
    for(UMDiameterGeneratorAVP *avp in _avps)
    {
        [s appendFormat:@"#import \"%@%@.h\"\n",avpPrefix,avp.objectName];
    }

    [s appendString:@"\n"];
    [s appendFormat:@"@implementation %@%@\n",prefix,_objectName];
    [s appendString:@"\n"];
    [s appendFormat:@"- (%@%@ *)initWithString:(NSString *)s\n",prefix,_objectName];
    [s appendString:@"{\n"];
    [s appendString:@"    self = [super init];\n"];
    [s appendString:@"    if(self)\n"];
    [s appendString:@"    {\n"];
    [s appendString:@"        if([self parseString:s]==NO)\n"];
    [s appendString:@"        {\n"];
    [s appendString:@"            return NULL;\n"];
    [s appendString:@"        }\n"];
    [s appendString:@"    }\n"];
    [s appendString:@"    return self;\n"];
    [s appendString:@"}\n"];

    [s appendString:@"\n"];
    [s appendString:@"- (void)genericInitialisation\n"];
    [s appendString:@"{\n"];
    [s appendString:@"    [super genericInitialisation];\n"];
    [s appendFormat:@"    self.avpCode = %ld;\n",(long)_avpCode];
    [s appendFormat:@"    self.avpVendorId = %ld;\n",(long)_vendor];

    BOOL first=YES;
    if(first)
    {
        [s appendString:@"    self.commandFlags = 0;\n"];
    }
    else
    {
        [s appendString:@";\n"];
    }
    [s appendString:@"}\n"];

    [s appendString:@"\n"];


    /* before encode */

    [s appendString:@"- (void)beforeEncode\n"];
    [s appendString:@"{\n"];
    [s appendString:@"    [super beforeEncode];\n"];

    [s appendFormat:@"    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];\n"];

    for(UMDiameterGeneratorAVP *avp in _avps)
    {
        if(avp.multiple)
        {
            [s appendFormat:@"    if(%@.count > 0)\n",avp.variableName];
            [s appendString:@"    {\n"];
            [s appendFormat:@"        for(%@%@ *o in %@)\n",avpPrefix,avp.objectName,avp.variableName];
            [s appendString:@"        {\n"];
            [s appendString:@"            [arr addObject:o]\n"];
            [s appendString:@"        }\n"];
            [s appendString:@"    }\n"];
        }
        else
        {
            [s appendFormat:@"    if(%@)\n",avp.variableName];
            [s appendString:@"    {\n"];
            [s appendFormat:@"        [arr addObject:%@]\n",avp.variableName];
            [s appendString:@"    }\n"];
        }
    }
    [s appendString:@"    [self setAvps:arr];\n"];
    [s appendString:@"}\n"];

    [s appendString:@"\n"];
    [s appendString:@"\n"];

    /* after decode */
    [s appendString:@"@end\n"];
    [s appendString:@"\n"];
    return s;
}


@end


