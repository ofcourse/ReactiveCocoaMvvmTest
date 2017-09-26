//
//  WHTNetWorkingHelpers+CUser.m
//  ReactiveCocoaMvvmTest
//
//  Created by hsg on 2017/9/22.
//  Copyright © 2017年 ios6. All rights reserved.
//

#import "WHTNetWorkingHelpers+CUser.h"
#import <AFNetworking/AFNetworking.h>

@implementation WHTNetWorkingHelpers (CUser)

+ (AFHTTPSessionManager *)shareCuserManager {
    static dispatch_once_t onceToken;
    static AFHTTPSessionManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        [manager.operationQueue setMaxConcurrentOperationCount:3];
        manager.requestSerializer=[AFHTTPRequestSerializer serializer];
        [manager.requestSerializer setTimeoutInterval:[WHTRequest new].timeoutInterval.doubleValue];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    });
    return manager;
}

@end
