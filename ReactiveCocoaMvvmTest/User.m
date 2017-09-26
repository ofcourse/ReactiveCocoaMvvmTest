//
//  UserModel.m
//  ReactiveCocoaMvvmTest
//
//  Created by ios6 on 2017/8/11.
//  Copyright © 2017年 ios6. All rights reserved.
//

#import "User.h"
#import "WHTNetWorkingHelpers.h"

@implementation User

- (RACSignal *)login {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [WHTNetWorkingHelpers GET:@"http://www.liebiao.com/" success:^(id responseObject) {
            [subscriber sendNext:@"good"];
            [subscriber sendCompleted];
        } failure:^(NSError *error) {
            [subscriber sendNext:@"bad"];
            [subscriber sendCompleted];
        }];
        return nil;
    }];
}

@end
