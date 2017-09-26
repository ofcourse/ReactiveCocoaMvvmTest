//
//  WHTRequest.m
//  Pods
//
//  Created by hsg on 2017/9/20.
//
//

#import "WHTRequest.h"

@implementation WHTRequest

- (NSNumber *)timeoutInterval
{
    if(!_timeoutInterval)
    {
        _timeoutInterval = @(10.0);
    }
    return _timeoutInterval;
}

@end
