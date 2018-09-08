//
//  NSTimer+LDXWeakTimer.h
//  LDXTimer
//
//  Created by 刘东旭 on 2018/9/8.
//  Copyright © 2018年 刘东旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (LDXWeakTimer)

+ (NSTimer *)weak_scheduledTimerWithTimeInterval:(NSTimeInterval)inerval
                                         repeats:(BOOL)repeats
                                           block:(void(^)(NSTimer *timer))block;

@end
