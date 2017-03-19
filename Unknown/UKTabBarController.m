//
//  UKTabBarController.m
//  Unknown
//
//  Created by 荣刚 on 17/3/19.
//  Copyright © 2017年 荣刚. All rights reserved.
//

#import "UKTabBarController.h"
#import "Constant.h"
#import "UKNavigationController.h"

#define kTabTextColor_N UIColorFromRGB(0x6a6a6a)
#define kTabTextColor_H UIColorFromRGB(0x8abc30)
#define kTabBGColor UIColorFromRGB(0xf6f6f6)

#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"


@interface UKTabBarController ()

@end

@implementation UKTabBarController

+ (void)initialize {
    UIFont *tabBarTitleFont = [UIFont systemFontOfSize:10.0f];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kTabTextColor_N, NSForegroundColorAttributeName, tabBarTitleFont, NSFontAttributeName, nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kTabTextColor_H, NSForegroundColorAttributeName, tabBarTitleFont, NSFontAttributeName, nil] forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupChildViewControllers];
}

- (void)setupChildViewControllers {
    NSArray *names = @[@"资讯", @"发贴", @"粉丝圈", @"我"];
    NSArray *sbNames = @[@"News", @"Topics", @"FansGroup", @"Me"];
    
    NSArray *childItemsArray = @[
                                 @{kClassKey  : @"News",
                                   kTitleKey  : @"资讯",
                                   kImgKey    : @"tabbar_mainframe",
                                   kSelImgKey : @"tabbar_mainframeHL"},
                                 
                                 @{kClassKey  : @"Topics",
                                   kTitleKey  : @"发贴",
                                   kImgKey    : @"tabbar_contacts",
                                   kSelImgKey : @"tabbar_contactsHL"},
                                 
                                 @{kClassKey  : @"FansGroup",
                                   kTitleKey  : @"粉丝圈",
                                   kImgKey    : @"tabbar_discover",
                                   kSelImgKey : @"tabbar_discoverHL"},
                                 
                                 @{kClassKey  : @"Me",
                                   kTitleKey  : @"我",
                                   kImgKey    : @"tabbar_me",
                                   kSelImgKey : @"tabbar_meHL"} ];
    
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:dict[kClassKey] bundle:nil];
        UIViewController *vc = [sb instantiateInitialViewController];
        vc.title = dict[kTitleKey];
        UKNavigationController *nav = [[UKNavigationController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[kTitleKey];
        item.image = [UIImage imageNamed:dict[kImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : kThemeColor} forState:UIControlStateSelected];
        [self addChildViewController:nav];
    }];
    self.selectedIndex = 1;
}



@end
