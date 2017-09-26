//
//  WHTRequest.h
//  Pods
//
//  Created by hsg on 2017/9/20.
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


- (NSNumber *)timeoutInterval;


@end
