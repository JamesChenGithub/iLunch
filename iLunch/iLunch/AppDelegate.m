//
//  AppDelegate.m
//  iLunch
//
//  Created by James on 15-1-4.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (nonatomic, strong) UITabBarController *tabBarController;

@end

@implementation AppDelegate

#if kIsILunchSeller
#else
- (UINavigationController *)navigationViewController
{
    
    UINavigationController *nav = (UINavigationController *)(self.tabBarController.selectedViewController);
    return nav;
}
#endif
- (void)enterMainUI
{
#if kIsILunchSeller
    SellerMineViewController *minevc = [NSObject loadClass:[SellerMineViewController class]];
    NavigationViewController *mineNav = [[NavigationViewController alloc] initWithRootViewController:minevc];
    self.window.rootViewController = mineNav;
#else
    
    MainViewController *mainvc = [NSObject loadClass:[MainViewController class]];
    NavigationViewController *mainNav = [[NavigationViewController alloc] initWithRootViewController:mainvc];
    mainNav.interactivePopGestureRecognizer.enabled = YES;
    mainNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:kTabBar_Main_Title_Str image:kTabBar_Main_Normal_Icon selectedImage:kTabBar_Main_Select_Icon];
    mainvc.title = mainNav.tabBarItem.title;

    DiscoveryViewController *disvc = [NSObject loadClass:[DiscoveryViewController class]];
    NavigationViewController *disNav = [[NavigationViewController alloc] initWithRootViewController:disvc];
    disNav.interactivePopGestureRecognizer.enabled = YES;
    disNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:kTabBar_Discovery_Title_Str image:kTabBar_Discovery_Normal_Icon selectedImage:kTabBar_Discovery_Select_Icon];
    disvc.title = disNav.tabBarItem.title;
    
    MineViewController *minevc = [NSObject loadClass:[MineViewController class]];
    NavigationViewController *mineNav = [[NavigationViewController alloc] initWithRootViewController:minevc];
    mineNav.interactivePopGestureRecognizer.enabled = YES;
    mineNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:kTabBar_Mine_Title_Str image:kTabBar_Mine_Normal_Icon selectedImage:kTabBar_Mine_Select_Icon];
    minevc.title = mineNav.tabBarItem.title;
    
    self.tabBarController = [[UITabBarController alloc] init];
    [self.tabBarController setViewControllers:@[mainNav, disNav, mineNav]];
    self.window.rootViewController = self.tabBarController;
    
    [[UITabBar appearance] setBackgroundImage:kTabBar_Background_Image];
    [[UITabBar appearance] setTintColor:kThemeColor];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kBlackColor, NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kThemeColor, NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
#endif
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [TencentOAuth HandleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [TencentOAuth HandleOpenURL:url];
}


@end
