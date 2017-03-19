//
//  RegisterViewController.m
//  Unknown
//
//  Created by 荣刚 on 17/3/19.
//  Copyright © 2017年 荣刚. All rights reserved.
//

#import "RegisterViewController.h"
#import "Constant.h"

@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPwdField;


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)doRegister:(UIButton *)btn {
    NSString *userName = self.userNameField.text;
    NSString *userPwd = self.passwordField.text;
    NSString *userRepeatPwd = self.confirmPwdField.text;
    if ([userName length] == 0) {
        [self showToast:self.view message:@"请输入用户名"];
        return;
    } else if ([userPwd length] < 6) {
        [self showToast:self.view message:@"密码不能小于6位"];
        return;
    } else if (![userRepeatPwd isEqualToString:userPwd]) {//2次密码必须一致
        [self showToast:self.view message:@"两次输入的密码不一样"];
        return;
    }
    [self anotherToast:self.view message:@"注册中..."];
    [UKUserDefaults setObject:self.passwordField.text forKey:self.userNameField.text];
    [UKUserDefaults synchronize];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self anotherHideToast:self.view];
        [self showToast:self.view message:@"恭喜您，注册成功！"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (self.successBlock) {
                self.successBlock(userName, userPwd);
            }
            [self.navigationController popViewControllerAnimated:YES];
        });
    });
}


@end
