//
//  LDXTimer.m
//  tt
//
//  Created by 刘东旭 on 2018/4/9.
//  Copyright © 2018年 刘东旭. All rights reserved.
//

#import "LDXTimer.h"

@interface LDXTimer()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, copy) void (^ldxTimer)(void);

@end

@implementation LDXTimer

- (void)dealloc {
    [self invalidate];
    NSLog(@"%s",__func__);
}

+ (NSTimer *_Nullable)timerWithTimeInterval:(NSTimeInterval)ti target:(id _Nullable )aTarget selector:(SEL _Nullable )aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    LDXTimer *timer = [LDXTimer new];
    timer.target = aTarget;
    timer.selector = aSelector;
    timer.timer = [NSTimer timerWithTimeInterval:ti target:timer selector:@selector(targetSelector:) userInfo:userInfo repeats:yesOrNo];
    [[NSRunLoop currentRunLoop] addTimer:timer.timer forMode:NSRunLoopCommonModes];
    return timer.timer;
}



+ (NSTimer *_Nullable)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id _Nullable )aTarget selector:(SEL _Nullable )aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    LDXTimer *timer = [LDXTimer new];
    timer.selector = aSelector;
    timer.target = aTarget;
    timer.timer = [NSTimer scheduledTimerWithTimeInterval:ti target:timer selector:@selector(targetSelector:) userInfo:userInfo repeats:yesOrNo];
    return timer.timer;
}

+ (NSTimer *_Nullable)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^_Nullable)(void))block {
    LDXTimer *timer = [[LDXTimer alloc] init];
    timer.ldxTimer = block;
    timer.timer = [NSTimer timerWithTimeInterval:interval target:timer selector:@selector(ldx_Selector) userInfo:nil repeats:repeats];
    [[NSRunLoop currentRunLoop] addTimer:timer.timer forMode:NSRunLoopCommonModes];
    return timer.timer;
}

+ (NSTimer *_Nullable)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^_Nullable)(void))block {
    LDXTimer *timer = [[[self class] alloc] init];
    timer.ldxTimer = block;
    timer.timer = [NSTimer timerWithTimeInterval:interval target:timer selector:@selector(ldx_Selector) userInfo:nil repeats:repeats];
    [[NSRunLoop currentRunLoop] addTimer:timer.timer forMode:NSRunLoopCommonModes];
    return timer.timer;
}

- (void)ldx_Selector {
    __weak typeof(self)weakSelf = self;
    if (self.ldxTimer) {
        self.ldxTimer();
    }
}

- (void)targetSelector:(NSTimer *)timer {
    if ([self.target respondsToSelector:self.selector]) {
        [self.target performSelector:self.selector withObject:timer];
    }
}

- (instancetype _Nullable )initWithTimeInterval:(NSTimeInterval)interval target:(id _Nullable )target selector:(SEL _Nullable )selector userInfo:(id _Nullable )userInfo repeats:(BOOL)repeats {
    if (self = [super init]) {
        self.target = target;
        self.selector = selector;
        NSTimer *timer = [NSTimer timerWithTimeInterval:interval target:self selector:@selector(targetSelector:) userInfo:userInfo repeats:repeats];
        self.timer = timer;
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void)fire {
    [self.timer fire];
}

- (void)invalidate {
    [self.timer invalidate];
    self.timer = nil;
}

- (BOOL)isValid {
    return [self.timer isValid];
}

- (NSTimeInterval)timeInterval {
    return [self.timer timeInterval];
}

- (NSDate *)fireDate {
    return [self.timer fireDate];
}

-(void)setFireDate:(NSDate *)fireDate {
    [self.timer setFireDate:fireDate];
}

- (NSTimeInterval)tolerance {
    return [self.timer tolerance];
}

- (void)setTolerance:(NSTimeInterval)tolerance {
    [self.timer setTolerance:tolerance];
}

- (id)userInfo {
    return [self.timer userInfo];
}

@end
