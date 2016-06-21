//
//  SaveUtils.m
//  微博
//
//  Created by tima_maker on 16/3/18.
//  Copyright © 2016年 lll. All rights reserved.
//

#import "SaveUtils.h"

@implementation SaveUtils

/**
 *  跟沙盒存储数据
 *
 *  @param value   <#value description#>
 *  @param keyName <#keyName description#>
 */
+(void)setObject:(id)value forKey:(NSString *)keyName{
    //存储数据
    [[NSUserDefaults standardUserDefaults]setObject:value forKey:keyName];
    //要想数据立马生效，需要调用synchronize方法
    [[NSUserDefaults standardUserDefaults]synchronize];
}

/**
 *  从沙盒中取出数据
 *
 *  @param keyName 对应的key值
 *
 *  @return
 */
+(id)objectForKey:(NSString *)keyName{
    return [[NSUserDefaults standardUserDefaults]objectForKey:keyName];
}

/**
 *  将NSDictionary写入文件
 *
 *  @param dict <#dict description#>
 *  @param file <#file description#>
 */
+(void)writeToFile:(NSString *)file dict:(NSDictionary *)dict{
    //获取文件目录
    NSString *doc=[NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path=[doc stringByAppendingPathComponent:file];
    [dict writeToFile:path atomically:YES];
}
/**
 *  获取NSDictionary
 *
 *  @param file <#file description#>
 *
 *  @return <#return value description#>
 */
+(NSDictionary *)getDictFromFile:(NSString *)file{
    //获取文件目录
    NSString *doc=[NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path=[doc stringByAppendingPathComponent:file];
    return [NSDictionary dictionaryWithContentsOfFile:path];
}

/**
 *  将obj保存到文件
 *
 *  @param file <#file description#>
 *  @param obj  <#obj description#>
 */
+(void)objWriteToFile:(NSString *)file obj:(id)obj{
    //获取文件目录
    NSString *doc=[NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path=[doc stringByAppendingPathComponent:file];

    [NSKeyedArchiver archiveRootObject:obj toFile:path];
}

/**
 *
 *
 *  @param file <#file description#>
 *
 *  @return <#return value description#>
 */
+(id)getObjFromFile:(NSString *)file{
    //获取文件目录
    NSString *doc=[NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) lastObject];
    NSString *path=[doc stringByAppendingPathComponent:file];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path ];
}


@end
