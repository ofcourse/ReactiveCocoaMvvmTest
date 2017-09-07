//
//  WHTXOR.m
//  Pods
//
//  Created by hsg on 2017/8/15.
//
//

#import "WHTXOR.h"

@implementation WHTXOR

+ (NSData *)dataWithData:(NSData *)data privateKey:(char *)privateKey
{
    NSMutableData *resultD = [data mutableCopy];
    
    // Get pointer to data to obfuscate
    char *dataPtr = (char *) [resultD mutableBytes];
    
    // Get pointer to key data   NSUTF8StringEncoding  NSASCIIStringEncoding
    //char *keyData = (char *) [[key dataUsingEncoding:NSUTF8StringEncoding] bytes];
    // Points to each char in sequence in the key
    //char *keyPtr = keyData;
    // For each character in data, xor with current value in key
    for (int x = 0; x < [data length]; x++)
    {
        for (int y=0; y<strlen(privateKey); y++) {
            *dataPtr = *dataPtr ^ privateKey[y];
        }
        // Replace current character in data with
        // current character xor'd with current key value.
        // Bump each pointer to the next character
        //*dataPtr = *dataPtr++ ^ *keyPtr++;
        dataPtr++;
    }
    return resultD;
}

+ (NSString *)stringWithData:(NSData *)data privateKey:(char *)privateKey
{
    //NSString *str=[NSString stringWithCString  encoding:NSUTF8StringEncoding];
    NSData *resultData=[self dataWithData:data privateKey:privateKey];
    
    return [[NSString alloc]initWithData:resultData encoding:NSUTF8StringEncoding];
}

+ (NSString *)stringWithString:(NSString *)string privteKey:(char *)privateKey
{
    NSData *data=[string dataUsingEncoding:NSUTF8StringEncoding];
    
    return [self stringWithData:data privateKey:privateKey];
}


@end
