//
//  main.m
//  diameter-test1
//
//  Created by Andreas Fink on 30.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool
    {
        NSDictionary *dict = @{ @"a" : @"aval", @"b" : @"bval" };
        
        UMJsonWriter *writer = [[UMJsonWriter alloc] init];
        writer.humanReadable = YES;
        NSString *output = [writer stringWithObject:dict];

        
        UMJsonParser *parser = [[UMJsonParser alloc]init];
        NSError *e = NULL;
        id result = [parser objectWithString:output error:&e];

        NSLog(@"%@->%@->%@ %@",dict,output,result,e);

    }
    return 0;
}
