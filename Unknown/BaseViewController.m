//
//  BaseViewController.m
//  Unknown
//
//  Created by 荣刚 on 17/3/19.
//  Copyright © 2017年 荣刚. All rights reserved.
//

#import "BaseViewController.h"
#import "MBProgressHUD.h"
#import "ALToastView.h"

#define MBTag                           9899

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * showToast:message:
 *
 * 显示一个Toast提示
 *
 * @Parameters:
 *          view - 需要显示提示的ViewController
 *          message - 显示的Toast消息
 */
- (void)showToast:(UIView *)view message:(NSString *)msg
{
    if ( msg && msg.length > 15 ) {
        [ALToastView toastInView:view withText:msg];
    } else {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        
        // Configure for text only and offset down
        hud.mode = MBProgressHUDModeText;
        hud.labelText = msg;
        //        hud.margin = 10.f;
        //        hud.yOffset = 150.f;
        hud.removeFromSuperViewOnHide = YES;
        
        [hud hide:YES afterDelay:2];
    }
}

/**
 * anotherToast:message:
 *
 * 显示一个Toast提示
 *
 * @Parameters:
 *          view - 需要显示提示的ViewController
 *          message - 显示的Toast消息
 */
- (void)anotherToast:(UIView *)view message:(NSString *)msg
{
    MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.tag = MBTag;
    hud.labelText = msg;
    //    hud.margin = 10.f;
    //    hud.yOffset = 5.f;
}

/**
 * anotherHideToast:
 *
 * 隐藏Toast提示
 *
 * @Parameters:
 *          view - 显示提示的ViewController
 */
- (void)anotherHideToast:(UIView *)view
{
    MBProgressHUD * mb = (MBProgressHUD *) [view viewWithTag:MBTag];
    if (nil != mb || ![mb isHidden]) {
        [mb removeFromSuperview];
    }
}


@end
