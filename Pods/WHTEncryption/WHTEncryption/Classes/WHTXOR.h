//
//  WHTXOR.h
//  Pods
//
//  Created by hsg on 2017/8/15.
//
//

#import <Foundation/Foundation.h>

@interface WHTXOR : NSObject

/**
 *  异或加密
 *
 *  @param data       加解密data
 *  @param privateKey 秘钥
 *
 *  @return 加解密后的数据
 */
+ (NSData *)dataWithData:(NSData *)data privateKey:(char *)privateKey;

/**
 *  异或加密
 *
 *  @param data       加解密data
 *  @param privateKey 秘钥
 *
 *  @return 加解密后的数据
 */
+ (NSString *)stringWithData:(NSData *)data privateKey:(char *)privateKey;

/**
 *  异或加密
 *
 *  @param string       加解密string
 *  @param privateKey 秘钥
 *
 *  @return 加解密后的数据
 */
+ (NSString *)stringWithString:(NSString *)string privteKey:(char *)privateKey;

@end
