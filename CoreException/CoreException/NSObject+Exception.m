//
//  NSObject+Exception.m
//  Exception
//
//  Created by muxi on 15/1/22.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "NSObject+Exception.h"
#import "CoreExceptionConst.h"
#import <objc/runtime.h>

typedef enum{
    
    SwizzleTypeClass=0,                                             //类方法
    
    SwizzleTypeInstance,                                            //对象方法
    
}SwizzleType;


@implementation NSObject (Exception)



+(void)swizzleInstanceMethodInClass:(Class)class newMethodSelector:(SEL)newMethodSelector originalMethodSelector:(SEL)originalMethodSelector{
    [self swizzleWithType:SwizzleTypeInstance InClass:class newMethodSelector:newMethodSelector originalMethodSelector:originalMethodSelector];
}

+(void)swizzleClassMethodInClass:(Class)class newMethodSelector:(SEL)newMethodSelector originalMethodSelector:(SEL)originalMethodSelector{
    [self swizzleWithType:SwizzleTypeClass InClass:class newMethodSelector:newMethodSelector originalMethodSelector:originalMethodSelector];
}


+(void)swizzleWithType:(SwizzleType)type InClass:(Class)class newMethodSelector:(SEL)newMethodSelector originalMethodSelector:(SEL)originalMethodSelector{
    
    Method newMethod=NULL;
    
    Method originalMethod=NULL;
    
    //方法互换
    if(SwizzleTypeClass==type){
        
        newMethod=class_getClassMethod(class, newMethodSelector);
        
        originalMethod=class_getClassMethod(class, originalMethodSelector);
        
    }else if(SwizzleTypeInstance==type){
        
        newMethod=class_getInstanceMethod(class, newMethodSelector);
        
        originalMethod=class_getInstanceMethod(class, originalMethodSelector);
    }
    
    method_exchangeImplementations(newMethod, originalMethod);
}

@end
