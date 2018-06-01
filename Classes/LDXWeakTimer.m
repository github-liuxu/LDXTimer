//
//  LDXWeakTimer.m
//  LDXTimer
//
//  Created by 刘东旭 on 2018/6/1.
//  Copyright © 2018年 meicam.com. All rights reserved.
//

#import "LDXWeakTimer.h"

@interface LDXWeakTimer()

@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation LDXWeakTimer

- (void)dealloc {
    NSLog(@"%s",__func__);
}

+ (LDXWeakTimer *_Nullable)scheduledTimerWithTimeInterval:(NSTimeInterval)interval dispatch_queue:(dispatch_queue_t)queue block:(void (^_Nullable)(void))block {
    LDXWeakTimer *weakTimer = [LDXWeakTimer new];
    weakTimer.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(weakTimer.timer, DISPATCH_TIME_NOW, interval * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(weakTimer.timer, ^{
        block();
    });
    dispatch_resume(weakTimer.timer);
    return weakTimer;
}

- (void)cancel {
    dispatch_source_cancel(self.timer);
}

@end
