//
//  SecondViewController.m
//  LDXTimer
//
//  Created by 刘东旭 on 2018/4/23.
//  Copyright © 2018年 meicam.com. All rights reserved.
//

#import "SecondViewController.h"
#import "LDXTimer.h"
#import "LDXWeakTimer.h"
#import "NSTimer+LDXWeakTimer.h"

@interface SecondViewController () {
    NSTimer *timer;
//    LDXTimer *ldxTimer;
//    LDXWeakTimer *timer;
}

@end

@implementation SecondViewController

- (void)dealloc {
    NSLog(@"%s",__func__);
//    [ldxTimer invalidate];
    [timer invalidate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    ldxTimer = [[LDXTimer alloc] initWithTimeInterval:1 target:self selector:@selector(timerClick) userInfo:nil repeats:YES];
//    [timer fire];
//    timer = [LDXTimer timerWithTimeInterval:1 repeats:YES block:^(LDXTimer * _Nullable timer) {
//        NSLog(@"hello");
//    }];
//    timer = [LDXTimer timerWithTimeInterval:0.1 target:self selector:@selector(timerClick) userInfo:nil repeats:YES];
//    [timer fire];
//    timer = [LDXTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerClick) userInfo:nil repeats:YES];
//    timer = [LDXTimer timerWithTimeInterval:1 repeats:YES block:^ {
//        NSLog(@"kkkkkk");
//    }];
//    timer = [LDXTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^{
//        NSLog(@"kkkkkk");
//    }];
//    timer = [LDXWeakTimer scheduledTimerWithTimeInterval:0.1 dispatch_queue:dispatch_get_main_queue() block:^{
//        NSLog(@"哈哈哈哈");
//    }];
    timer = [NSTimer weak_scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer *timer) {
        NSLog(@"hello");
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [timer cancel];
}

- (void)timerClick {
    NSLog(@"hello");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
