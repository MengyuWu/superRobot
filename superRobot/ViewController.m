//
//  ViewController.m
//  superRobot
//
//  Created by 吴梦宇 on 7/7/15.
//  Copyright (c) 2015 ___mengyu wu___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end



@implementation ViewController


- (IBAction)connectPressed:(id)sender{
    CFStringRef Ip= (CFStringRef)CFBridgingRetain(_inputIpField.text);
    UInt32 Port=[_inputPortField.text intValue];

    NSLog(@"ip IP: %@", Ip);
    NSLog(@"port: %i", Port);
    
    
    [self initNetworkCommunication:Ip andPort:Port];
    
}

- (void)initNetworkCommunication:(CFStringRef)Ip andPort:(UInt32)Port{
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;

    //CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)@"localhost", 80, &readStream, &writeStream);
    CFStreamCreatePairWithSocketToHost(NULL, Ip, Port, &readStream, &writeStream);
    inputStream = (__bridge NSInputStream *)readStream;
    outputStream = (__bridge NSOutputStream *)writeStream;
    [inputStream setDelegate:self];
    [outputStream setDelegate:self];
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode: NSDefaultRunLoopMode];
    [outputStream scheduleInRunLoop: [NSRunLoop currentRunLoop] forMode: NSDefaultRunLoopMode];
    
    [inputStream open];
    [outputStream open];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
