//
//  ViewController.h
//  superRobot
//
//  Created by 吴梦宇 on 7/7/15.
//  Copyright (c) 2015 ___mengyu wu___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSStreamDelegate> {
    NSInputStream * inputStream;
    NSOutputStream * outputStream;
    NSMutableArray * messages;
}

@property (weak, nonatomic) IBOutlet UIView *ActionView;
@property (weak, nonatomic) IBOutlet UITextField *inputIpField;
@property (weak, nonatomic) IBOutlet UITextField *inputPortField;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIView *loginView;

@property (weak, nonatomic) IBOutlet UIView *controlView;

- (IBAction)connectPressed:(id)sender;

// Action View Mode Button

- (IBAction)passiveButton:(id)sender;

- (IBAction)safeButton:(id)sender;

- (IBAction)fullButton:(id)sender;

- (IBAction)cleanButton:(id)sender;

- (IBAction)dockButton:(id)sender;

- (IBAction)beepButton:(id)sender;

- (IBAction)stopButton:(id)sender;

@end

