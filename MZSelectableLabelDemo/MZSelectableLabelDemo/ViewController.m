//
//  ViewController.m
//  MZSelectableLabelDemo
//
//  Created by Michał Zaborowski on 04.08.2014.
//  Copyright (c) 2014 Michal Zaborowski. All rights reserved.
//

#import "ViewController.h"
#import "MZSelectableLabel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MZSelectableLabel *label;

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];

    // to respond to links being touched by the user.
    self.label.selectionHandler = ^(NSRange range, NSString *string) {
        // Put up an alert with a message if it's not an URL

        NSString *message = [NSString stringWithFormat:@"You tapped %@", string];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"Dismiss"
                                              otherButtonTitles:nil];
        [alert show];
    };

//    Uncomment to automatic detection!
//    self.label.skipColorForAutomaticDetection = [UIColor blackColor];
//    self.label.automaticDetectionBackgroundHighlightColor = [UIColor lightGrayColor];
//    self.label.automaticForegroundColorDetectionEnabled = YES;
    
    
    if (!self.label.automaticForegroundColorDetectionEnabled) {
        [self.label setSelectableRange:[[self.label.attributedText string] rangeOfString:@"Tap me"] hightlightedBackgroundColor:[UIColor colorWithWhite:0.3 alpha:0.3]];
    }
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressLabel:)];
    longPress.minimumPressDuration = 0.5;
    [self.label addGestureRecognizer:longPress];
    
}

- (void)longPressLabel:(UILongPressGestureRecognizer *)recognizer
{
    // Only accept gestures on our label and only in the begin state
    if ((recognizer.view != self.label) || (recognizer.state != UIGestureRecognizerStateBegan))
    {
        return;
    }
    
    // Get the position of the touch in the label
    CGPoint location = [recognizer locationInView:self.label];
    
    // Get the link under the location from the label
    MZSelectableLabelRange *selectedRange = [self.label rangeValueAtLocation:location];
    
    if (!selectedRange)
    {
        // No link was touched
        return;
    }
    
    NSString *message = [NSString stringWithFormat:@"You long pressed %@", [[self.label.attributedText string] substringWithRange:selectedRange.range]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"Dismiss"
                                          otherButtonTitles:nil];
    [alert show];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
