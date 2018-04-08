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

@end

@implementation LDXTimer

- (void)dealloc {
    [self invalidate];
}

+ (LDXTimer *)timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    LDXTimer *timer = [[[self class] alloc] initWithTimeInterval:ti target:aTarget selector:aSelector userInfo:userInfo repeats:yesOrNo];
    return timer;
}

+ (LDXTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    LDXTimer *timer = [[[self class] alloc] initWithTimeInterval:ti target:aTarget selector:aSelector userInfo:userInfo repeats:yesOrNo];
    [timer fire];
    return timer;
}

- (instancetype)initWithTimeInterval:(NSTimeInterval)interval target:(id)target selector:(SEL)selector userInfo:(id)userInfo repeats:(BOOL)repeats {
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
