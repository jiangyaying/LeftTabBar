//
//  MainViewController.m
//  NewEmptyObject
//
//  Created by Mac on 2018/4/10.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
@interface MainViewController ()

@property (nonatomic, strong) HomeViewController *home;

@end

@implementation MainViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
   
    // Do any additional setup after loading the view.
}

- (void)launchFirstController{
    //有几个tabbar就创建几个文件夹,比如首页,商城,我的,要英文对应,都继承自NewEmptyBaseViewController
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:[[HomeViewController alloc] init]];
    _APP.window.rootViewController = homeNav;
    [_APP.window makeKeyAndVisible];
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
