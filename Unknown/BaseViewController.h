//
//  BaseViewController.h
//  Unknown
//
//  Created by 荣刚 on 17/3/19.
//  Copyright © 2017年 荣刚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

// Toast提示
- (void)showToast:(UIView *)view message:(NSString *)msg;
- (void)anotherToast:(UIView *)view message:(NSString *)msg;
- (void)anotherHideToast:(UIView *)view;


@end
