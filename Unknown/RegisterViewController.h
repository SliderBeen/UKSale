//
//  RegisterViewController.h
//  Unknown
//
//  Created by 荣刚 on 17/3/19.
//  Copyright © 2017年 荣刚. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^RegisterSuccessBlock)(NSString *userName, NSString *password);

@interface RegisterViewController : BaseViewController

@property (nonatomic, copy) RegisterSuccessBlock successBlock;

@end
