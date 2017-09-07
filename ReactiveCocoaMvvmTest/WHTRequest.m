//
//  WHTRequest.m
//  Pods
//
//  Created by hsg on 2017/8/18.
//
//

#import "WHTRequest.h"

@implementation WHTRequest

- (NSNumber *)timeoutInterval
{
    if(!_timeoutInterval)
    {
        _timeoutInterval=@(15.0);
    }
    return _timeoutInterval;
}

- (NSString *)requestFailureRemind
{
    if(!_requestFailureRemind)
    {
        _requestFailureRemind=@"网络或服务异常,请重试";
    }
    return _requestFailureRemind;
}

@end
