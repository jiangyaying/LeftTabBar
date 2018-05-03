//
//  WrappedHudHelper.h
//  YunPan for iOS
//
//  Created by kyo on 12-10-20.
//
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

#define ShowHUD(view, title)  \
[[WrappedHUDHelper sharedHelper] showHUDInView:view withTitle:title];

#define HideHUD \
[[WrappedHUDHelper sharedHelper] hideHUD];

@interface WrappedHUDHelper : NSObject

+ (WrappedHUDHelper *)sharedHelper;

- (void)showHUDInView:(UIView *)superView withTitle:(NSString *)title;
- (void)showHUDInView:(UIView *)superView withTitle:(NSString *)title forTime:(NSUInteger)seconds;
- (void)showHUDWithoutIndicatorInView:(UIView *)superView withTitle:(NSString *)title for:(NSUInteger)seconds;
- (void)showHUDWithoutIndicatorInView:(UIView *)superView withTitle:(NSString *)title for:(NSUInteger)seconds blockUI:(BOOL)blockUI;
- (void)showHUDWithoutIndicatorInView:(UIView *)superView withTitle:(NSString *)title detailTitle:(NSString *)detailTitle for:(NSUInteger)seconds;
- (void)showHUDWithoutIndicatorInView:(UIView *)superView withTitle:(NSString *)title detailTitle:(NSString *)detailTitle for:(NSUInteger)seconds blockUI:(BOOL)blockUI;
- (void)endCurrentHUDWithWarningTitle:(NSString *)title for:(NSUInteger)seconds;
- (void)endCurrentHUDWithSuccessTitle:(NSString *)title for:(NSUInteger)seconds;
- (void)hideHUD;

- (void)showHUDOnFrontWithTitle:(NSString *)title;
- (void)showHUDOnFrontWithTitle:(NSString *)title blockUI:(BOOL)blockUI;
- (void)showHUDOnFrontWithTitle:(NSString *)title for:(NSUInteger)seconds;
- (void)showHUDOnFrontWithTitle:(NSString *)title for:(NSUInteger)seconds blockUI:(BOOL)blockUI;
- (void)showHUDOnFrontWithSuccessTitle:(NSString *)title for:(NSUInteger)seconds;
- (void)showHUDOnFrontWithSuccessTitle:(NSString *)title for:(NSUInteger)seconds blockUI:(BOOL)blockUI;

@end
