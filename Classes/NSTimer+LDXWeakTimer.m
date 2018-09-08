//
//  NSTimer+LDXWeakTimer.m
//  LDXTimer
//
//  Created by 刘东旭 on 2018/9/8.
//  Copyright © 2018年 刘东旭. All rights reserved.
//

#import "NSTimer+LDXWeakTimer.h"

@implementation NSTimer (LDXWeakTimer)

+ (NSTimer *)weak_scheduledTimerWithTimeInterval:(NSTimeInterval)inerval
                                         repeats:(BOOL)repeats
                                           block:(void(^)(NSTimer *timer))block {
    return [NSTimer scheduledTimerWithTimeInterval:inerval target:self selector:@selector(blcokInvoke:) userInfo:[block copy] repeats:repeats];
}

+ (void)blcokInvoke:(NSTimer *)timer {
    
    void (^block)(NSTimer *timer) = timer.userInfo;
    
    if (block) {
        block(timer);
    }
}

@end
