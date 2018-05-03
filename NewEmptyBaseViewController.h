//
//  NewEmptyBaseViewController.h
//  NewEmptyObject
//
//  Created by Mac on 2018/4/10.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#define CSbackAction @"CSbackAction"
@interface NewEmptyBaseViewController : UIViewController

@property (nonatomic, strong) UIViewController *currentVc;
@property (nonatomic, strong) UIButton *baseBackbutton;

- (void)customBackButton;
- (void)backClick:(UIButton *)buttton;
//  切换各个标签内容
- (void)replaceController:(UIViewController *)oldController newController:(UIViewController *)newController;
@end
