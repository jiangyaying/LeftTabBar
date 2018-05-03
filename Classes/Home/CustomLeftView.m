//
//  CustomLeftView.m
//  NewEmptyObject
//
//  Created by Mac on 2018/4/13.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "CustomLeftView.h"
@interface CustomLeftView()

@property (nonatomic, strong) UIScrollView *tabView;

@end
@implementation CustomLeftView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubUI];
    }
    return self;
}

- (void)setSelectIndex:(NSInteger)selectIndex{
    _selectIndex = selectIndex;
    UIButton *button = [_tabView viewWithTag:selectIndex + 10];
    [self buttonClick:button];
}

- (void)setArray:(NSArray *)array{
    _array = array;
    for (NSInteger i = 0; i < _array.count; i++) {
        NSDictionary *data = [_array objectAtIndex:i];
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, i * kAdaptor(80), kAdaptor(80), kAdaptor(80))];
        button.tag = i + 10;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_tabView addSubview:button];
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake((button.frame.size.width / 2) - kAdaptor(10), kAdaptor(10), kAdaptor(20), kAdaptor(20))];
        img.tag = 3;
        img.image = [UIImage imageNamed:[data objectForKey:@"image"]];
        img.highlightedImage = [UIImage imageNamed:[data objectForKey:@"select"]];
        [button addSubview:img];
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(img.frame), button.frame.size.width, kAdaptor(30))];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.textColor = [UIColor blackColor];
        nameLabel.tag = 2;
        nameLabel.text = [data objectForKey:@"name"];
        nameLabel.font = [UIFont systemFontOfSize:14];
        [button addSubview:nameLabel];
    }
}

- (void)addSubUI{
    _tabView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kAdaptor(80), MainHeight)];
    _tabView.backgroundColor = HEXCOLOR(0xecebf0);
    [self addSubview:_tabView];
}

- (void)buttonClick:(UIButton *)button{
    for (NSInteger i = 0; i < _array.count; i++) {
        UIButton *but = [_tabView viewWithTag:i + 10];
        if (but == button) {
            but.selected = YES;
        } else {
            but.selected = NO;
        }
        UILabel *nameLabel = [but viewWithTag:2];
        UIImageView *img = [but viewWithTag:3];
        if (but.selected) {
            nameLabel.textColor = [UIColor blueColor];
            img.highlighted = YES;
        } else {
            nameLabel.textColor = [UIColor blackColor];
            img.highlighted = NO;
        }
    }
    self.selectIndexBlock ? self.selectIndexBlock(button.tag - 10):nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
