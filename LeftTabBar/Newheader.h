//
//  Newheader.h
//  NewEmptyObject
//
//  Created by Mac on 2018/4/10.
//  Copyright © 2018年 Mac. All rights reserved.
//

#ifndef Newheader_h
#define Newheader_h
#define baseUrl @""
//判空
#define NULLString(string) ((![string isKindOfClass:[NSString class]])||[string isEqualToString:@""] || (string == nil) || [string isEqualToString:@""] || [string isKindOfClass:[NSNull class]]||[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0)

// 界面宽高
#define MainHeight [UIScreen mainScreen].bounds.size.height
#define MainWidth  [UIScreen mainScreen].bounds.size.width

#define kAdaptor(length) [JHAdaptor adaptLength:(length)]

#define KAdaptorFontSize(size) [JHAdaptor adaptFontSize:(size)]

#define KFontSize(size)  [UIFont systemFontOfSize:KAdaptorFontSize(size)]

#define KFontBlodSize(size)  [UIFont boldSystemFontOfSize:KAdaptorFontSize(size)]

//通讯
#define _MNet ((NewNetWork *)[NewNetWork shareNetWork])
#define _MUser ((NewUserManager *)[NewUserManager shareUserManager])
#define _APP ((AppDelegate *)[UIApplication sharedApplication].delegate)

// 封装颜色
#define HEXCOLOR(hexValue) [UIColor colorWithRed:((CGFloat)((hexValue & 0xFF0000) >> 16))/255.0 green:((CGFloat)((hexValue & 0xFF00) >> 8))/255.0 blue:((CGFloat)(hexValue & 0xFF))/255.0 alpha:1.0]
#define HEXACOLOR(hexValue, alphaValue) [UIColor colorWithRed:((CGFloat)((hexValue & 0xFF0000) >> 16))/255.0 green:((CGFloat)((hexValue & 0xFF00) >> 8))/255.0 blue:((CGFloat)(hexValue & 0xFF))/255.0 alpha:(alphaValue)]

// 是否是iOS 6或者更高版本
#define IS_IOS6_OR_HIGHER       SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0")
// 是否是iOS 7或者更高版本
#define IS_IOS7_OR_HIGHER       SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")
// 是否是iOS 8或者更高版本
#define IS_IOS8_OR_HIGHER       SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")

#define IS_IOS10_OR_HIGHER       SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.0")

#define IS_IOS11_OR_HIGHER   SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"11.0")

// 系统
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#endif /* Newheader_h */
