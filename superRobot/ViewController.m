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
    
    [_inputPortField resignFirstResponder];
    [self initNetworkCommunication:Ip andPort:Port];
    
    [self.view bringSubviewToFront:_ActionView];
    
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
    messages = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sendMessage:(NSString *)msg {
    NSString *response  = [NSString stringWithFormat:@"%@", msg];
    NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
    [outputStream write:[data bytes] maxLength:[data length]];
}

- (void)stream:(NSStream *)theStream handleEvent:(NSStreamEvent)streamEvent {
    NSLog(@"stream event %lu", (unsigned long)streamEvent);
    switch (streamEvent) {
            
        case NSStreamEventOpenCompleted:
            NSLog(@"Stream opened");
            break;
            
        case NSStreamEventHasBytesAvailable:
            break;
            
        case NSStreamEventErrorOccurred:
            NSLog(@"Can not connect to the host!");
            break;
            
        case NSStreamEventEndEncountered:
            [theStream close];
            [theStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
            break;
            
        default:
            NSLog(@"Unknown event");
    }
}



- (IBAction)passiveButton:(id)sender {
    NSLog(@"passive");
    [self sendMessage:@"passive"];
}

- (IBAction)safeButton:(id)sender {
    NSLog(@"safe");
    [self sendMessage:@"safe"];
}

- (IBAction)fullButton:(id)sender {
    NSLog(@"full");
    [self sendMessage:@"full"];
}

- (IBAction)cleanButton:(id)sender {
    NSLog(@"clean");
    [self sendMessage:@"clean"];
}

- (IBAction)dockButton:(id)sender {
    NSLog(@"dock");
    [self sendMessage:@"dock"];
}

- (IBAction)beepButton:(id)sender {
    NSLog(@"beep");
    [self sendMessage:@"beep"];
}

- (IBAction)stopButton:(id)sender {
    NSLog(@"stop");
    [self sendMessage:@"stop"];
}
@end
