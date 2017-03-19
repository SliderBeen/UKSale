//
//  LoginViewController.m
//  Unknown
//
//  Created by 荣刚 on 17/3/19.
//  Copyright © 2017年 荣刚. All rights reserved.
//

#import "LoginViewController.h"
#import "Constant.h"
#import "UMSocial.h"
#import "RegisterViewController.h"
#import "UKTabBarController.h"
#import "AppDelegate.h"

@interface LoginViewController ()<UMSocialUIDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBarHidden = YES;
    [self.userNameField setValue:UIColorFromRGB(0xFFFAF0) forKeyPath:@"_placeholderLabel.textColor"];
    [self.passwordField setValue:UIColorFromRGB(0xFFFAF0) forKeyPath:@"_placeholderLabel.textColor"];

}

#pragma mark - event

- (IBAction)doLogin:(UIButton *)btn {
    [self.view endEditing:YES];
    if (!IsValidateString(self.userNameField.text)) {
        [self showToast:self.view message:@"请输入用户名"];
        return;
    }
    if (!IsValidateString(self.passwordField.text)) {
        [self showToast:self.view message:@"请输入密码"];
        return;
    }
    
    [self anotherToast:self.view message:@"登录中..."];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self anotherHideToast:self.view];
        NSString *pwd = [UKUserDefaults objectForKey:self.userNameField.text];
        if ([self.passwordField.text isEqualToString:pwd]) {
            [self showToast:self.view message:@"登录成功！"];
            AppDelegate *app = (AppDelegate *)([UIApplication sharedApplication].delegate);
            app.window.rootViewController = [UKTabBarController new];
        } else {
            [self showToast:self.view message:@"登录失败！密码错误"];
        }
    });
}

- (IBAction)doRegister:(UIButton *)btn {
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    registerVC.successBlock = ^(NSString *name, NSString *pwd){
        self.userNameField.text = name;
        self.passwordField.text = pwd;
    };
    [self.navigationController pushViewController:registerVC animated:YES];
}

- (IBAction)doThirdLogin:(UIButton *)btn {
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:[self getPlatformWithName:btn.tag]];
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        if (response.responseCode == UMSResponseCodeSuccess) {
//            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary]valueForKey:[self getPlatformWithName:btnSnsLogin.tag]];
//            [self requestLogin:[self getPlatfTypeormWithName:btn.tag] withThirdId:snsAccount.usid];
        }
    });
}

- (NSString *)getPlatformWithName:(NSInteger)type{
    NSString *name = @"";
    switch (type) {
        case 1001:
            name = UMShareToWechatSession;
            break;
        case 1002:
            name = UMShareToQQ;
            break;
        case 1003:
            name = UMShareToSina;
            break;
            
        default:
            break;
    }
    return name;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
