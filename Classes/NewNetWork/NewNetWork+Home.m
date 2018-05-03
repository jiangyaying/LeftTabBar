//
//  NewNetWork+Home.m
//  NewEmptyObject
//
//  Created by Mac on 2018/4/10.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "NewNetWork+Home.h"

@implementation NewNetWork (Home)

#pragma mark  工作好友列表
- (void)workFriendListWithFriendExamine:(NSString *)examine withKeyWord:(NSString *)keyWord successBlock:(void (^)(id))success failure:(void (^)(NSError *))failure{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:10];
    [parameters setObject:examine forKey:@"friend_examine"];
    [parameters setObject:keyWord forKey:@"keyword"];
    [self postDataWithPath:@"api_1/friend/list" parameters:parameters success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error)
     {
         failure(error);
     }];
}

@end
