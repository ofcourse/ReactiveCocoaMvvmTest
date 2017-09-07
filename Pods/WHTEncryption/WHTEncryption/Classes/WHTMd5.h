//
//  WHTMd5.h
//  Pods
//
//  Created by hsg on 2017/8/15.
//
//

#import <Foundation/Foundation.h>

@interface WHTMd5 : NSObject

/**
 *  32位长度的16进制  128bit
 *
 *  @param input 原文字符串
 *
 *  @return 32位长度的16进制 md5
 */
+ (NSString *)md5HexDigest:(NSData *)input;

/**
 *  32位长度的16进制  128bit
 *
 *  @param input 原文字符串
 *
 *  @return NSData md5
 */
+ (NSData *)md5Digest:(NSData *)input;

/**
 *  32位长度的16进制  128bit
 *
 *  @param input 原文字符串
 *
 *  @return 32位长度的16进制 md5
 */
+ (NSString *)md5Hex:(NSString *) input;

/**
 *  16位长度的md5值  取32位的中间16位
 *
 *  @param input 原文字符串
 *
 *  @return 16位长度的16进制 md5
 */
+ (NSString *)md5HexOf16Length:(NSString *) input;

@end
