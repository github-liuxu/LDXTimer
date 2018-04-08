//
//  ViewController.m
//  tt
//
//  Created by meishe01 on 2018/4/9.
//  Copyright © 2018年 meicam.com. All rights reserved.
//

#import "ViewController.h"
#import "LDXTimer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [LDXTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(LDXTimer *timer) {
        NSLog(@"123");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
