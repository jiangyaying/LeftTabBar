//
//  UIView+convenience.h
//
//  Created by chicp on 13-12-16.
//  Copyright (c) 2013年 Alibaba. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    LinePositionTop = 0x01,
    LinePositionBottom = 0x02,
}LinePosition;

@interface UIView (convenience)

@property (nonatomic) CGPoint frameOrigin;
@property (nonatomic) CGSize frameSize;

@property (nonatomic) CGFloat frameX;
@property (nonatomic) CGFloat frameY;

@property (nonatomic) CGFloat frameRight;
@property (nonatomic) CGFloat frameBottom;

@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;

@property (strong, nonatomic) UIView *topSeparatorLine;
@property (strong, nonatomic) UIView *bottomSeparatorLine;

- (BOOL)containsSubView:(UIView *)subView;
- (BOOL)containsSubViewWithClass:(Class)aClass;
- (UIViewController *)findFirstViewController;

- (void)addSeparatorLineWithPostion:(LinePosition)position
                              color:(UIColor *)color;
- (void)addSeparatorLineWithLeftMargin:(float)leftMargin
                           rightMargin:(float)rightMargin
                                 color:(UIColor *)color
                              position:(LinePosition)position;

- (void)addSeparatorLineWithLeftMargin:(float)leftMargin
                           rightMargin:(float)rightMargin
                               yMargin:(float)yMargin
                                 color:(UIColor *)color;

/**
 *  添加获取数据失败的提示界面
 *
 *  @param msg 提示信息
 */
//- (void)addGetDataFailAlertViewWithErrorMsg:(NSString *)msg;
//
//- (void)addGetDataFailAlertViewWithErrorMsg:(NSString *)msg
//                                  withColor:(UIColor *)color
//                                  withInset:(CGFloat)inset;

/**
 *  移除提示界面
 */
- (void)removeAlertView;

- (UIView *)findFirstResponder;
- (UITableViewCell *)findTableViewCell;

@end
