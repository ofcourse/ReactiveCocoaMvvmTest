//
//  WHTDesBase64.m
//  Pods
//
//  Created by hsg on 2017/8/15.
//
//

#import "WHTDesBase64.h"
#import "WHTBase64.h"
#import "WHTDes.h"

@implementation WHTDesBase64

+ (NSString *)encryptDesThenBase64WithString:(NSString *)originString privateKey:(NSString *)privateKey
{
    
    NSData *originData = [originString dataUsingEncoding:NSUTF8StringEncoding];
    NSData *encrypteDesData=[WHTDes encryptData:originData privatekey:privateKey];
    
    return  [WHTBase64 encodeWithData:encrypteDesData];
}

+ (NSString *)decryptWithString:(NSString *)firstDesThenBase64EncryptedString privateKey:(NSString *)privateKey
{
    NSData *base64DecodedString=[WHTBase64 decodeToDataWitEncodedString:firstDesThenBase64EncryptedString];
    NSData *encrytedDesData=[WHTDes decryptWithEncrptedData:base64DecodedString privateKey:privateKey];
    
    return [[NSString alloc] initWithData:encrytedDesData encoding:NSUTF8StringEncoding];
}


@end
