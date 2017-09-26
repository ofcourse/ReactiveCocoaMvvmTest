//
//  PersonModel.m
//  TestMantle
//
//  Created by hsg on 2017/9/26.
//  Copyright © 2017年 hsg. All rights reserved.
//

#import "PersonModel.h"
#import <Mantle/Mantle.h>
#import "CarModel.h"

@implementation PersonModel

+ (NSValueTransformer *)carsTransformer
{
    return [MTLJSONAdapter arrayTransformerWithModelClass:[CarModel class]];
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name": @"name",
             @"cars": @"cars",
             @"son": @"son"
             };
}

@end
