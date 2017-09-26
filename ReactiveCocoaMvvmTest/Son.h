//
//  Son.h
//  TestMantle
//
//  Created by hsg on 2017/9/26.
//  Copyright © 2017年 hsg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface Son : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *sonName;
@property (nonatomic, strong) NSString *loveGame;

@end
