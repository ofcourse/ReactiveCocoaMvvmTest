//
//  WHTRequest.h
//  Pods
//
//  Created by hsg on 2017/8/18.
//
//

#import <Foundation/Foundation.h>

@interface WHTRequest : NSObject

@property (copy,nonatomic) NSString *url;
/**
 *  请求 value
 */
@property (strong,nonatomic) NSDictionary *contents;

/**
 *  网络超时时间(单位s)
 */
@property (strong,nonatomic) NSNumber *timeoutInterval;

//网络连接失败,请重试
@property (copy,nonatomic) NSString *requestFailureRemind;

- (NSNumber *)timeoutInterval;

- (NSString *)requestFailureRemind;

@end
