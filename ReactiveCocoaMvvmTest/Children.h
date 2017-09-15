//
//  Children.h
//  TestMantle
//
//  Created by hsg on 2017/9/1.
//  Copyright © 2017年 hsg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Children : NSObject

@property (copy,nonatomic) NSString *name;
@property (nonatomic,assign) NSUInteger age;
@property (nonatomic, strong) Children *child;

@property (nonatomic, strong) NSMutableArray *mArray;

@end
