//
//  WHTAFNetWorkingHelpers.m
//  Pods
//
//  Created by hsg on 2017/9/20.
//
//

#import "WHTNetWorkingHelpers.h"
#import <AFNetworking/AFNetworking.h>

@implementation WHTNetWorkingHelpers

#pragma mark -get
// [AFHTTPSessionManager manager] 内存泄露,用单例解决
//http://www.cnblogs.com/Jenaral/p/6145796.html
//http://blog.csdn.net/wangkexu1986/article/details/51718707

+ (AFHTTPSessionManager *)shareManager {
    static dispatch_once_t onceToken;
    static AFHTTPSessionManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        [manager.operationQueue setMaxConcurrentOperationCount:3];//equal to [NSURLSessionConfiguration defaultSessionConfiguration].HTTPMaximumConnectionsPerHost
        //最大并发数不要乱写（5以内），不要开太多，一般以2~3为宜，因为虽然任务是在子线程进行处理的，但是cpu处理这些过多的子线程可能会影响UI，让UI变卡
        //iOS开发多线程篇—NSOperation基本操作 http://www.cnblogs.com/wendingding/p/3809150.html
        manager.requestSerializer=[AFHTTPRequestSerializer serializer];
        [manager.requestSerializer setTimeoutInterval:[WHTRequest new].timeoutInterval.doubleValue];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    });
    return manager;
}

#pragma mark - get default sessionManager

+ (NSURLSessionDataTask *)GET:(NSString *)url success:(WHTSuccessResponseBlock)successBlock failure:(WHTFailureResponseBlock)failureBlock
{
    return [self GET:url timeoutInterval:[[WHTRequest new].timeoutInterval doubleValue] success:successBlock failure:failureBlock];
}

+ (NSURLSessionDataTask *)GET:(NSString *)url timeoutInterval:(NSTimeInterval)timeoutInterval success:(WHTSuccessResponseBlock)successBlock failure:(WHTFailureResponseBlock)failureBlock
{
    NSParameterAssert(url != nil);
    return [self GET:url timeoutInterval:timeoutInterval success:successBlock failure:failureBlock httpSessionManager:[self shareManager]];
}

#pragma mark  - get custom sessionManager

+ (NSURLSessionDataTask *)GET:(NSString *)url success:(WHTSuccessResponseBlock)successBlock failure:(WHTFailureResponseBlock)failureBlock httpSessionManager:(AFHTTPSessionManager *)sessionManager
{
     return [self GET:url timeoutInterval:[[WHTRequest new].timeoutInterval doubleValue] success:successBlock failure:failureBlock httpSessionManager:sessionManager];
}

+ (NSURLSessionDataTask *)GET:(NSString *)url timeoutInterval:(NSTimeInterval)timeoutInterval success:(WHTSuccessResponseBlock)successBlock failure:(WHTFailureResponseBlock)failureBlock httpSessionManager:(AFHTTPSessionManager *)sessionManager
{
    NSParameterAssert(url != nil);
    
    return [sessionManager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(successBlock)
        {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(failureBlock)
        {
            failureBlock(error);
        }
    }];
}

#pragma mark -post default sessionManager

+ (NSURLSessionDataTask *)POST:(NSString *)url  content:(NSDictionary *)content success:(WHTSuccessResponseBlock)successBlock failure:(WHTFailureResponseBlock)failureBlock
{
    return [self POST:url content:content timeoutInterval:[[WHTRequest new].timeoutInterval doubleValue] success:successBlock failure:failureBlock];
}

+ (NSURLSessionDataTask *)POST:(NSString *)url  content:(NSDictionary *)content timeoutInterval:(NSTimeInterval)timeout  success:(WHTSuccessResponseBlock)successBlock failure:(WHTFailureResponseBlock)failureBlock
{
    return  [self POST:url content:content timeoutInterval:timeout success:successBlock failure:failureBlock httpSessionManager:[self shareManager]];
}

+ (NSURLSessionDataTask *)POST:(WHTRequest *)request success:(WHTSuccessResponseBlock)successBlock failure:(WHTFailureResponseBlock)failureBlock
{
      return  [self POST:request.url content:request.contents timeoutInterval:request.timeoutInterval.doubleValue success:successBlock failure:failureBlock httpSessionManager:[self shareManager]];
}

#pragma mark - post custom  sessionManager

+ (NSURLSessionDataTask *)POST:(NSString *)url  content:(NSDictionary *)content success:(WHTSuccessResponseBlock)successBlock failure:(WHTFailureResponseBlock)failureBlock httpSessionManager:(AFHTTPSessionManager *)sessionManager
{
    return  [self POST:url content:content timeoutInterval:[[WHTRequest new].timeoutInterval doubleValue] success:successBlock failure:failureBlock httpSessionManager:sessionManager];
}

+ (NSURLSessionDataTask *)POST:(WHTRequest *)request success:(WHTSuccessResponseBlock)successBlock failure:(WHTFailureResponseBlock)failureBlock httpSessionManager:(AFHTTPSessionManager *)sessionManager
{
    return  [self POST:request.url content:request.contents timeoutInterval:request.timeoutInterval.doubleValue success:successBlock failure:failureBlock httpSessionManager:sessionManager];
}

+ (NSURLSessionDataTask *)POST:(NSString *)url  content:(NSDictionary *)content timeoutInterval:(NSTimeInterval)timeout  success:(WHTSuccessResponseBlock)successBlock failure:(WHTFailureResponseBlock)failureBlock httpSessionManager:(AFHTTPSessionManager *)sessionManager
{
    NSParameterAssert(url != nil);
    NSParameterAssert(content != nil);
    
    return [sessionManager POST:url parameters:content progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(successBlock)
        {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(failureBlock)
        {
            failureBlock(error);
        }
    }];
}

@end
