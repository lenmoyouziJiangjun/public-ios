//
//  SaveUtils.h
//  微博
//
//  Created by tima_maker on 16/3/18.
//  Copyright © 2016年 lll. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  android 的SPUtils
 */
@interface SaveUtils : NSObject

/**
 *  存储数据
 *
 *  @param value   <#value description#>
 *  @param keyName <#keyName description#>
 */
+(void)setObject:(id)value forKey:(NSString *)keyName;


/**
 *  获取key值
 *
 *  @param keyName <#keyName description#>
 *
 *  @return <#return value description#>
 */
+(id)objectForKey:(NSString *)keyName;

/**
 *  将NSDictionary 存储到文件里面
 *
 *  @param file <#file description#>
 *  @param dict <#dict description#>
 */
+(void)writeToFile:(NSString *)file dict:(NSDictionary *)dict;

/**
 *  从文件里面取出NSDictionary
 *
 *  @param file 文件名
 *
 *  @return <#return value description#>
 */
+(NSDictionary *)getDictFromFile:(NSString *)file;


/**
 *  将自定义对象存储到文件沙盒中。注意自定义对象必须实现NSCoding协议
 *
 *  @param file <#file description#>
 *  @param obj  <#obj description#>
 */
+(void)objWriteToFile:(NSString *)file obj:(id)obj;



+(id)getObjFromFile:(NSString *)file;

@end
