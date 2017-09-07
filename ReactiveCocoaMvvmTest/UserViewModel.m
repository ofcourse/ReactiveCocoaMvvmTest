//
//  UserViewModel.m
//  ReactiveCocoaMvvmTest
//
//  Created by ios6 on 2017/8/11.
//  Copyright © 2017年 ios6. All rights reserved.
//

#import "UserViewModel.h"

@implementation UserViewModel

- (instancetype)initWithUser:(User *)user {
    self =[ super init];
    if(self) {
        self.birthday = [@([user.birthday timeIntervalSince1970]) stringValue];
    }
    return self;
}

@end
