//
//  UserModel.m
//  ReactiveCocoaMvvmTest
//
//  Created by ios6 on 2017/8/11.
//  Copyright © 2017年 ios6. All rights reserved.
//

#import "User.h"

@implementation User

- (RACSignal *)login {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:@"good"];
            [subscriber sendCompleted];
        });
       
        return nil;
    }];
}

@end
