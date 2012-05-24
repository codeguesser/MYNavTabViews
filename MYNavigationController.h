//
//  MYNavigationController.h
//  testnavigation
//
//  Created by  on 2012/5/23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface MYNavigationController : UINavigationController<UINavigationControllerDelegate>{
    CALayer *barLayer;
}
-(CGImageRef)createImageWithSize:(CGSize)size;
@end
