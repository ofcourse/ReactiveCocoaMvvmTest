//
//  WHTAFNetWorkingHelpers.h
//  Pods
//
//  Created by hsg on 2017/8/18.
//
//

#import <Foundation/Foundation.h>
#import "WHTRequest.h"

typedef void(^WHTSuccessResponseBlock)(id responseObject);
typedef void(^WHTFailureResponseBlock)(NSError *error);

@class NSURLSessionDataTask;

@interface WHTAFNetWorkingHelpers : NSObject

#pragma mark - get

/**
 *  default timeout 10s
 *
 *  @param url          url
 *  @param success successblock with responseObject
 *  @param failure successblock with nserror
 */
+ (NSURLSessionDataTask *)GET:(NSString *)url success:(WHTSuccessResponseBlock) success failure:(WHTFailureResponseBlock) failure;

+ (NSURLSessionDataTask *)GET:(NSString *)url timeoutInterval:(NSTimeInterval)timeoutInterval success:(WHTSuccessResponseBlock) successBlock failure:(WHTFailureResponseBlock)failureBlock ;

+ (NSURLSessionDataTask *)GETWithRequest:(WHTRequest *)request success:(WHTSuccessResponseBlock)success failure:(WHTFailureResponseBlock)failureBlock;

#pragma mark - post

+ (NSURLSessionDataTask *)POST:(NSString *)url  content:(NSDictionary *)content success:(WHTSuccessResponseBlock)success failure:(WHTFailureResponseBlock)failure;

+ (NSURLSessionDataTask *)POST:(NSString *)url  content:(NSDictionary *)content timeoutInterval:(NSTimeInterval)timeout  success:(WHTSuccessResponseBlock)success failure:(WHTFailureResponseBlock)failure;
/**
 *  post request content
 *
 *  @param request request params
 *  @param success successBlock
 *  @param failure failureBlock
 */
+ (NSURLSessionDataTask *)POST:(WHTRequest *)request success:(WHTSuccessResponseBlock)success failure:(WHTFailureResponseBlock) failure;

@end
