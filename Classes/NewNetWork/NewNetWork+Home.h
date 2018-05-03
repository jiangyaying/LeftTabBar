//
//  NewNetWork+Home.h
//  NewEmptyObject
//
//  Created by Mac on 2018/4/10.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "NewNetWork.h"

@interface NewNetWork (Home)

/**
 工作好友列表
 
 @param examine 是否通过（1为未通过的，2为已通过的，3为拒绝添加的）
 @param keyWord 关键词
 @param success 成功回调方法
 @param failure 失败回调方法
 */
- (void)workFriendListWithFriendExamine:(NSString *)examine
                            withKeyWord:(NSString *)keyWord
                           successBlock:(void(^)(id responseObject))success
                                failure:(void(^)(NSError *error))failure;

@end
