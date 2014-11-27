MZSelectableLabel
===========

A simple to use drop in replacement for UILabel for iOS 7 that provides automatic detection of colors.

[![](https://raw.github.com/m1entus/MZSelectableLabel/master/Screens/screen1.png)](https://raw.github.com/m1entus/MZSelectableLabel/master/Screens/screen1.png)

## How To Use

1. Add the files MZSelectableLabel.m and MZSelectableLabel.h to your project.
2. Design your user interface as you would normally. In Interface Builder set the custom class for any UILabel you want to replace to MZSelectableLabel.
The label should honour all IB settings or create MZSelectableLabel objects in code.

Additional:

You can set automatic foreground color detection:
```objective-c
@property (nonatomic, assign, getter = isAutomaticForegroundColorDetectionEnabled) IBInspectable BOOL automaticForegroundColorDetectionEnabled;
@property (nonatomic, strong) IBInspectable UIColor *skipColorForAutomaticDetection;
```

This means that if you have attributed string, MZSelectableLabel will detect all ranges for you.
Even you can skip detection for default color for example `[UIColor blackColor]`.

## Example

```objective-c
[self.label setSelectableRange:[[self.label.attributedText string] rangeOfString:@"Tap me"] hightlightedBackgroundColor:[UIColor colorWithWhite:0.3 alpha:0.3]];

self.label.selectionHandler = ^(NSRange range, NSString *string) {

    NSString *message = [NSString stringWithFormat:@"You tapped %@", string];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"Dismiss"
                                          otherButtonTitles:nil];
    [alert show];
};
```

## Demo

```objective-c
Repository includes MZSelectableLabel that shows a simple use of the label in a storyboard with examples for implementing tappable links.

The demo also demonstrates how to use a gesture recognizer with the label to implement a long press on a link, which uses the rangeValueAtLocation method.
```

## Requirements

MZSelectableLabel requires either iOS 7.x and above.


## Contact

[Michal Zaborowski](http://github.com/m1entus)

[Twitter](https://twitter.com/iMientus)


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/m1entus/mzselectablelabel/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

