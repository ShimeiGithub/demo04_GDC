//
//  ViewController.m
//  demo04_GDC
//
//  Created by LuoShimei on 16/5/11.
//  Copyright © 2016年 罗仕镁. All rights reserved.
//
//
/**
    GCD:
    队列：队列中是存放任务的，可以存放多个。这些任务可以串行执行也可以是并行执行。
    任务：任务可以是同步执行也可以是异步执行。
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/** 串行同步 */
- (IBAction)serialSynchronized:(id)sender {
    //创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("SerialQueue", DISPATCH_QUEUE_SERIAL);
    
    //向队列中添加同步任务
    dispatch_sync(queue, ^{
        //任务1
        for (int i = 0; i < 10; i++) {
            NSLog(@"串行同步：i = %d,current thread:%@",i,[NSThread currentThread]);
            [NSThread sleepForTimeInterval:0.5];
        }
    });
    
    dispatch_sync(queue, ^{
        //任务2
        for (int j = 0; j < 10; j++) {
            NSLog(@"串行同步：j = %d,current thread:%@",j,[NSThread currentThread]);
            [NSThread sleepForTimeInterval:0.5];
        }
    });
}

/** 串行异步 */
- (IBAction)serialAsynchronized:(id)sender {
    
}

/** 并行同步 */
- (IBAction)parallelSynchronized:(id)sender {

}

/** 并行异步 */
- (IBAction)parallelAsynchronized:(id)sender {
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
