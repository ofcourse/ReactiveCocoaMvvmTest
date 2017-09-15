//
//  Person.m
//  ReactiveCocoaMvvmTest
//
//  Created by hsg on 2017/9/15.
//  Copyright © 2017年 ios6. All rights reserved.
//

#import "Person.h"

@implementation Person

// firstName,lastName的属性值更改 都会影响FullName的观察者
+ (NSSet<NSString *> *)keyPathsForValuesAffectingFullName {
    return [NSSet setWithObjects:@"firstName",@"lastName", nil];
}

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@%@",self.firstName,self.lastName];
}
//http://yulingtianxia.com/blog/2014/05/12/objective-czhong-de-kvche-kvo/
@end
