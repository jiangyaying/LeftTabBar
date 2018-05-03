//
//  WrappedHudHelper.m
//  YunPan for iOS
//
//  Created by kyo on 12-10-20.
//
//

#import "WrappedHudHelper.h"
#import "MBProgressHUD.h"

@interface WrappedHUDHelper()

@property (nonatomic, strong) MBProgressHUD *theHUD;

@end

@implementation WrappedHUDHelper

@synthesize theHUD = _theHUD;

+ (WrappedHUDHelper *)sharedHelper
{
    static WrappedHUDHelper *_sharedHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedHelper = [[WrappedHUDHelper alloc] init];
    });
    
    return _sharedHelper;
}

- (void)showHUDInView:(UIView *)superView withTitle:(NSString *)title;
{
    [self hideHUD];    
    _theHUD = [MBProgressHUD showHUDAddedTo:superView animated:YES];
    _theHUD.label.text = title;
}


- (void)showHUDInView:(UIView *)superView withTitle:(NSString *)title forTime:(NSUInteger)seconds
{
    [self hideHUD];
    
    _theHUD = [MBProgressHUD showHUDAddedTo:superView animated:YES];
    _theHUD.label.text = title;
    
    int64_t delayInSeconds = seconds;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self hideHUD];
    });
}

- (void)showHUDWithoutIndicatorInView:(UIView *)superView withTitle:(NSString *)title for:(NSUInteger)seconds
{
    [self showHUDWithoutIndicatorInView:superView withTitle:title detailTitle:nil for:seconds blockUI:YES];
}

- (void)showHUDWithoutIndicatorInView:(UIView *)superView withTitle:(NSString *)title for:(NSUInteger)seconds blockUI:(BOOL)blockUI
{
    [self showHUDWithoutIndicatorInView:superView withTitle:title detailTitle:nil for:seconds blockUI:blockUI];
}

- (void)showHUDWithoutIndicatorInView:(UIView *)superView withTitle:(NSString *)title detailTitle:(NSString *)detailTitle for:(NSUInteger)seconds
{
    [self showHUDWithoutIndicatorInView:superView withTitle:title detailTitle:detailTitle for:seconds blockUI:YES];
}

- (void)showHUDWithoutIndicatorInView:(UIView *)superView withTitle:(NSString *)title detailTitle:(NSString *)detailTitle for:(NSUInteger)seconds blockUI:(BOOL)blockUI
{
    [self hideHUD];
    
    _theHUD = [MBProgressHUD showHUDAddedTo:superView animated:YES];
    _theHUD.label.text = title;
    _theHUD.detailsLabel.text = detailTitle;
    _theHUD.mode = MBProgressHUDModeText;
    
    if (!blockUI)
        _theHUD.userInteractionEnabled = NO;

    int64_t delayInSeconds = seconds;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self hideHUD];
    });
}

- (void)endCurrentHUDWithSuccessTitle:(NSString *)title for:(NSUInteger)seconds
{
    if (_theHUD) {
        _theHUD.mode = MBProgressHUDModeCustomView;
        _theHUD.label.text = title;
        _theHUD.userInteractionEnabled = NO;
        
        int64_t delayInSeconds = seconds;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self hideHUD];
        });
    }
}

- (void)endCurrentHUDWithWarningTitle:(NSString *)title for:(NSUInteger)seconds
{
    if (_theHUD) {
        _theHUD.mode = MBProgressHUDModeCustomView;
        _theHUD.label.text = title;
        _theHUD.userInteractionEnabled = NO;
        
        int64_t delayInSeconds = seconds;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self hideHUD];
        });
    }
}

- (void)hideHUD
{
    if (_theHUD) {
        [_theHUD hideAnimated:YES];
        _theHUD = nil;
    }
}

- (void)showHUDOnFrontWithTitle:(NSString *)title
{
    [self showHUDOnFrontWithTitle:title blockUI:YES];
}

- (void)showHUDOnFrontWithTitle:(NSString *)title blockUI:(BOOL)blockUI
{
    [self hideHUD];
    
    UIView *frontView = [self findFromWindow];
    _theHUD = [MBProgressHUD showHUDAddedTo:frontView animated:YES];
    _theHUD.label.text = title;
    if (!blockUI)
        _theHUD.userInteractionEnabled = NO;
}

- (void)showHUDOnFrontWithTitle:(NSString *)title for:(NSUInteger)seconds
{
    [self showHUDOnFrontWithTitle:title for:seconds blockUI:YES];
}

- (void)showHUDOnFrontWithTitle:(NSString *)title for:(NSUInteger)seconds blockUI:(BOOL)blockUI
{
    [self hideHUD];
    
    UIView *frontView = [self findFromWindow];
    _theHUD = [MBProgressHUD showHUDAddedTo:frontView animated:YES];
    _theHUD.label.text = title;
    _theHUD.mode = MBProgressHUDModeText;

    // If blockUI == NO, disable HUD's user interaction, so user input will simply go through it.
    // Which results non-block HUD
    if (!blockUI)
        _theHUD.userInteractionEnabled = NO;
    
    int64_t delayInSeconds = seconds;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self hideHUD];
    });
}

- (void)showHUDOnFrontWithSuccessTitle:(NSString *)title for:(NSUInteger)seconds
{
    [self showHUDOnFrontWithSuccessTitle:title for:seconds blockUI:YES];
}

- (void)showHUDOnFrontWithSuccessTitle:(NSString *)title for:(NSUInteger)seconds blockUI:(BOOL)blockUI
{
    [self hideHUD];
    
    UIView *frontView = [self findFromWindow];
    _theHUD = [MBProgressHUD showHUDAddedTo:frontView animated:YES];
    _theHUD.mode = MBProgressHUDModeCustomView;
    _theHUD.label.text = title;
    
    if (!blockUI)
        _theHUD.userInteractionEnabled = NO;
    
    int64_t delayInSeconds = seconds;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self hideHUD];
    });
}

- (UIView *)findFromWindow
{
    return [UIApplication sharedApplication].keyWindow;
}

- (BOOL)isShow {
    BOOL isShow = NO;
    if (self.theHUD.alpha == 1.f) {
        return isShow = YES;
    }
    return isShow;
}

@end
