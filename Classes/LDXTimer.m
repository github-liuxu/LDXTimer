//
//  LDXTimer.m
//  tt
//
//  Created by meishe01 on 2018/4/9.
//  Copyright © 2018年 meicam.com. All rights reserved.
//

#import "LDXTimer.h"

@interface LDXTimer()

@property (nonatomic, strong) NSTimer *timer;
@property void (^ldxTimer)(LDXTimer *timer);

@end

@implementation LDXTimer

- (void)dealloc {
    [self invalidate];
}

+ (LDXTimer *_Nullable)timerWithTimeInterval:(NSTimeInterval)ti target:(id _Nullable )aTarget selector:(SEL _Nullable )aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    LDXTimer *timer = [[[self class] alloc] initWithTimeInterval:ti target:aTarget selector:aSelector userInfo:userInfo repeats:yesOrNo];
    return timer;
}

+ (LDXTimer *_Nullable)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id _Nullable )aTarget selector:(SEL _Nullable )aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    LDXTimer *timer = [[[self class] alloc] initWithTimeInterval:ti target:aTarget selector:aSelector userInfo:userInfo repeats:yesOrNo];
    [timer fire];
    return timer;
}

+ (LDXTimer *_Nullable)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^_Nullable)(LDXTimer * _Nullable timer))block {
    LDXTimer *timer = [[[self class] alloc] init];
    timer.timer = [NSTimer timerWithTimeInterval:interval target:timer selector:@selector(ldx_Selector) userInfo:nil repeats:repeats];
    [[NSRunLoop currentRunLoop] addTimer:timer.timer forMode:NSRunLoopCommonModes];
    timer.ldxTimer = block;
    return timer;
}

+ (LDXTimer *_Nullable)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^_Nullable)(LDXTimer * _Nullable timer))block {
    LDXTimer *timer = [[[self class] alloc] init];
    timer.timer = [NSTimer timerWithTimeInterval:interval target:timer selector:@selector(ldx_Selector) userInfo:nil repeats:repeats];
    [[NSRunLoop currentRunLoop] addTimer:timer.timer forMode:NSRunLoopCommonModes];
    timer.ldxTimer = block;
    [timer fire];
    return timer;
}

- (void)ldx_Selector {
    self.ldxTimer(self);
}

- (instancetype _Nullable )initWithTimeInterval:(NSTimeInterval)interval target:(id _Nullable )target selector:(SEL _Nullable )selector userInfo:(id _Nullable )userInfo repeats:(BOOL)repeats {
    if (self = [super init]) {
        self.timer = [NSTimer timerWithTimeInterval:interval target:target selector:selector userInfo:userInfo repeats:repeats];
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
