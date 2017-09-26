//
//  CarModel.h
//  TestMantle
//
//  Created by hsg on 2017/9/26.
//  Copyright © 2017年 hsg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface CarModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *make;
@property (nonatomic, strong) NSString *year;

@end
