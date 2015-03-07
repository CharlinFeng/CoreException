//
//  NSString+Exception.m
//  Exception
//
//  Created by muxi on 15/1/22.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "NSString+Exception.h"
#import "CoreExceptionConst.h"
#import "NSObject+Exception.h"

@implementation NSString (Exception)

+(void)load{
    
    Class class=NSClassFromString(CoreExceptionString);
    
    //对象方法区
    //1.字符串长度越界
    [self swizzleInstanceMethodInClass:class newMethodSelector:@selector(subNoExceptionStringFromIndex:) originalMethodSelector:@selector(substringFromIndex:)];
    [self swizzleInstanceMethodInClass:class newMethodSelector:@selector(subNoExceptionStringToIndex:) originalMethodSelector:@selector(substringToIndex:)];
    [self swizzleInstanceMethodInClass:class newMethodSelector:@selector(subNoExceptionStringWithRange:) originalMethodSelector:@selector(substringWithRange:)];

}




#pragma mark - 成员方法

#pragma mark  字符长度越界
-(NSString *)subNoExceptionStringFromIndex:(NSUInteger)from{
    
    NSUInteger length=self.length;
    
    if(from>=length){
        NSLog(@"Warinning:尝试截取字符串长度出现异常，字符串长度=%i，您想截取的起点=%i，字符串为=%@。",length,from,self);
        return @"";
    }
    
    return [self subNoExceptionStringFromIndex:from];
}

-(NSString *)subNoExceptionStringToIndex:(NSUInteger)to{
    
    NSUInteger length=self.length;
    
    if(to>=length){
        NSLog(@"Warinning:尝试截取字符串长度出现异常，字符串长度=%i，您想截取的终点=%i，字符串为=%@。",length,to,self);
        return @"";
    }
    
    return [self subNoExceptionStringToIndex:to];
}


-(NSString *)subNoExceptionStringWithRange:(NSRange)range{
    
    NSUInteger length=self.length;
    
    NSUInteger loc=range.location;
    
    NSUInteger len=range.length;
    
    if(loc>length || loc + len>length){
        NSLog(@"Warinning:尝试截取字符串长度出现异常，字符串长度=%i，您想截取的range=%@，字符串为=%@。",length,NSStringFromRange(range),self);
        return @"";
    }
    
    return [self subNoExceptionStringWithRange:range];
}

@end
