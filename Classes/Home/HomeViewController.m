//
//  HomeViewController.m
//  NewEmptyObject
//
//  Created by Mac on 2018/4/10.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "HomeViewController.h"
#import "CustomLeftView.h"
#import "TestViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
@interface HomeViewController ()
@property (nonatomic, strong) CustomLeftView *tabView;
@property (nonatomic, strong) NSArray *dataArr;

@property (nonatomic, strong) FirstViewController *first;
@property (nonatomic, strong) SecondViewController *second;
@property (nonatomic, strong) ThirdViewController *third;
@property (nonatomic, strong) FourViewController *four;
@property (nonatomic, strong) TestViewController *five;
@end

@implementation HomeViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserverForName:CSbackAction object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            self.baseBackbutton.hidden = NO;
        }];
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)selectWithIndex:(NSInteger)index{
    if ((self.currentVc == _first && index == 0) || (self.currentVc == _second && index == 1) || (self.currentVc == _third && index == 2) || (self.currentVc == _four && index == 3) ||(self.currentVc == _five && index == 4)) {
        return;
    } else {
        switch (index) {
            case 0:
            {
                [self replaceController:self.currentVc newController:_first];
            }
                break;
            case 1:{
                [self replaceController:self.currentVc newController:_second];
            }
                break;
            case 2:{
                [self replaceController:self.currentVc newController:_third];
            }
                break;
            case 3:{
                [self replaceController:self.currentVc newController:_four];
            }
                break;
            case 4:{
                [self replaceController:self.currentVc newController:_five];
            }
                break;
            default:
                break;
        }
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSub];
    // Do any additional setup after loading the view.
}

- (void)addSub{
    _dataArr = @[@{@"image" : @"商城", @"select" : @"商城选中", @"name": @"首页"},
                 @{@"image" : @"商城", @"select" : @"商城选中",@"name": @"创建"},
                 @{@"image" : @"商城", @"select" : @"商城选中",@"name": @"查找"},
                 @{@"image" : @"商城", @"select" : @"商城选中",@"name": @"设置"},
                 @{@"image" : @"商城", @"select" : @"商城选中",@"name": @"退出"}];
    _tabView = [[CustomLeftView alloc] initWithFrame:CGRectMake(0, 0, kAdaptor(80), MainHeight)];
    _tabView.backgroundColor = HEXCOLOR(0xecebf0);
    _tabView.array = _dataArr;
    _tabView.selectIndex = 2;
    __weak __typeof(self) WeakSelf = self;
    _tabView.selectIndexBlock = ^(NSInteger index) {
        //点击哪个对应哪个按钮
        [WeakSelf selectWithIndex:index];
    };
    [self.view addSubview:_tabView];
    
    FirstViewController * first = [[FirstViewController alloc] init];
    _first = first;
    first.view.frame = CGRectMake(kAdaptor(80), 64,MainWidth - kAdaptor(80), MainHeight);
//    [self addChildViewController:self.first];
//    [self.view addSubview:self.first.view];
    
    SecondViewController *second = [[SecondViewController alloc] init];
    _second = second;
    second.view.frame = CGRectMake(kAdaptor(80), 64,MainWidth - kAdaptor(80), MainHeight);
//    [self addChildViewController:self.second];
//    [self.view addSubview:self.second.view];
    
    ThirdViewController *third = [[ThirdViewController alloc] init];
    _third = third;
    third.view.frame = CGRectMake(kAdaptor(80), 64,MainWidth - kAdaptor(80), MainHeight);
    [self addChildViewController:self.third];
    [self.view addSubview:self.third.view];
    
    FourViewController *four = [[FourViewController alloc] init];
    _four = four;
    four.view.frame = CGRectMake(kAdaptor(80), 64,MainWidth - kAdaptor(80), MainHeight);
//    [self addChildViewController:self.four];
//    [self.view addSubview:self.four.view];
    
    TestViewController *five = [[TestViewController alloc] init];
    _five = five;
    five.view.frame = CGRectMake(kAdaptor(80), 64,MainWidth - kAdaptor(80), MainHeight);
//    [self addChildViewController:self.five];
//    [self.view addSubview:self.five.view];
    
    self.currentVc = _third;
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
