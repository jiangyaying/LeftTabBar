//
//  NewEmptyBaseViewController.m
//  NewEmptyObject
//
//  Created by Mac on 2018/4/10.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "NewEmptyBaseViewController.h"
#import "HomeViewController.h"
@interface NewEmptyBaseViewController ()<UINavigationControllerDelegate>

@end

@implementation NewEmptyBaseViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)loadView{
    [super loadView];
    self.view.opaque = NO;
    self.view.backgroundColor = HEXCOLOR(0xffffff);
}

//  切换各个标签内容
- (void)replaceController:(UIViewController *)oldController newController:(UIViewController *)newController
{
    /**
     *            着重介绍一下它
     *  transitionFromViewController:toViewController:duration:options:animations:completion:
     *  fromViewController      当前显示在父视图控制器中的子视图控制器
     *  toViewController        将要显示的姿势图控制器
     *  duration                动画时间(这个属性,old friend 了 O(∩_∩)O)
     *  options                 动画效果(渐变,从下往上等等,具体查看API)
     *  animations              转换过程中得动画
     *  completion              转换完成
     */
    if ([newController.parentViewController isKindOfClass:[HomeViewController class]] || [newController isKindOfClass:[FirstViewController class]] || [newController isKindOfClass:[SecondViewController class]] || [newController isKindOfClass:[ThirdViewController class]] || [newController isKindOfClass:[TestViewController class]] || [newController isKindOfClass:[FourViewController class]]) {
        [self addChildViewController:newController];
        [self transitionFromViewController:oldController toViewController:newController duration:0 options:UIViewAnimationOptionTransitionNone animations:^{
        } completion:^(BOOL finished) {
            [self.view addSubview:newController.view];
            if (finished) {
                self.currentVc = newController;
            }else{
                self.currentVc = oldController;
            }
        }];
    } else {
        [[NSNotificationCenter defaultCenter] postNotificationName:CSbackAction object:nil];
        //为了确保点击切换的newcontroller的parent跟oldController的parent一致,而且点击返回能返回到上一层
        if ([oldController.parentViewController isKindOfClass:[HomeViewController class]]) {
            [oldController addChildViewController:newController];
            [oldController.view addSubview:newController.view];
        } else {
            [oldController.parentViewController addChildViewController:newController];
            [oldController.parentViewController.view addSubview:newController.view];
        }
    }
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self customBackButton];
    // Do any additional setup after loading the view.
}

- (void)customBackButton
{
    _baseBackbutton = [[UIButton alloc] initWithFrame:CGRectMake(90, 10, 60, 20)];
    [_baseBackbutton setTitle:@"返回" forState:UIControlStateNormal];
    [_baseBackbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _baseBackbutton.titleLabel.font = KFontSize(17);
    _baseBackbutton.hidden = YES;
    [_baseBackbutton addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:_baseBackbutton];
}

- (void)backClick:(UIButton *)buttton{
    if ([self.childViewControllers lastObject].childViewControllers.count > 0) {
        [[[self.childViewControllers lastObject].childViewControllers lastObject].view removeFromSuperview];
        [[[self.childViewControllers lastObject].childViewControllers lastObject] willMoveToParentViewController:nil];
        [[[self.childViewControllers lastObject].childViewControllers lastObject] removeFromParentViewController];
    } else {
        if ([[self.childViewControllers lastObject] isKindOfClass:[FirstViewController class]] || [[self.childViewControllers lastObject] isKindOfClass:[SecondViewController class]] || [[self.childViewControllers lastObject] isKindOfClass:[ThirdViewController class]] || [[self.childViewControllers lastObject] isKindOfClass:[FourViewController class]] || [[self.childViewControllers lastObject] isKindOfClass:[TestViewController class]]) {
            return;
        } else {
            [[self.childViewControllers lastObject].view removeFromSuperview];
            [[self.childViewControllers lastObject] willMoveToParentViewController:nil];
            [[self.childViewControllers lastObject] removeFromParentViewController];
        }
    }
    if ([self.childViewControllers lastObject].childViewControllers.count > 0) {
         [[NSNotificationCenter defaultCenter] postNotificationName:CSbackAction object:nil];
    } else {
        self.baseBackbutton.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
