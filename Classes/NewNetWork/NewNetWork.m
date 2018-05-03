//
//  NewNetWork.m
//  NewEmptyObject
//
//  Created by Mac on 2018/4/10.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "NewNetWork.h"

@implementation NewNetWork
static NewNetWork *shareModule = nil;
+(NewNetWork *)shareNetWork{
    if (!shareModule) {
        shareModule = [[NewNetWork alloc] init];
    }
    return  shareModule;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:baseUrl]];
        self.manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        self.manager.requestSerializer.timeoutInterval = 8;
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/javascript", @"text/html", @"text/plain", @"text/json", nil];
    }
    return self;
}

- (void)getDataWithPath:(NSString *)path parameters:(NSDictionary *)parameters success:(void (^)(id))successBlock failure:(void (^)(NSError *))failureBlock{
    [self.manager GET:path parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSInteger statusCode = [(NSHTTPURLResponse *)task.response statusCode];
        NSString *errorCode = [error.userInfo objectForKey:@"NSLocalizedDescription"];
        if (!NULLString(errorCode)) {
            [[WrappedHUDHelper sharedHelper] showHUDOnFrontWithTitle:errorCode for:2];
        }
        else{
            if (statusCode == 500) {
                [[WrappedHUDHelper sharedHelper] showHUDOnFrontWithTitle:@"请求失败,请稍后再试" for:2];
            }
            else if (statusCode == 404){
                [[WrappedHUDHelper sharedHelper] showHUDOnFrontWithTitle:@"连接网络失败" for:2];
            }
            else{
                [[WrappedHUDHelper sharedHelper] showHUDOnFrontWithTitle:@"网络异常" for:2];
            }
        }
    }];
}

- (void)postDataWithPath:(NSString *)path parameters:(NSDictionary *)parameters success:(void (^)(id))successBlock failure:(void (^)(NSError *))failureBlock{
    [self.manager POST:path parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSInteger statusCode = [(NSHTTPURLResponse *)task.response statusCode];
        NSString *errorCode = [error.userInfo objectForKey:@"NSLocalizedDescription"];
        if (!NULLString(errorCode)) {
            [[WrappedHUDHelper sharedHelper] showHUDOnFrontWithTitle:errorCode for:2];
        }
        else{
            if (statusCode == 500) {
                [[WrappedHUDHelper sharedHelper] showHUDOnFrontWithTitle:@"请求失败,请稍后再试" for:2];
            }
            else if (statusCode == 404){
                [[WrappedHUDHelper sharedHelper] showHUDOnFrontWithTitle:@"连接网络失败" for:2];
            }
            else{
                [[WrappedHUDHelper sharedHelper] showHUDOnFrontWithTitle:@"网络异常" for:2];
            }
        }
    }];
}

@end
