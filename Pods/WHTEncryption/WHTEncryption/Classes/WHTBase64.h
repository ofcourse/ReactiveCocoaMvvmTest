//
//  WHTBase64.h
//  Pods
//
//  Created by hsg on 2017/8/15.
//
//

#import <Foundation/Foundation.h>

@interface WHTBase64 : NSObject

#pragma mark encode
/**
 *  将NSdata base64 编码
 *
 *  @param data 需要base64的data
 *
 *  @return base64编码后的NSString
 */
+ (NSString *)encodeWithData:(NSData *)data;


+ (NSString *)encodeWithString:(NSString *)string;


#pragma mark decode
/**
 *  将base64编码后的NSString还原为NSdata
 *
 *  @param string  base64编码后的NSString
 *
 *  @return 未编码的NSData
 */
+ (NSData *)decodeToDataWitEncodedString:(NSString *)string;

/**
 *  将base64编码后的NSString还原为NSdata
 *
 *  @param string  base64编码后的NSString
 *
 *  @return 未编码的NSString
 */
+ (NSString *)decodeToStringWitEncodedString:(NSString *)string;

@end
