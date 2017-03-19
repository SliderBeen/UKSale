//
//  ALToastView.h
//  Toast
//
//  Created by LiuLian on 12-12-19.
//  Copyright (c) 2012年 LiuLian. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface ALToastView : UIView
{
    @private
    
    UILabel *_textLabel;
}

+ (void)toastInView:(UIView *)parentView withText:(NSString *)text;

@end
