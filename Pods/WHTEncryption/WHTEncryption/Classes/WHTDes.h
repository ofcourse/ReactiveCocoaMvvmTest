//
//  WHTDes.h
//  Pods
//
//  Created by hsg on 2017/8/15.
//
//

#import <Foundation/Foundation.h>

@interface WHTDes : NSObject

#pragma mark  ecnrypt
/**
 *  des加密   慎用 如果加密后的nsdata有非encoding编码的字符，将会返回nil
 *
 *  @param originString 加密原文
 *  @param privatekey   秘钥
 *
 *  @return 加密串NSString 如果加密后的nsdata有非encoding编码的字符，将会返回nil
 */
+ (NSString *)encryptString:(NSString *)originString privateKey:(NSString *)privatekey;

/**
 *  des加密
 *
 *  @param originData 加密原文
 *  @param privateKey   秘钥
 *
 *  @return 加密串NSData
 */
+ (NSData *)encryptData:(NSData *)originData privatekey:(NSString *)privateKey;


#pragma mark decrypt

/**
 *  des解密 慎用 如果解密后的nsdata有非encoding编码的字符，将会返回nil
 *
 *  @param encrptedString 加密串
 *  @param privateKey     秘钥
 *
 *  @return 原文NSString  如果解密后的nsdata有非encoding编码的字符，将会返回nil
 */
+ (NSString *)decryptWithEncrptedString:(NSString *)encrptedString privateKey:(NSString *)privateKey;



/**
 *  des解密
 *
 *  @param encrptedData 加密串
 *  @param privateKey     秘钥
 *
 *  @return 原文NSData
 */
+ (NSData *)decryptWithEncrptedData:(NSData *)encrptedData privateKey:(NSString *)privateKey;

@end
