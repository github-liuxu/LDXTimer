//
//  LDXWeakTimer.h
//  LDXTimer
//
//  Created by 刘东旭 on 2018/6/1.
//  Copyright © 2018年 meicam.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDXWeakTimer : NSObject

+ (LDXWeakTimer *_Nullable)scheduledTimerWithTimeInterval:(NSTimeInterval)interval dispatch_queue:(dispatch_queue_t)queue block:(void (^_Nullable)(void))block;

- (void)cancel;

@end
