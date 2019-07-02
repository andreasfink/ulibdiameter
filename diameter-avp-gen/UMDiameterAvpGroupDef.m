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
                                   code:101
                                userInfo:@{@"reason":
                                               [NSString stringWithFormat:
                                                @" ::= is no separating two parts in the first line\nline=%@",s]}];
        return NO;
    }
    NSString *avpGroupName = [a[0] trim];
    if(avpGroupName.length <2)
    {
        *eptr = [NSError errorWithDomain:@"SYNTAX"
                                    code:102
                                userInfo:@{@"reason":@"avpGroupName name is shorter than 2 characters" }];
        return NO;
    }

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
                                    code:103
                                userInfo:@{@"reason" : @"no < or > in header" }];
        return NO;
    }
    header = [header substringWithRange:NSMakeRange(1,[header length] -2)];

    /* header is now something like "AVP Header: 316, REQ, PXY, 16777251" */
    NSArray *b = [header componentsSeparatedByString:@":"];
    if(b.count !=2)
    {
        *eptr = [NSError errorWithDomain:@"SYNTAX"
                                    code:104
                                userInfo:@{@"reason" : @"header does not have two components before and after : " }];
        return NO;
    }
    NSString *s1 = b[0];
    s1 = [s1 trim];
    if(! (([s1 isEqualToString:@"AVP-Header"]) ||   /* this is the official writing in the BNF definition in RFC 6733 */
          ([s1 isEqualToString:@"AVP Header"]) ||   /* alternative writings seen in 3GPP Specs */
          ([s1 isEqualToString:@"AVP header"]) ))

    {
        *eptr = [NSError errorWithDomain:@"SYNTAX"
                                    code:105
                                userInfo:@{@"reason" : @"no keyword AVP Header or AVP-Header found" }];
        return NO;
    }

    NSString *s2 = b[1];
    NSArray *c = [s2 componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if(c.count<1)
    {
        *eptr = [NSError errorWithDomain:@"SYNTAX"
                                    code:106
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
        [s appendFormat:@"#import \"%@%@.h\"\n",avpPrefix,avp.objectName];
    }
    return s;
}

- (NSString *)variablesForHeaderWithPrefix:(NSString *)avpPrefix
{
    NSMutableString *s = [[NSMutableString alloc]init];
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
    return s;
}

- (NSString *)propertiesForHeaderWithPrefix:(NSString *)avpPrefix
{
    NSMutableString *s = [[NSMutableString alloc]init];
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


- (NSString *) methodsWithPrefix:(NSString *)avpPrefix
                            user:(NSString *)user
                            date:(NSString *)date
                       directory:(NSString *)dir
{

    /* before encode */
    NSMutableString *s = [[NSMutableString alloc]init];
    [s appendString:@"- (void)beforeEncode\n"];
    [s appendString:@"{\n"];
    [s appendString:@"    [super beforeEncode];\n"];
    [s appendString:@"\n"];

    [s appendFormat:@"    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];\n"];

    for(UMDiameterGeneratorAVP *avp in _avps)
    {
        if(avp.multiple)
        {
            [s appendFormat:@"    if(%@.count > 0)\n",avp.variableName];
            [s appendString:@"    {\n"];
            [s appendFormat:@"        for(%@%@ *o in %@)\n",avpPrefix,avp.objectName,avp.variableName];
            [s appendString:@"        {\n"];
            [s appendString:@"            [arr addObject:o];\n"];
            [s appendString:@"        }\n"];
            [s appendString:@"    }\n"];
        }
        else
        {
            [s appendFormat:@"    if(%@)\n",avp.variableName];
            [s appendString:@"    {\n"];
            [s appendFormat:@"        [arr addObject:%@];\n",avp.variableName];
            [s appendString:@"    }\n"];
        }
    }
    [s appendString:@"    [self setArray:arr];\n"];
    [s appendString:@"}\n"];
    [s appendString:@"\n"];
    [s appendString:@"\n"];

    [s appendString:@"- (void)afterDecode\n"];
    [s appendString:@"{\n"];
    [s appendString:@"    NSArray *avps = [self array];\n"];
    [s appendString:@"\n"];
    [s appendString:@"    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];\n"];
    [s appendString:@"    NSMutableArray *unknownAVPs;\n"];
    [s appendString:@"\n"];
    [s appendString:@"    for(UMDiameterAvp *avp in avps)\n"];
    [s appendString:@"    {\n"];

    BOOL first=YES;
    UMDiameterGeneratorAVP *placeholderAVP;

    for(UMDiameterGeneratorAVP *avp in _avps)
    {
        if([avp.objectName isEqualToString:@"AVP"])
        {
            /* placeholder for all unspecified AVPs */
            placeholderAVP = avp;
            continue;
        }
        if(first)
        {
            [s appendFormat:@"        if(avp.avpCode == [%@%@  avpCode])\n",avpPrefix,avp.objectName];
            first = NO;
        }
        else
        {
            [s appendFormat:@"        else if(avp.avpCode == [%@%@ avpCode])\n",avpPrefix,avp.objectName];
        }
        if(avp.multiple==NO)
        {
            [s appendString:@"        {\n"];
            [s appendFormat:@"            %@ = [[%@%@ alloc]initWithAvp:avp];\n",avp.variableName,avpPrefix,avp.objectName];
            [s appendFormat:@"            [knownAVPs addObject:%@];\n",avp.variableName];
            [s appendString:@"        }\n"];
        }
        else
        {
            [s appendString:@"        {\n"];
            [s appendFormat:@"            %@%@ *avp2 = [[%@%@ alloc]initWithAvp:avp];\n",avpPrefix,avp.objectName,avpPrefix,avp.objectName];
            [s appendFormat:@"            [knownAVPs addObject:avp2];\n"];
            [s appendFormat:@"            if(%@ == NULL)\n",avp.variableName];
            [s appendString:@"            {\n"];
            [s appendFormat:@"                %@ = @[avp];\n",avp.variableName];
            [s appendString:@"            }\n"];
            [s appendString:@"            else\n"];
            [s appendString:@"            {\n"];
            [s appendFormat:@"                %@ = [%@ arrayByAddingObject:avp];\n",avp.variableName,avp.variableName];
            [s appendString:@"            }\n"];
            [s appendString:@"        }\n"];
        }
    }
    if(first==NO)
    {
        [s appendString:@"        else\n"];
        [s appendString:@"        {\n"];
        [s appendString:@"             if(unknownAVPs==NULL)\n"];
        [s appendString:@"             {\n"];
        [s appendString:@"                 unknownAVPs = [[NSMutableArray alloc]init];\n"];
        [s appendString:@"             }\n"];
        [s appendString:@"             [unknownAVPs addObject:avp];\n"];
        [s appendString:@"        }\n"];
    }
    [s appendString:@"    }\n"];
    if(placeholderAVP)
    {
        [s appendFormat:@"    %@ = unknownAVPs;\n",placeholderAVP.variableName];
        [s appendFormat:@"    [knownAVPs addObject:[%@ copy]];\n",placeholderAVP.variableName];
    }
    [s appendString:@"    [self setArray:knownAVPs];\n"];

    [s appendString:@"}\n"];
    [s appendString:@"\n"];

    return s;
}


@end


