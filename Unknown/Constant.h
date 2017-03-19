//
//  Constant.h
//  Unknown
//
//  Created by 荣刚 on 17/3/19.
//  Copyright © 2017年 荣刚. All rights reserved.
//

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UKUserDefaults [NSUserDefaults standardUserDefaults]

#define kAlmostZero         0.0000001
#define kGAP 10
#define kThemeColor [UIColor colorWithRed:0 green:(190 / 255.0) blue:(12 / 255.0) alpha:1]
#define kAvatar_Size 40

#define kTabBarHeight       49
#define kNavbarHeight       64
/******************************************************************
 屏幕的宽度与高度
 *****************************************************************/
#define kScreenWidth    [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight   [[UIScreen mainScreen] bounds].size.height

// 判断一个数组是否合法
#define IsValidateArr(arr) ((arr && [arr isKindOfClass:[NSArray class]] && arr.count > 0))

// 判断从后台服务器获取的result是否合法
#define IsValidateResult(result) ((nil != result && [result isKindOfClass:[NSDictionary class]] && [[result objectForKey:@"result"] isEqualToString:REQUEST_SUCCESSFULLY]))

// 判断一个字典是否合法
#define IsValidateDic(dic) (nil != dic && [dic isKindOfClass:[NSDictionary class]] && dic.count > 0)

// 判断一个NSString是否合法
#define IsValidateString(str) ((nil != str) && ([str isKindOfClass:[NSString class]]) && (str.length > 0) && (![str isEqualToString:@"(null)"]) && ((NSNull *) str != [NSNull null]) && (![str isEqualToString:@"<null>"]))
