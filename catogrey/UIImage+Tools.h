//
//  UIImage+Tools.h
//  myLottery
//
//  Created by tima_maker on 16/2/2.
//  Copyright © 2016年 lll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tools)

/**
 *  固定0.5比例拉伸的ImageView
 *
 *  @param imageName 图片名称
 *
 *  @return <#return value description#>
 */
+(instancetype)imageWithResizableImageName:(NSString *)imageName;


/**
 *  动态比例拉伸Image
 *
 *  @param imageName 图片名称
 *  @param ws        width拉伸比例
 *  @param hs        height拉伸比例
 *
 *  @return <#return value description#>
 */
+(instancetype)imageWithResizableImageName:(NSString *)imageName widthStretchSize:(float)ws heightStretchSize:(float)hs;

@end
