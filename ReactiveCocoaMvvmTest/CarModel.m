//
//  CarModel.m
//  TestMantle
//
//  Created by hsg on 2017/9/26.
//  Copyright © 2017年 hsg. All rights reserved.
//

#import "CarModel.h"

@implementation CarModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"make": @"make",
             @"year": @"year"
             };
}

@end
