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

@property (weak, nonatomic) IBOutlet UITextField *inputIpField;
@property (weak, nonatomic) IBOutlet UITextField *inputPortField;

- (IBAction)connectPressed:(id)sender;

@end

