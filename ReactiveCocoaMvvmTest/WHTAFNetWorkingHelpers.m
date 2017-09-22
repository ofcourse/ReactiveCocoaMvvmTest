//
//  WHTAFNetWorkingHelpers.m
//  Pods
//
//  Created by hsg on 2017/8/18.
//
//

#import "WHTAFNetWorkingHelpers.h"
#import <AFNetworking/AFNetworking.h>

@implementation WHTAFNetWorkingHelpers

#pragma mark -get
// [AFHTTPSessionManager manager] 内存泄露,用单例解决
//http://www.cnblogs.com/Jenaral/p/6145796.html
//http://blog.csdn.net/wangkexu1986/article/details/51718707

+ (AFHTTPSessionManager *)shareManager {
    static dispatch_once_t onceToken;
    static AFHTTPSessionManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
    });
    return manager;
}

+ (NSURLSessionDataTask *)GET:(NSString *)url timeoutInterval:(NSTimeInterval)timeoutInterval success:(WHTSuccessResponseBlock) success failure:(WHTFailureResponseBlock)failure
{
    NSParameterAssert(url != nil);
    AFHTTPSessionManager *manager = [self shareManager];
    manager.requestSerializer=[AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:timeoutInterval];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(success)
        {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(failure)
        {
            failure(error);
        }
    }];
}

+ (NSURLSessionDataTask *)GET:(NSString *)url success:(WHTSuccessResponseBlock)success failure:(WHTFailureResponseBlock)failure
{
    return [self GET:url timeoutInterval:[[WHTRequest new].timeoutInterval doubleValue] success:success failure:failure ];
}

+ (NSURLSessionDataTask *)GETWithRequest:(WHTRequest *)request success:(WHTSuccessResponseBlock)success failure:(WHTFailureResponseBlock)failure
{
    return [self GET:request.url timeoutInterval:[request.timeoutInterval doubleValue]  success:success failure:failure ];
}

#pragma mark -post

+ (NSURLSessionDataTask *)POST:(NSString *)url  content:(NSDictionary *)content success:(WHTSuccessResponseBlock)success failure:(WHTFailureResponseBlock)failure
{
    return [self POST:url content:content timeoutInterval:[[WHTRequest new].timeoutInterval doubleValue] success:success failure:failure];
}

+ (NSURLSessionDataTask *)POST:(NSString *)url  content:(NSDictionary *)content timeoutInterval:(NSTimeInterval)timeout  success:(WHTSuccessResponseBlock)success failure:(WHTFailureResponseBlock)failure
{
    NSParameterAssert(url != nil);
    NSParameterAssert(content != nil);

    AFHTTPSessionManager *manager = [self shareManager];
    manager.requestSerializer=[AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:timeout];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return [manager POST:url parameters:content progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(success)
        {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(failure)
        {
            failure(error);
        }
    }];
}

+ (NSURLSessionDataTask *)POST:(WHTRequest *)request success:(WHTSuccessResponseBlock)success failure:(WHTFailureResponseBlock) failure
{
   return [self POST:request.url content:request.contents  timeoutInterval:[request.timeoutInterval doubleValue] success:success failure:failure ];
}

@end
