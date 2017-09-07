//
//  WHTMd5.m
//  Pods
//
//  Created by hsg on 2017/8/15.
//
//

#import "WHTMd5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation WHTMd5

+ (NSData *)md5Digest:(NSData *)input
{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(input.bytes, (CC_LONG)input.length, result);
    return [[NSData alloc] initWithBytes:result length:CC_MD5_DIGEST_LENGTH];
}

+ (NSString *)md5HexDigest:(NSData *)input
{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(input.bytes, (CC_LONG)input.length, result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for (int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

+ (NSString *)md5Hex:(NSString *)input
{
    const char *cStr = [input UTF8String];
    
    NSData *inputDatas= [[NSData alloc] initWithBytes:cStr length: strlen(cStr)];
    
    return [self  md5HexDigest:inputDatas];
}

+ (NSString *)md5HexOf16Length:(NSString *) input
{
    NSString *md5String=[self md5Hex:input];
    
    return [md5String substringWithRange:NSMakeRange(8, 16)];
}

@end
