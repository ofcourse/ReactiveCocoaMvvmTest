//
//  Children.m
//  TestMantle
//
//  Created by hsg on 2017/9/1.
//  Copyright © 2017年 hsg. All rights reserved.
//

#import "Children.h"

@implementation Children

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"";
        self.age = 0;
        self.mArray = [[NSMutableArray alloc] init];
    }
    return self;
}

+(BOOL)automaticallyNotifiesObserversOfName
{
    return NO;
}
-(void)setName:(NSString *)name{
    [self willChangeValueForKey:@"name"];
    _name = name;
    [self didChangeValueForKey:@"name"];
}
//+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key {
//    if ([key isEqualToString:@"name"]) {
//        return NO;
//    }
//    else{
//        return [super automaticallyNotifiesObserversForKey:key];
//    }
//}


@end
