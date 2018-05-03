//
//  SecondViewController.m
//  LeftTabBar
//
//  Created by Mac on 2018/5/2.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "SecondViewController.h"
#import "NextViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view.
}

- (void)click:(UIButton *)button{
    NextViewController *next = [[NextViewController alloc] init];
    next.view.frame = self.view.bounds;
    [self replaceController:self newController:next];
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
