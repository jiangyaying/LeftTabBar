//
//  NewUserManager.m
//  NewEmptyObject
//
//  Created by Mac on 2018/4/10.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "NewUserManager.h"

@implementation NewUserManager
static NewUserManager *userManager = nil;
+ (NewUserManager *)shareUserManager{
    if (!userManager) {
        userManager = [[NewUserManager alloc] init];
    }
    return userManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        //这个类是处理请求到的登录后的用户数据
    }
    return self;
}

@end
