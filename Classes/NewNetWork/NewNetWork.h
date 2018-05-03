//
//  NewNetWork.h
//  NewEmptyObject
//
//  Created by Mac on 2018/4/10.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
@interface NewNetWork : NSObject

@property (nonatomic, strong) AFHTTPSessionManager *manager;

+ (NewNetWork *)shareNetWork;

//get
- (void)getDataWithPath:(NSString *)path
             parameters:(NSDictionary *)parameters
                success:(void(^)(id responseObject))successBlock
                failure:(void(^)(NSError *error))failureBlock;
//post
- (void)postDataWithPath:(NSString *)path
              parameters:(NSDictionary *)parameters
                 success:(void(^)(id responseObject))successBlock
                 failure:(void(^)(NSError *error))failureBlock;
@end
