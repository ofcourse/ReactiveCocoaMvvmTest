//
//  Son.m
//  TestMantle
//
//  Created by hsg on 2017/9/26.
//  Copyright © 2017年 hsg. All rights reserved.
//

#import "Son.h"

@implementation Son

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"sonName": @"son",
             @"loveGame":@"game"
             };
}

@end
