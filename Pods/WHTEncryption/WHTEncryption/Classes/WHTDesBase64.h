//
//  WHTDesBase64.h
//  Pods
//
//  Created by hsg on 2017/8/15.
//
//

#import <Foundation/Foundation.h>

@interface WHTDesBase64 : NSObject

/**
 *  先utf-8编码，再des加密，最后base64加密
 *
 *  @param originString 原文
 *  @param privateKey   密钥
 *
 *  @return 加密密文
 */
+ (NSString *)encryptDesThenBase64WithString:(NSString *)originString privateKey:(NSString *)privateKey;


/**
 *  先base64解密，再des解密，最后utf8
 *
 *  @param firstDesThenBaseEncryptedString 密文
 *  @param privateKey                      密钥
 *
 *  @return 原文
 */
+ (NSString *)decryptWithString:(NSString *)firstDesThenBaseEncryptedString privateKey:(NSString *)privateKey;


@end
