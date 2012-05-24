//
//  AppDelegate.h
//  MYNavTabViews
//
//  Created by  on 2012/5/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MYTabBarController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, retain) MYTabBarController *tabBarController;
@property (strong, nonatomic) UIWindow *window;

@end
