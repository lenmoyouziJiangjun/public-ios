//
//  NSDate+Extension.h
//  微博
//
//  Created by tima_maker on 16/4/6.
//  Copyright © 2016年 lll. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  NSDate的分类
 */
@interface NSDate (Extension)

/**
 *  是否是今天
 *
 *
 *  @return <#return value description#>
 */
-(BOOL)isToday;

/**
 *  是否是昨天
 *
 *
 *  @return <#return value description#>
 */
-(BOOL)isYesterday;

/**
 *  是否
 *
 *  @return <#return value description#>
 */
-(BOOL)isNowYear;

/**
 *  时间比较
 *
 *  @param from <#from description#>
 *
 *  @return 时间比较对象
 */
- (NSDateComponents *)deltaFrom:(NSDate *)from;

/**
 *  格式化date输出
 *
 *  @param format 时间格式
 *
 *  @return <#return value description#>
 */
-(NSString *)formatDate:(NSString *)format;


/**
 *  将时间格式化成微博的格式 刚刚，xxx分钟前，昨天，几天前
 *
 *  @return <#return value description#>
 */
+(NSString *)formatDateLikeWeibo:(NSString *)time;


@end
