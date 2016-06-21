//
//  StatusDbUtils.h
//  微博
//
//  Created by tima_maker on 16/4/19.
//  Copyright © 2016年 lll. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  微博数据数据库操作
 */
@interface StatusDbUtils : NSObject

/**
 *  根据参数去数据库里面去数据
 *
 *  @param params 参数集合
 *
 *  @return 
 */
+(NSArray *)statusesWidthParams:(NSDictionary *)params;


/**
 *  将数据存储到数据库
 *
 *  @param array <#array description#>
 */
+(void)saveStatus:(NSArray *)array;

@end
