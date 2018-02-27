//
//  main.m
//  client-test
//
//  Created by Andreas Fink on 27.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ulibpcap/ulibpcap.h>
#import <ulibdiameter/ulibdiameter.h>

int main(int argc, const char * argv[])
{
    
    UMPCAPPseudoConnection *pcon = [[UMPCAPPseudoConnection alloc]init];
    pcon.protocol = UMPCAPPseudoConnection_ip_protocol_tcp;
    pcon.remotePort = 3868;
    pcon.localPort = 3868;
    
    UMPCAPFile *pf = [[UMPCAPFile alloc]init];
    pf.filename = @"debug.pcap";
    if([pf openForPseudoConnection])
    {
        system("pwd");
    }
    else
    {
        fprintf(stderr,"couldnt open file %s\n",argv[1]);
        exit(-1);
    }
    
    UMDiameterService *service = [[UMDiameterService alloc]init];
    service.packetTraceFile = pf;
    service.packetTracePseudoConnection = pcon;
    
    const char hostname[]= "localhost";
    const char realm[] = "realm.localhost";
    service.localDiameterIdentity = [NSData dataWithBytes:hostname length:sizeof(hostname)];
    service.originRealm = [NSData dataWithBytes:realm length:sizeof(realm)];
    [service addLocalIPv4Address:@"100.200.100.200"];
    [service sendCER];
    @autoreleasepool
    {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
