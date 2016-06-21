//
//  HttpUtils.m
//  微博
//
//  Created by tima_maker on 16/4/18.
//  Copyright © 2016年 lll. All rights reserved.
//

#import "HttpUtils.h"
#import "AFNetworking.h"


@implementation HttpUtils



/**
 *  post请求里面有query参数，将query append到后面
 *
 *  @param url         <#url description#>
 *  @param queryParmas <#queryParmas description#>
 *
 *  @return <#return value description#>
 */
+(NSString *)getAppendUri:(NSString*)url queryparams:(NSDictionary *)queryParmas{
    NSArray *keys= [queryParmas allKeys];
    NSMutableString *mStr= [NSMutableString stringWithString:url];
    [mStr appendString:@"?"];
    for (NSString *key in keys) {
        NSString *value=[queryParmas objectForKey:key];
        [mStr appendString:[NSString stringWithFormat:@"%@=%@&",key,value]];
    }
    
    return  [mStr substringToIndex:mStr.length-2];
}

/**
 *  网络是否可用
 *
 *  @return <#return value description#>
 */
+(BOOL)isNetworkReachability{
    AFNetworkReachabilityManager *arm=[AFNetworkReachabilityManager sharedManager];
    //开始监控
    [arm startMonitoring];
    BOOL status=YES;
    [arm setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //网络状态值
        //        enum {
        //            AFNetworkReachabilityStatusUnknown,
        //            AFNetworkReachabilityStatusNotReachable,
        //            AFNetworkReachabilityStatusReachableViaWWAN,
        //            AFNetworkReachabilityStatusReachableViaWiFi,
        //        }
        switch (status) {
            case AFNetworkReachabilityStatusUnknown://未知网络
                status =NO;
//                return NO;
                break;
            case AFNetworkReachabilityStatusNotReachable://没有网络
                status=NO;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN://手机网络
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi://wifi网络
                break;
            default:
                break;
        }
    }];
    return status;
}

/*
 *   普通get请求
 *
 *  @param url         <#url description#>
 *  @param queryparams queryparams description
 *  @param success     success description
 *  @param nError      <#nError description#>
 */
+(void)get:(NSString *)url queryParams:(NSDictionary *)queryparams success:(void (^)(id))success failure:(void (^)(NSError *))nError{
    
//    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:BASE_URL];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:queryparams progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (nError) {
            nError(error);
        }
    }];
}

/**
 *  普通的post请求
 *
 *  @param url         <#url description#>
 *  @param formparams  <#formparams description#>
 *  @param queryparams <#queryparams description#>
 *  @param success     <#success description#>
 *  @param nError      <#nError description#>
 */
+(void)post:(NSString *)url formParams:(NSDictionary *)formparams queryParams:(NSDictionary *)queryparams success:(void (^)(id))success failure:(void (^)(NSError *))nError{

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    if (queryparams) {
        url = [self getAppendUri:url queryparams:queryparams];
    }
    
    [manager POST:url parameters:formparams progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(success){
           success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (nError) {
            nError(error);
        }
//        nError(error);
    }];
}




@end
