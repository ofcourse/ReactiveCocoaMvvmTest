//
//  WHRSA.h
//  Pods
//
//  Created by hsg on 2017/8/15.
//
//

#import <Foundation/Foundation.h>

@interface WHTRSA : NSObject

#pragma -mark  -加密

/**
 加密

 @param str 原文
 @param pubKey 公钥
 @return base64编码后的string
 */
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;

/**
 加密

 @param data 原文
 @param pubKey 公钥
 @return raw data
 */
+ (NSData *)encryptData:(NSData *)data publicKey:(NSString *)pubKey;

/**
 加密

 @param str 原文
 @param privKey 公钥
 @return base64编码后的string
 */
+ (NSString *)encryptString:(NSString *)str privateKey:(NSString *)privKey;

// return raw data

/**
 加密

 @param data 原文
 @param privKey 公钥
 @return raw data
 */
+ (NSData *)encryptData:(NSData *)data privateKey:(NSString *)privKey;

#pragma -mark  - 解密

/**
 解密

 @param str 已加密的字符串
 @param pubKey 公钥
 @return NSString原文
 */
+ (NSString *)decryptString:(NSString *)str publicKey:(NSString *)pubKey;

/**
 解密

 @param data 已加密的data
 @param pubKey 公钥
 @return NSData原文
 */
+ (NSData *)decryptData:(NSData *)data publicKey:(NSString *)pubKey;

/**
 解密

 @param str 已加密的字符串
 @param privKey 私钥
 @return NSString原文
 */
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;

/**
 解密

 @param data 已加密的data
 @param privKey 私钥
 @return NSData原文
 */
+ (NSData *)decryptData:(NSData *)data privateKey:(NSString *)privKey;

@end
