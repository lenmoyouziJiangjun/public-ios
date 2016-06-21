//
//  AppInfoUtils.m
//  微博
//
//  Created by tima_maker on 16/3/18.
//  Copyright © 2016年 lll. All rights reserved.
//

#import "AppInfoUtils.h"

@implementation AppInfoUtils



/**
 *  获取app版本号
 *
 *  @return 版本号
 */
+(NSString *)getAppVersion{
    //获取
    NSDictionary *dict=[NSBundle mainBundle].infoDictionary;
//    LLLLog(@"------19----%@",dict);
    return dict[@"CFBundleVersion"];
}



@end
