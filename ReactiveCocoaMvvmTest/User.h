//
//  UserModel.h
//  ReactiveCocoaMvvmTest
//
//  Created by ios6 on 2017/8/11.
//  Copyright © 2017年 ios6. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSignal;

@interface User : NSObject

@property (copy,nonatomic)  NSString *name;
@property (copy,nonatomic)  NSString *password;

@property (strong,nonatomic) NSDate *birthday;


- (RACSignal *)login;

@end
