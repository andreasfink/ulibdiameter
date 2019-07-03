//
//  main.m
//  diameter-avp-gen
//
//  Created by Andreas Fink on 25.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>
#import "../version.h"
#import "UMDiameterAvpDef.h"

NSString *getFirst(id param);
int main(int argc, const char * argv[]);
NSString *headerFileNameWithPrefix(NSString *prefix, NSString *dir,  BOOL *exists);
NSString *methodFileNameWithPrefix(NSString *prefix, NSString *dir,  BOOL *exists);

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
        NSMutableArray *avpDefs = [[NSMutableArray alloc]init];
		NSString *groupdefsDir = NULL;
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
                                               @"name"  : @"definitions",
                                               @"short" : @"-d",
                                               @"long"  : @"--definitions",
                                               @"argument" : @"filename",
                                               @"help"  : @"reads the avp definition from a file",
                                               },
										  @{
                                               @"name"  : @"group-definitions",
                                               @"short" : @"-g",
                                               @"long"  : @"--group-definitions",
                                               @"argument" : @"directory",
                                               @"help"  : @"reads the avp group definition from files in that directory",
                                               },
                                           @{
                                               @"name"  : @"group-only",
                                               @"long"  : @"--group-only",
                                               @"help"  : @"skip all objects which are not of type Grouped",
                                               },
                                           @{
                                               @"name"  : @"write-avp-headers",
                                               @"long"  : @"--write-avp-headers",
                                               @"help"  : @"writes avp headers",
                                               },
                                           @{
                                               @"name"  : @"write-avp-methods",
                                               @"long"  : @"--write-avp-methods",
                                               @"help"  : @"writes avp methods",
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
                                               @"name"  : @"dir",
                                               @"short" : @"-d",
                                               @"long"  : @"--directory",
                                               @"argument" : @"target-directory",
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
        NSString *prefix = @"UMDiameterAvp";
        BOOL verbose = NO;
        BOOL groupOnly = NO;
        NSString *definitionsFilename;
        NSString *definitionsString;
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
        

        
        s = getFirst(params[@"dir"]);
        if(s)
        {
            dir = s;
        }
        
        s = getFirst(params[@"verbose"]);
        if(s)
        {
            verbose = YES;
        }
        s = getFirst(params[@"group-only"]);
        if(s.length > 0)
        {
            groupOnly = YES;
        }
		s = getFirst(params[@"group-definitions"]);
		if(s)
		{
			groupdefsDir = s;
		}
		else
		{
			groupdefsDir=@"./";
		}
        s = getFirst(params[@"definitions"]);
        if(s)
        {
            definitionsFilename = s;
            NSError *e = NULL;
            definitionsString = [NSString stringWithContentsOfFile:definitionsFilename encoding:NSUTF8StringEncoding error:&e];
            if(e)
            {
                NSLog(@"%@",e);
                exit(-1);
            }
            NSArray *lines = [definitionsString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
            for(NSString *line1 in lines)
            {
                NSString *line = [line1 trim];
                if(line.length == 0)
                {
                    continue;
                }
                NSError *e = NULL;

                UMDiameterAvpDef *avpdef = [[UMDiameterAvpDef alloc]init];
                [avpdef parseString:line error:&e];

                if(e)
                {
                    NSLog(@"%@",e);
                }
                else
                {
                	if([avpdef.typeDefinition isEqualToString:@"Grouped"])
                	{

						NSString *objectName = [avpdef objectNameWithPrefix:prefix];
                		NSString *groupdefFilename = [NSString stringWithFormat:@"%@/%@.bnf",groupdefsDir,objectName];
						NSString *s = [NSString stringWithContentsOfFile:groupdefFilename
																encoding:NSUTF8StringEncoding
																   error:&e];
						if(e)
                		{
                    		NSLog(@"%@",e);
                		}
                		else
                		{
							[avpdef parseGroupDef:s error:&e];
							if(e)
							{
								NSLog(@"%@",e);
							}
						}
					}
                    [avpDefs addObject:avpdef];
                }
            }
        }
        
        s = getFirst(params[@"write-avp-headers"]);
        if(s.length>0)
        {
            for(UMDiameterAvpDef *avpdef in avpDefs)
            {
                BOOL exists=NO;
                NSString *filename;

                filename = [avpdef headerFileNameWithPrefix:prefix
                                                  directory:dir
                                                     exists:&exists];
                if((exists==NO) || (doOverwrite==YES))
                {
                    if((avpdef.isGroup) || (groupOnly==NO))
                    {
                        NSString *content = [avpdef headerFileWithPrefix:prefix
                                                                    user:user
                                                                    date:date
                                                               directory:dir];
                        NSError *e = NULL;
                        if(verbose)
                        {
                            fprintf(stdout,"writing header to %s\n",filename.UTF8String);
                            fflush(stdout);
                        }
                        [content writeToFile:filename
                                  atomically:YES
                                    encoding:NSUTF8StringEncoding
                                       error:&e];
                        if(e)
                        {
                            NSLog(@"Error: %@",e);
                        }
                    }
                }
            }
        }
        
        s = getFirst(params[@"write-avp-methods"]);
        if(s.length>0)
        {
            for(UMDiameterAvpDef *avpdef in avpDefs)
            {
                BOOL exists=NO;
                NSString *filename;
                
                filename = [avpdef methodsFileNameWithPrefix:prefix
                                                   directory:dir
                                                      exists:&exists];

                if((exists==NO) || (doOverwrite==YES))
                {
                    if((avpdef.isGroup) || (groupOnly==NO))
                    {
                        NSString *content = [avpdef methodsFileWithPrefix:prefix
                                                                     user:user
                                                                     date:date
                                                                directory:dir];
                        NSError *e = NULL;
                        if(verbose)
                        {
                            fprintf(stdout,"writing methods to %s\n",filename.UTF8String);
                            fflush(stdout);
                        }
                        [content writeToFile:filename
                                  atomically:YES
                                    encoding:NSUTF8StringEncoding
                                       error:&e];
                        if(e)
                        {
                            NSLog(@"Error: %@",e);
                        }
                    }
                }
            }
        }
    }
    return 0;
}

