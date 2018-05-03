//
//  CustomLeftView.h
//  NewEmptyObject
//
//  Created by Mac on 2018/4/13.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomLeftView : UIView

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, copy) void(^selectIndexBlock)(NSInteger index);
@property (nonatomic, assign) NSInteger selectIndex;

@end
