//
//  PersonModel.h
//  TestMantle
//
//  Created by hsg on 2017/9/26.
//  Copyright © 2017年 hsg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
@class Son;

@interface PersonModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *cars;

@property (nonatomic, strong) Son *son;

@end
