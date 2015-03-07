//
//  ViewController.m
//  CoreException
//
//  Created by 沐汐 on 15-3-7.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array=@[@"对象1",@"对象2"];
    
    NSString *str=array[3];
    
    NSLog(@"%@",str);
    
}

@end
