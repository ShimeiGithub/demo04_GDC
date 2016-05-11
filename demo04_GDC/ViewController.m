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
    //创建队列
    dispatch_queue_t queue = dispatch_queue_create("SerialQueue", DISPATCH_QUEUE_SERIAL);
    
    //向队列中添加异步任务
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"串行异步：i = %d,current thread:%@",i,[NSThread currentThread]);
            [NSThread sleepForTimeInterval:0.5];
        }
    });
    
    dispatch_async(queue, ^{
        for (int j = 0; j < 10; j++) {
            NSLog(@"串行异步：j = %d,current thread:%@",j,[NSThread currentThread]);
            [NSThread sleepForTimeInterval:0.5];
        }
    });
}

/** 并行同步（等同于串行，几乎不用） */
- (IBAction)concurrentSynchronized:(id)sender {
    //创建并行队列
    dispatch_queue_t queue = dispatch_queue_create("ConcurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    //向并行队列中 放 同步任务
    dispatch_sync(queue, ^{
        for (int i=0; i<10; i++) {
            NSLog(@"并行同步：i = %d,thread %@",i, [NSThread currentThread]);
            [NSThread sleepForTimeInterval:0.5];
        }
    });
    dispatch_sync(queue, ^{
        for (int j=0; j<10; j++) {
            NSLog(@"并行同步：j = %d,thread %@",j, [NSThread currentThread]);
            [NSThread sleepForTimeInterval:0.5];
        }
    });
    //虽然是并行队列，但是由于任务都是放在主线程上，同一时间一条线程只能做一个任务，所以效果等同于 串行同步队列
}

/** 并行异步
    异步：创建子线程，任务都在子线程上执行
    并行：线程里的任务同时进行
    因为有2个任务，所以会创建两个子线程
 */
- (IBAction)concurrentAsynchronized:(id)sender {
    //创建并行对垒
    dispatch_queue_t queue = dispatch_queue_create("ConcurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            NSLog(@"并行异步：i = %d,current thread:%@",i, [NSThread currentThread]);
            [NSThread sleepForTimeInterval:0.5];
        }
    });
    
    dispatch_async(queue, ^{
        for (int j = 0; j < 10; j++) {
            NSLog(@"并行异步：j = %d,current thread:%@",j, [NSThread currentThread]);
            [NSThread sleepForTimeInterval:0.5];
        }
    });
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
