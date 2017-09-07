//
//  UserViewModel.h
//  ReactiveCocoaMvvmTest
//
//  Created by ios6 on 2017/8/11.
//  Copyright © 2017年 ios6. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserViewModel : NSObject

@property (copy,nonatomic)  NSString *birthday;

- (instancetype)initWithUser:(User *)user;

@end
