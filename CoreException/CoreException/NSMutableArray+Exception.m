//
//  NSMutableArray+Exception.m
//  Exception
//
//  Created by muxi on 15/1/22.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "NSMutableArray+Exception.h"
#import "NSObject+Exception.h"


@implementation NSMutableArray (Exception)




+(void)load{
    
    Class class=NSClassFromString(CoreExceptionArrayM);

    //对象方法区
    //1.数组越界:无法处理

    //2.添加空对象
    [self swizzleInstanceMethodInClass:class newMethodSelector:@selector(addNoExceptionObject:) originalMethodSelector:@selector(addObject:)];
    
    //3.添加空数组
    [self swizzleInstanceMethodInClass:class newMethodSelector:@selector(addNoExceptionObjectsFromArray:) originalMethodSelector:@selector(addObjectsFromArray:)];
}




#pragma mark  -对象方法区
#pragma mark  处理添加空数组有异常
-(void)addNoExceptionObjectsFromArray:(NSArray *)otherArray{
    
    //不能添加空
    if(otherArray==nil && self.count!=0){
        
        return;
    }
    
    [self addNoExceptionObjectsFromArray:otherArray];
}



#pragma mark  处理添加空对象的异常
-(void)addNoExceptionObject:(id)anObject{
    
    if(anObject==nil){
        
        NSLog(@"Warinning:可变数组添加空对象。添加的对象为：%@，\n当前数组为：%@",anObject,self);
        
        return;
    }
    
    [self addNoExceptionObject:anObject];
}








@end
