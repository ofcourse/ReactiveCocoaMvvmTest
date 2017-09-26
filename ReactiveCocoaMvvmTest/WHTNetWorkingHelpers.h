//
//  WHTAFNetWorkingHelpers.h
//  Pods
//
//  Created by hsg on 2017/9/20.
//
//

#import <Foundation/Foundation.h>
#import "WHTRequest.h"

typedef void(^WHTSuccessResponseBlock)(id responseObject);
typedef void(^WHTFailureResponseBlock)(NSError *error);

@class NSURLSessionDataTask;

@interface WHTNetWorkingHelpers : NSObject

#pragma mark - get

+ (AFHTTPSessionManager *)shareManager;

#pragma mark - get default sessionManager

+ (NSURLSessionDataTask *)GET:(NSString *)url success:(WHTSuccessResponseBlock)successBlock failure:(WHTFailureResponseBlock)failureBlock;

+ (NSURLSessionDataTask *)GET:(NSString *)url timeoutInterval:(NSTimeInterval)timeoutInterval success:(WHTSuccessResponseBlock)successBlock failure:(WHTFailureResponseBlock)failureBlock;

#pragma mark  - get custom sessionManager

+ (NSURLSessionDataTask *)GET:(NSString *)url success:(WHTSuccessResponseBlock)successBlock failure:(WHTFailureResponseBlock)failureBlock httpSessionManager:(AFHTTPSessionManager *)sessionManager;

+ (NSURLSessionDataTask *)GET:(NSString *)url timeoutInterval:(NSTimeInterval)timeoutInterval success:(WHTSuccessResponseBlock)successBlock failure:(WHTFailureResponseBlock)failureBlock httpSessionManager:(AFHTTPSessionManager *)sessionManager;

#pragma mark - post default sessionManager

+ (NSURLSessionDataTask *)POST:(NSString *)url  content:(NSDictionary *)content success:(WHTSuccessResponseBlock)successBlock failure:(WHTFailureResponseBlock)failureBlock;

+ (NSURLSessionDataTask *)POST:(NSString *)url  content:(NSDictionary *)content timeoutInterval:(NSTimeInterval)timeout  success:(WHTSuccessResponseBlock)successBlock failure:(WHTFailureResponseBlock)failureBlock;

+ (NSURLSessionDataTask *)POST:(WHTRequest *)request success:(WHTSuccessResponseBlock)successBlock failure:(WHTFailureResponseBlock)failureBlock;

#pragma mark - post custom  sessionManager

+ (NSURLSessionDataTask *)POST:(NSString *)url  content:(NSDictionary *)content success:(WHTSuccessResponseBlock)successBlock failure:(WHTFailureResponseBlock)failureBlock httpSessionManager:(AFHTTPSessionManager *)sessionManager;

+ (NSURLSessionDataTask *)POST:(NSString *)url  content:(NSDictionary *)content timeoutInterval:(NSTimeInterval)timeout  success:(WHTSuccessResponseBlock)successBlock failure:(WHTFailureResponseBlock)failureBlock httpSessionManager:(AFHTTPSessionManager *)sessionManager;

+ (NSURLSessionDataTask *)POST:(WHTRequest *)request success:(WHTSuccessResponseBlock)successBlock failure:(WHTFailureResponseBlock)failureBlock httpSessionManager:(AFHTTPSessionManager *)sessionManager;

@end
