//
//  MYTabBarController.h
//  MYNavTabViews
//
//  Created by  on 2012/5/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MYTabBarController : UITabBarController<UITabBarDelegate>{
    CALayer *barLayer;
    NSArray *selectedImages;
    NSArray *unSelecteddImages;
}
-(CGImageRef)createImageWithSize:(CGSize)size;
-(void)setSelectedImages:(NSArray *)_selectedImages;
-(void)setUnSelecteddImages:(NSArray *)_unSelecteddImages;
-(void)createBar;
@end