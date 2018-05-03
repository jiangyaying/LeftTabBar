//
//  NextViewController.m
//  LeftTabBar
//
//  Created by Mac on 2018/5/2.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "NextViewController.h"
#import "SecondNextViewController.h"
@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view.
}

- (void)click:(UIButton *)button{
    SecondNextViewController *next = [[SecondNextViewController alloc] init];
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
