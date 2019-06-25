//
//  main.m
//  avp-src-gen
//
//  Created by Andreas Fink on 25.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>
#import "../version.h"

NSString *gen_m_file(NSString *objectName,
                     NSString *objectType,
                     NSString *objectCode,
                     BOOL vendorFlag,
                     BOOL mandatoryFlag,
                     NSString *vendorId,
                     NSString *user,
                     NSString *date);

NSString *gen_h_file(NSString *objectName,
                     NSString *objectType,
                     NSString *objectCode,
                     BOOL vendorFlag,
                     BOOL mandatoryFlag,
                     NSString *vendorId,
                     NSString *user,
                     NSString *date);

NSString *getFirst(id param)
{
    if([param isKindOfClass:[NSString class]])
    {
        return (NSString *)param;
    }
    if([param isKindOfClass:[NSNumber class]])
    {
        return [((NSNumber *)param) stringValue];
    }
    if([param isKindOfClass:[NSArray class]])
    {
        NSArray *a = (NSArray *)param;
        if(a.count == 0)
        {
            return NULL;
        }
        id b = a[0];
        return getFirst(b);
    }
    return NULL;
}

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSDictionary *appDefinition = @
        {
            @"version" : @(VERSION),
            @"executable" : @"avp-src-gen",
            @"run-as" : @(argv[0]),
            @"copyright" : @"© 2019 Andreas Fink",
        };

        NSArray *commandLineDefinition = @[
                                           @{
                                               @"name"  : @"version",
                                               @"short" : @"-V",
                                               @"long"  : @"--version",
                                               @"help"  : @"shows the software version"
                                               },
                                           @{
                                               @"name"  : @"verbose",
                                               @"short" : @"-v",
                                               @"long"  : @"--verbose",
                                               @"help"  : @"enables verbose mode"
                                               },
                                           @{
                                               @"name"  : @"help",
                                               @"short" : @"-h",
                                               @"long" : @"--help",
                                               @"help"  : @"shows the help screen",
                                               },
                                           @{
                                               @"name"  : @"name",
                                               @"short" : @"-n",
                                               @"long"  : @"--name",
                                               @"argument" : @"avp-name",
                                               @"help"  : @"The attribute name",
                                               },
                                           @{
                                               @"name"  : @"code",
                                               @"short" : @"-c",
                                               @"long"  : @"--code",
                                               @"argument" : @"avp-code",
                                               @"help"  : @"The AVP code",
                                               },
                                           @{
                                               @"name"  : @"vendor",
                                               @"short" : @"-E",
                                               @"long"  : @"--vendor",
                                               @"argument" : @"vendor-id",
                                               @"help"  : @"The Vendor ID to use (sets V flag)"
                                               },
                                           @{
                                               @"name"  : @"mandatory",
                                               @"short" : @"-m",
                                               @"long"  : @"--mandatory",
                                               @"help"  : @"Enables the mandatory flag"
                                               },
                                           @{
                                               @"name"  : @"type",
                                               @"short" : @"-t",
                                               @"long"  : @"--type",
                                               @"help"  : @"Base type"
                                               },
                                           @{
                                               @"name"  : @"prefix",
                                               @"short" : @"-p",
                                               @"long"  : @"--prefix",
                                               @"help"  : @"prefix for object names"
                                               },
                                           @{
                                               @"name"  : @"overwrite",
                                               @"short" : @"-o",
                                               @"long"  : @"--overwrite",
                                               @"help"  : @"overwrite existing files"
                                               },
                                           @{
                                               @"name"  : @"filename",
                                               @"short" : @"-f",
                                               @"long"  : @"--file",
                                               @"help"  : @"filename (without .h .m)"
                                               },
                                           @{
                                               @"name"  : @"dir",
                                               @"short" : @"-d",
                                               @"long"  : @"--directory",
                                               @"help"  : @"directory to look for files/write files"
                                               }];


        UMCommandLine *_commandLine = [[UMCommandLine alloc]initWithCommandLineDefintion:commandLineDefinition
                                                                           appDefinition:appDefinition
                                                                                    argc:argc
                                                                                    argv:argv];
        [_commandLine handleStandardArguments];
        NSDictionary *params = _commandLine.params;

        NSString *user = @(getenv("USER"));
        NSString *date = [[NSDate date]stringValue];

        BOOL doOverwrite = NO;
        BOOL mandatoryFlag = NO;
        BOOL vendorFlag = NO;
        BOOL methodFileExists=NO;
        NSString *vendorId;
        NSString *prefix = @"UMDiameterAvp";
        NSString *baseType = @"UMDiameterAvpOctetString";
        NSString *code;
        NSString *name;
        BOOL verbose = NO;
        NSString *filename;
        NSString *dir;
        NSString *s = getFirst(params[@"prefix"]);
        if(s)
        {
            prefix = s;
        }

        s = getFirst(params[@"overwrite"]);
        if(s)
        {
            doOverwrite = YES;
        }

        s = getFirst(params[@"type"]);
        if(s)
        {
            baseType = s;
        }

        s = getFirst(params[@"mandatory"]);
        if(s)
        {
            mandatoryFlag = YES;
        }

        s = getFirst(params[@"vendor"]);
        if(s)
        {
            if([s isEqualToString:@"3GPP"])
            {
                prefix = @"UMDiameterAvp3GPP_";
                vendorId = @"UMDiameterApplicationId_3GPP";
                vendorFlag = YES;
            }
            else
            {
                vendorId = s;
                vendorFlag = YES;
            }
        }

        s = getFirst(params[@"code"]);
        if(s)
        {
            code = s;
        }

        s = getFirst(params[@"dir"]);
        if(s)
        {
            dir = s;
        }

        s = getFirst(params[@"name"]);
        if(s)
        {
            name = s;
        }
        s = getFirst(params[@"verbose"]);
        if(s)
        {
            verbose = YES;
        }

        s = getFirst(params[@"file"]);
        if(s)
        {
            filename = s;
        }
        else
        {
            filename = [NSString stringWithFormat:@"%@%@",prefix,name];
        }

        NSFileManager *fm = [NSFileManager defaultManager];
        if(dir)
        {
            [fm changeCurrentDirectoryPath:dir];
        }
        NSString *currentPath   = [fm currentDirectoryPath];
        NSString *full_filename_h = [NSString stringWithFormat:@"%@/%@.h",currentPath,filename];
        NSString *full_filename_m = [NSString stringWithFormat:@"%@/%@.h",currentPath,filename];
        NSString *full_filename_methods_m = [NSString stringWithFormat:@"%@/%@.methods.m",currentPath,filename];

        NSError *e_h = NULL;
        NSError *e_m = NULL;
        NSError *e_methods_m = NULL;
        NSDictionary<NSFileAttributeKey, id> *attributes_h  = [fm attributesOfItemAtPath:full_filename_h error:&e_h];
        NSDictionary<NSFileAttributeKey, id> *attributes_m  = [fm attributesOfItemAtPath:full_filename_m error:&e_m];
        NSDictionary<NSFileAttributeKey, id> *attributes_methods_m  = [fm attributesOfItemAtPath:full_filename_methods_m error:&e_methods_m];

        if((e_h==NULL) && (doOverwrite==NO))
        {
            fprintf(stderr,"Can not write to file because it already exists: %s\n",full_filename_h.UTF8String);
            exit(-1);
        }
        if((e_h==NULL) && (doOverwrite==NO))
        {
            fprintf(stderr,"Can not write to file because it already exists: %s\n",full_filename_m.UTF8String);
            exit(-1);
        }
        if(e_methods_m==NULL)
        {
            methodFileExists = YES;
        }

        NSString *mfile = gen_m_file(name,baseType, code,vendorFlag, mandatoryFlag,vendorId, user, date);
        NSLog(@"mfile: %@",mfile);

    }
    return 0;
}


NSString *gen_m_file(NSString *objectName,
                     NSString *objectType,
                     NSString *objectCode,
                     BOOL vendorFlag, BOOL
                     mandatoryFlag,
                     NSString *vendorId,
                     NSString *user,
                     NSString *date)
{
    NSMutableString *s = [[NSMutableString alloc]init];
    [s appendString:@"//\n"];
    [s appendFormat:@"//  %@.m\n",objectName];
    [s appendString:@"//  ulibdiameter\n"];
    [s appendString:@"//\n"];
    [s appendFormat:@"//  Created by %@ on %@\n",user,date];
    [s appendFormat:@"//  Copyright © 2019 Andreas Fink. All rights reserved.\n"];
    [s appendString:@"//\n"];
    [s appendString:@"\n"];
    [s appendString:@"#import \"UMDiameterAvpAll.h\"\n"];
    [s appendString:@"\n"];
    [s appendFormat:@"@implementation %@\n",objectName];
    [s appendString:@"\n"];
    [s appendString:@"\n"];
    [s appendString:@"- (NSString *)avpType\n"];
    [s appendString:@"{\n"];
    [s appendFormat:@"    return @\"%@\";\n",objectType];
    [s appendString:@"}\n"];
    [s appendString:@"\n"];
    [s appendString:@"- (uint32_t)avpCode\n"];
    [s appendString:@"{\n"];
    [s appendFormat:@"    return %@;\n",objectCode];
    [s appendString:@"}\n"];
    [s appendString:@"\n"];
    [s appendString:@"- (void)genericInitialisation\n"];
    [s appendString:@"{\n"];
    [s appendString:@"    [super genericInitialisation];\n"];
    if((vendorFlag) && (mandatoryFlag))
    {
        [s appendString:@"    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;\n"];
    }
    else if(vendorFlag)
    {
        [s appendString:@"    _avpFlags = UMDiameterAvpFlag_Vendor;\n"];
    }
    else if(mandatoryFlag)
    {
        [s appendString:@"    _avpFlags = UMDiameterAvpFlag_Mandatory;\n"];
    }
    if(vendorId)
    {
    }
    [s appendFormat:@"    _avpVendorId = %@;\n",vendorId];
    [s appendString:@"}\n"];
    [s appendString:@"\n"];
    return s;
}

NSString *gen_h_file(NSString *objectName,NSString *objectType,NSString *objectCode, BOOL vendorFlag, BOOL mandatoryFlag,NSString *vendorId, NSString *user, NSString *date)
{
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
    [s appendString:@"\n"];
    [s appendFormat:@"@interface %@ : %@\n",objectName,objectType];
    [s appendString:@"\n"];
    [s appendString:@"@end\n"];
    [s appendString:@"\n"];
    return s;
}
