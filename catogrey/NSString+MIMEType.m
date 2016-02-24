//
//  NSString+MIMEType.m
//  11-了解-获得文件的MIMEType
//
//  Created by xiaomage on 15/7/13.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "NSString+MIMEType.h"
#import <MobileCoreServices/MobileCoreServices.h>

@implementation NSString (MIMEType)
- (NSString *)MIMEType
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:self]) {
        return nil;
    }
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge  CFStringRef)[self pathExtension], NULL);
    CFStringRef MIMEType = UTTypeCopyPreferredTagWithClass (UTI, kUTTagClassMIMEType);
    CFRelease(UTI);
    if (!MIMEType) {
        return @"application/octet-stream";
    }
    return (__bridge NSString *)MIMEType;
}

- (NSString *)MIMEType2
{
    NSURLResponse *response = nil;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:self]];
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    return response.MIMEType;
}
@end
