//
//  NSString+Extension.h
//  微博
//
//  Created by tima_maker on 16/4/6.
//  Copyright © 2016年 lll. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface NSString (Extension)
/**
 *  计算字符串的size
 *
 *  @param font 字体大小
 *  @param maxW 一行的最大长度
 *
 *  @return <#return value description#>
 */
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;
/**
 *
 *  计算字符串的size
 *  @param font <#font description#>
 *
 *  @return <#return value description#>
 */
- (CGSize)sizeWithFont:(UIFont *)font;



/**
 *  将十六进制的编码转为emoji字符
 */
+ (NSString *)emojiWithIntCode:(int)intCode;

/**
 *  将十六进制的编码转为emoji字符
 */
+ (NSString *)emojiWithStringCode:(NSString *)stringCode;
- (NSString *)emoji;

/**
 *  是否为emoji字符
 */
- (BOOL)isEmoji;


/**
 *  如果字符串是个文件夹路径，求文件大小
 *
 *  @return <#return value description#>
 */
-(NSInteger)fileSize;

@end
