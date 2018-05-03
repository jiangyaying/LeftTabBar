//
//  JHAdaptor.m
//  JHBaseProject
//
//  Created by 流痕 on 16/3/4.
//  Copyright © 2016年 FLZC. All rights reserved.
//

#import "JHAdaptor.h"

/**
 pd: 1.17, 1.10
 */

//设置屏幕适配的比例
#define minScale  1.172   //1.171875
#define maxScale 1.104          //1.10344828
#define newScale 1.217  //1.2173913043

@implementation JHAdaptor


+ (CGFloat)adaptLength:(CGFloat)length{
    
    if (iPhone5) {
        return floorf(length / minScale);
    }else if (iPhone6Plus) {
//        NSLog(@"%f", floorf(length*maxScale));
        return floorf(length * maxScale);
    }
//    else if (iphoneX){
//        return floor(length * newScale);
//    }
    return length; // 默认 iPhone6
}

// 适配字体 可以根据实际需求 *n
+ (CGFloat)adaptFontSize:(CGFloat)fontSize{
    if (iPhone5) {
        return floorf(fontSize / minScale);
    }else if (iPhone6Plus) {
        return floorf(fontSize * maxScale);
    }
    return fontSize; // 默认 iPhone6
}

+ (CGFloat)defineTopHeight{
    CGFloat topHeight = 0;
    if (iphoneX) {
        topHeight = 24;
    }
    return topHeight;
}

@end
