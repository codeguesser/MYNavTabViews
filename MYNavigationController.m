//
//  MYNavigationController.m
//  testnavigation
//
//  Created by  on 2012/5/23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MYNavigationController.h"

@implementation MYNavigationController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    barLayer = [[CALayer alloc]init];
    [barLayer setContents:(id)[self createImageWithSize:self.navigationBar.frame.size]];
    [barLayer setBounds:self.navigationBar.frame];
    [barLayer setPosition:CGPointMake(barLayer.frame.size.width/2, barLayer.frame.size.height/2)];
    [self.navigationBar.layer insertSublayer:barLayer atIndex:1];
     
    
}
//产生一个渐变的图片背景，因为没有背景可用
-(CGImageRef)createImageWithSize:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    CGGradientRef myGradient;
    CGColorSpaceRef myColorspace;
    size_t num_locations = 2;
    CGFloat locations[2] = { 0.0, 1.0 };
    CGFloat components[8] = { 1.0, 0.5, 0.4, 1.0,  // Start color
        0.8, 0.8, 0.3, 1.0 }; // End color
    
    myColorspace = CGColorSpaceCreateDeviceRGB();
    myGradient = CGGradientCreateWithColorComponents (myColorspace, components,
                                                      locations, num_locations);
    
    CGPoint myStartPoint, myEndPoint;
    myStartPoint.x = 0.0;
    myStartPoint.y = 0.0;
    myEndPoint.x = size.width;
    myEndPoint.y = size.height;
    CGContextDrawLinearGradient (context, myGradient, myStartPoint, myEndPoint, 0);
    CGImageRef image= UIGraphicsGetImageFromCurrentImageContext().CGImage;
    
    UIGraphicsEndImageContext();
    return image;
}
-(void)navigationBar:(UINavigationBar *)navigationBar didPushItem:(UINavigationItem *)item{
    [barLayer removeFromSuperlayer];
    [self.navigationBar.layer insertSublayer:barLayer atIndex:1];
}
@end
