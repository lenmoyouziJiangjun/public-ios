//
//  NSDictionary+log.m
//  HttpLearn
//
//  Created by tima_maker on 16/2/23.
//  Copyright © 2016年 lll. All rights reserved.
//

#import "NSDictionary+Log.h"

@implementation NSDictionary (Log)

-(NSString *)descriptionWithLocale:(id)locale{
    //定义一个
    NSMutableString *mulStr = [NSMutableString string];
    //输出json格式
    [mulStr appendString:@"{\n"];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [mulStr appendString:key];
        [mulStr appendString:@" : "];
        [mulStr appendFormat:@"%@,\n",obj];
    }];
    [mulStr appendString:@"}"];
    return mulStr;
}
@end


@implementation NSArray (Log)
-(NSString *)descriptionWithLocale:(id)locale{
    //定义一个
    NSMutableString *mulStr = [NSMutableString string];
    //输出json格式
    [mulStr appendString:@"[\n"];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [mulStr appendFormat:@"%@,\n",obj];
    }];
    
    [mulStr appendString:@"]"];
    return mulStr;
}

@end

