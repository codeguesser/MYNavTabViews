//
//  AppDelegate.m
//  MYNavTabViews
//
//  Created by  on 2012/5/24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "GameonViewController.h"
#import "MygameViewController.h"
#import "AccountViewController.h"
#import "MYNavigationController.h"
#import "MYTabBarController.h"
@implementation AppDelegate
@synthesize tabBarController = _tabBarController;
@synthesize window = _window;

- (void)dealloc
{
    [_window release];
    [super dealloc];
    [_tabBarController release];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.tabBarController = [[MYTabBarController alloc] init];
    
    HomeViewController *home = [[HomeViewController alloc] init];
    MYNavigationController *homeNav = [[MYNavigationController alloc]initWithRootViewController:home];
    homeNav.tabBarItem.title = @"home";
    homeNav.tabBarItem.tag = 1001;
    //homeNav.tabBarItem = 
    
    GameonViewController *gameon = [[GameonViewController alloc] init];
    MYNavigationController *gameonNav = [[MYNavigationController alloc]initWithRootViewController:gameon];
    gameonNav.tabBarItem.title = @"gameon";
    gameonNav.tabBarItem.tag = 1002;
    
    MygameViewController *mygame = [[MygameViewController alloc] init];
    MYNavigationController *mygameNav = [[MYNavigationController alloc]initWithRootViewController:mygame];
    mygameNav.tabBarItem.title = @"mygame";
    mygameNav.tabBarItem.tag = 1003;
    
    AccountViewController *account = [[AccountViewController alloc] init];
    MYNavigationController *accountNav = [[MYNavigationController alloc]initWithRootViewController:account];
    accountNav.tabBarItem.title = @"account";
    accountNav.tabBarItem.tag = 1004;
    
    
    NSArray *selectedImage = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"magnifying-glass-selected.png"],
                              [UIImage imageNamed:@"magnifying-glass-selected.png"],
                              [UIImage imageNamed:@"magnifying-glass-selected.png"],
                              [UIImage imageNamed:@"magnifying-glass-selected.png"],
                              nil];
    NSArray *unselectedImage = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"magnifying-glass.png"],
                              [UIImage imageNamed:@"magnifying-glass.png"],
                              [UIImage imageNamed:@"magnifying-glass.png"],
                              [UIImage imageNamed:@"magnifying-glass.png"],
                              nil];
    [self.tabBarController setUnSelecteddImages:unselectedImage];
    [self.tabBarController setSelectedImages: selectedImage];
	self.tabBarController.viewControllers = [NSArray arrayWithObjects:homeNav,gameonNav,mygameNav,accountNav,nil];
    
    [selectedImage release];
    [unselectedImage release];
    [home release];
    [homeNav release];
    [gameonNav release];
    [gameon release];
    [mygame release];
    [mygameNav release];
    [account release];
    [accountNav release];
    
    [self.window setRootViewController:self.tabBarController];
	//[self.window addSubview:self.tabBarController.view];
    
    
    
    
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
