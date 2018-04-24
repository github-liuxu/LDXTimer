//
//  LDXTimer.h
//  tt
//
//  Created by 刘东旭 on 2018/4/9.
//  Copyright © 2018年 刘东旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDXTimer : NSObject

+ (NSTimer *_Nullable)timerWithTimeInterval:(NSTimeInterval)ti target:(id _Nullable )aTarget selector:(SEL _Nullable )aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

+ (NSTimer *_Nullable)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id _Nullable )aTarget selector:(SEL _Nullable )aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

+ (NSTimer *_Nullable)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^_Nullable)(void))block;

+ (NSTimer *_Nullable)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^_Nullable)(void))block;

- (instancetype _Nullable )initWithTimeInterval:(NSTimeInterval)interval target:(id _Nullable )target selector:(SEL _Nullable )selector userInfo:(id _Nullable )userInfo repeats:(BOOL)repeats;

- (void)fire;

- (void)invalidate;

@property (readonly, getter=isValid) BOOL valid;

@property (copy) NSDate * _Nullable fireDate;
@property (readonly) NSTimeInterval timeInterval;
@property NSTimeInterval tolerance;
@property (nullable, readonly, retain) id userInfo;

@end
