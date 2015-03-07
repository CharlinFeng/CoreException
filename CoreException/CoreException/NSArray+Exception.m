//
//  NSArray+Exception.m
//  Exception
//
//  Created by muxi on 15/1/22.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "NSArray+Exception.h"
#import "NSObject+Exception.h"


@implementation NSArray (Exception)



+(void)load{
    
    Class class=NSClassFromString(CoreExceptionArray);
    
    
    //类方法区
    //使用空数组初始化
    [self swizzleClassMethodInClass:class newMethodSelector:@selector(arrayWithNoExceptionArray:) originalMethodSelector:@selector(arrayWithArray:)];
    
    
    //对象方法区
    //数组越界
    [self swizzleInstanceMethodInClass:class newMethodSelector:@selector(objectWithExceptionAtIndex:) originalMethodSelector:@selector(objectAtIndex:)];
    
    
}




#pragma mark - 类方法区
#pragma mark  初始化错误
+(instancetype)arrayWithNoExceptionArray:(NSArray *)array{
    
    if(![array isKindOfClass:[NSArray class]]){
        
        if(array!=nil){
           NSLog(@"Warinning:使用数组的类方法初始化的时候传入的array不是真正的数组:%@（真正的类型为：%@），目标数组的类型为：%@。",array,NSStringFromClass([array class]),NSStringFromClass(self));
        }

        return nil;
    }

    return [self arrayWithNoExceptionArray:array];
}







#pragma mark  -对象方法区
#pragma mark  处理数组越界的错误
-(id)objectWithExceptionAtIndex:(NSUInteger)index{

    NSUInteger count=self.count;
    
    if(index>=count){
        
        NSLog(@"Warinning:数组出现越界。数组长度为：%i,请求的长度为：%i，\n当前数组为：%@",count,index,self);
        
        return nil;
    }
    
    return [self objectWithExceptionAtIndex:index];
}


@end
