//
//  AppDelegate.m
//  Unknown
//
//  Created by 荣刚 on 17/3/19.
//  Copyright © 2017年 荣刚. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "UKNavigationController.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialSinaSSOHandler.h"
#import "UMSocialQQHandler.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor blackColor];
    
    [self setupUMeng];
    
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    UKNavigationController *nav = [[UKNavigationController alloc] initWithRootViewController:loginVC];
    _window.rootViewController = nav;
    
    [_window makeKeyAndVisible];
    
    return YES;
}

- (void)setupUMeng {
    [UMSocialData setAppKey:@"573d78f767e58ee3cd001232"];
    [UMSocialQQHandler setQQWithAppId:@"1101513837" appKey:@"G24np4vdlZ4Cbess" url:@"http://www.baidu.com"];
    [UMSocialWechatHandler setWXAppId:@"wxb6e4cf82d2d3d874" appSecret:@"d37f94314058f38024610b0047648ec2" url:@"http://www.baidu.com"];
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"2529790649"
                                              secret:@"d1deb6b110deb97fb7689ef3390d3b95"
                                         RedirectURL:@"http://www.baidu.com"];

}

- (BOOL)application:(UIApplication *)application
      handleOpenURL:(NSURL *)url {
    //第三方分享处理
    return [UMSocialSnsService handleOpenURL:url];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
