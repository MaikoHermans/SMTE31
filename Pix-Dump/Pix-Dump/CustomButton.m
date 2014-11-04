//
//  CustomButton.m
//  Pix-Dump
//
//  Created by Fhict on 03/11/14.
//  Copyright (c) 2014 Maiko Hermans. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
 //// General Declarations
 CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
 CGContextRef context = UIGraphicsGetCurrentContext();
 
 //// Color Declarations
 UIColor* fillColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
 UIColor* strokeColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
 UIColor* color = [UIColor colorWithRed: 0.886 green: 0.59 blue: 0 alpha: 1];
 
 //// Gradient Declarations
 NSArray* gradient2Colors = [NSArray arrayWithObjects:
 (id)color.CGColor,
 (id)[UIColor colorWithRed: 0.943 green: 0.795 blue: 0.5 alpha: 1].CGColor,
 (id)fillColor.CGColor, nil];
 CGFloat gradient2Locations[] = {0.39, 1, 1};
 CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (CFArrayRef)gradient2Colors, gradient2Locations);
 
 //// Rounded Rectangle Drawing
 UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, 0, 190, 80) cornerRadius: 8];
 CGContextSaveGState(context);
 [roundedRectanglePath addClip];
 CGContextDrawLinearGradient(context, gradient2, CGPointMake(29.84, -25.16), CGPointMake(160.16, 105.16), 0);
 CGContextRestoreGState(context);
 [strokeColor setStroke];
 roundedRectanglePath.lineWidth = 0.5;
 [roundedRectanglePath stroke];
 
 
 //// Cleanup
 CGGradientRelease(gradient2);
 CGColorSpaceRelease(colorSpace);
}


@end
