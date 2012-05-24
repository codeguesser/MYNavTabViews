//
//  MYTabBarController.m
//  MYNavTabViews
//
//  Created by  on 2012/5/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MYTabBarController.h"
#import "MYNavigationController.h"
@implementation MYTabBarController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)dealloc{
    [super dealloc];
    [selectedImages release];
    [unSelecteddImages release];
    [barLayer release];
}

#pragma mark - common method
-(void)setSelectedImages:(NSArray *)_selectedImages{
    [selectedImages release];
    [self createBar];
    NSMutableArray *tempArray = [[NSMutableArray alloc]initWithCapacity:_selectedImages.count];
    int i = 0;
    for (UIImage *img in _selectedImages) {
        CALayer *layer = [[CALayer alloc]init];
        CGRect layerFrame = self.tabBar.frame;
        layerFrame.size.height -= 10;
        layerFrame.size.width = img.size.width * layerFrame.size.height/img.size.height;
        [layer setContents:(id)img.CGImage];
        
        [layer setBounds:layerFrame];
        [layer setPosition:CGPointMake(self.tabBar.frame.size.width/_selectedImages.count/2+i++*self.tabBar.frame.size.width/_selectedImages.count, self.tabBar.frame.size.height/2)];
        [tempArray addObject:layer];
    }
    selectedImages = tempArray;
    [self.tabBar.layer addSublayer:(CALayer *)[selectedImages objectAtIndex:0]];
}
-(void)setUnSelecteddImages:(NSArray *)_unSelecteddImages{
    [unSelecteddImages release];
    [self createBar];
    NSMutableArray *tempArray = [[NSMutableArray alloc]initWithCapacity:_unSelecteddImages.count];
    
    int i=0;
    for (UIImage *img in _unSelecteddImages) {
        CALayer *layer = [[CALayer alloc]init];
        CGRect layerFrame = self.tabBar.frame;
        layerFrame.size.height -= 10;
        layerFrame.size.width = img.size.width * layerFrame.size.height/img.size.height;
        [layer setContents:(id)img.CGImage];
        [layer setBounds:layerFrame];
        [layer setPosition:CGPointMake(self.tabBar.frame.size.width/_unSelecteddImages.count/2+i++*self.tabBar.frame.size.width/_unSelecteddImages.count, self.tabBar.frame.size.height/2)];
        [self.tabBar.layer insertSublayer:layer atIndex:3];
        
        [tempArray addObject:layer];
    }
    unSelecteddImages = tempArray;
}

-(void)createBar{
    if (barLayer == nil) {
        barLayer = [[CALayer alloc]init];
        [barLayer setContents:(id)[self createImageWithSize:self.tabBar.frame.size]];
        [barLayer setBounds:self.tabBar.frame];
        [barLayer setPosition:CGPointMake(barLayer.frame.size.width/2, barLayer.frame.size.height/2)];
        [self.tabBar.layer addSublayer:barLayer];
    }
    
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



#pragma mark - delegate form UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    for (CALayer *layer in selectedImages) {
        [layer removeFromSuperlayer];
    }
    [self.tabBar.layer addSublayer:(CALayer *)[selectedImages objectAtIndex:item.tag-1001]];
}
@end
