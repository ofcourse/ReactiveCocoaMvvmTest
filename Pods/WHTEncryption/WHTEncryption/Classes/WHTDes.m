//
//  WHTDes.m
//  Pods
//
//  Created by ios6 on 2017/8/15.
//
//

#import "WHTDes.h"

#import <CommonCrypto/CommonCryptor.h>

@implementation WHTDes

#pragma mark  ecnrypt

+ (NSString *)encryptString:(NSString *)originString privateKey:(NSString *)privateKey
{
    NSData *data = [originString dataUsingEncoding:NSUTF8StringEncoding];
    data = [self encryptData:data privatekey:privateKey];
    //在使用initWithData等方法将NSData转换成NSString时，如果NSData的内容含有非encoding编码的字符，将会返回nil
    return  [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

+ (NSData *)encryptData:(NSData *)originData privatekey:(NSString *)privateKey
{
    NSParameterAssert(originData != nil);
    NSParameterAssert(privateKey != nil);
    
    return [self privateDesWithData:originData privatekey:privateKey isEncrypt:YES];
}

#pragma mark decrypt

+ (NSString *)decryptWithEncrptedString:(NSString *)encrptedString privateKey:(NSString *)privateKey
{
    NSData *data = [encrptedString dataUsingEncoding:NSUTF8StringEncoding];
    data = [self decryptWithEncrptedData:data privateKey:privateKey];
    
    return  [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

+ (NSData *)decryptWithEncrptedData:(NSData *)encrptedData privateKey:(NSString *)privateKey
{
    NSParameterAssert(encrptedData != nil);
    NSParameterAssert(privateKey != nil);
    
    return [self privateDesWithData:encrptedData privatekey:privateKey isEncrypt:false];
}


#pragma mark private  encrypt and decrpt  function
/**
 *  加解密
 *
 *  @param data       data
 *  @param privateKey 密钥
 *  @param isEncrypt  是否是加密
 *
 *  @return NSData
 */
+ (NSData *)privateDesWithData:(NSData *)data privatekey:(NSString *)privateKey isEncrypt:(BOOL)isEncrypt
{
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    
    [privateKey getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [data length];
    
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt( isEncrypt? kCCEncrypt :kCCDecrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeDES,
                                          NULL,
                                          [data bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesCrypted);
    
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesCrypted];
    }
    
    free(buffer);
    return nil;
}

@end
