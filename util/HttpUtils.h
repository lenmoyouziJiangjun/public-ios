//
//  HttpUtils.h
//  微博
//
//  Created by tima_maker on 16/4/18.
//  Copyright © 2016年 lll. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpUtils : NSObject

/**
 *  网络工具类，get请求
 *
 *  @param url         网络后缀
 *  @param formparams  form参数
 *  @param quaryparams query参数（append url后面）
 *  @param success     成功的回调
 *  @param error       失败的回调
 */
+(void)get:(NSString *)url queryParams:(NSDictionary *)queryparams success:(void (^)(id jsonValues))success failure:(void(^)(NSError *error)) nError;

/**
 *  网络工具类，post请求
 *
 *  @param url         网络后缀
 *  @param formparams  form参数
 *  @param quaryparams query参数（append url后面）
 *  @param success     成功的回调
 *  @param error       失败的回调
 */
+(void)post:(NSString *)url formParams:(NSDictionary *)formparams  queryParams:(NSDictionary *)quaryparams success:(void (^)(id jsonValues))success failure:(void(^)(NSError *error)) error;


/**
 *  单文件上传
 *
 *  @param url        网络后缀
 *  @param formparams <#formparams description#>
 *  @param filePath   文件路径
 *  @param success    <#success description#>
 *  @param error      <#error description#>
 */
+(void)upload:(NSString *)url formParams:(NSDictionary *)formparams filePath:(NSString *)filePath success:(void (^)(id jsonValues))success failure:(void(^)(NSError *error)) error;



/**
 *  文件下载
 *
 *  @param url         <#url description#>
 *  @param formparams  <#formparams description#>
 *  @param queryparams <#queryparams description#>
 *  @param success     <#success description#>
 *  @param error       <#error description#>
 */
+(void)downLoad:(NSString *)url formParams:(NSDictionary *)formparams queryParams:(NSDictionary *) queryparams success:(void (^)(id jsonValues))success failure:(void(^)(NSError *error)) error;

/**
 *  网络是否可用
 *
 *  @return <#return value description#>
 */
+(BOOL)isNetworkReachability;


@end
