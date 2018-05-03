//
//  JHAdaptor.h
//  JHBaseProject
//
//  Created by 流痕 on 16/3/4.
//  Copyright © 2016年 FLZC. All rights reserved.
// 屏幕适配 按机型比例

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define iPhone4  ([UIScreen mainScreen].bounds.size.height == 480)
#define iPhone5  ([UIScreen mainScreen].bounds.size.height == 568)
#define iPhone6  ([UIScreen mainScreen].bounds.size.height == 667)
#define iPhone6Plus  ([UIScreen mainScreen].bounds.size.height == 736)
#define iphoneX ([UIScreen mainScreen].bounds.size.height == 812)

@interface JHAdaptor : NSObject
+ (CGFloat)adaptLength:(CGFloat)length;

+ (CGFloat)adaptFontSize:(CGFloat)fontSize;

+ (CGFloat)defineTopHeight;
@end

/**
 *  
 https://github.com/LFL2018/ScreenAdaptation-Rapid
 */

