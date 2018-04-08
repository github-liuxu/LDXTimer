//
//  LDXTimer.h
//  tt
//
//  Created by meishe01 on 2018/4/9.
//  Copyright © 2018年 meicam.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDXTimer : NSObject

+ (LDXTimer *)timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

+ (LDXTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

- (instancetype)initWithTimeInterval:(NSTimeInterval)interval target:(id)target selector:(SEL)selector userInfo:(id)userInfo repeats:(BOOL)repeats;

@property (readonly, getter=isValid) BOOL valid;

@property (copy) NSDate *fireDate;
@property (readonly) NSTimeInterval timeInterval;
@property NSTimeInterval tolerance;
@property (nullable, readonly, retain) id userInfo;

@end
