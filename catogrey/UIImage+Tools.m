//
//  UIImage+Tools.m
//  myLottery
//
//  Created by tima_maker on 16/2/2.
//  Copyright © 2016年 lll. All rights reserved.
//

#import "UIImage+Tools.h"

@implementation UIImage (Tools)



+(instancetype)imageWithResizableImageName:(NSString *)imageName{

    UIImage *image = [UIImage imageNamed:imageName];
    /**
     * 图片缩放
     */
    image = [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
    return image;
}


+(instancetype)imageWithResizableImageName:(NSString *)imageName widthStretchSize:(float)ws heightStretchSize:(float)hs{

    UIImage *image = [UIImage imageNamed:imageName];
    /**
     * 图片缩放
     */
    image = [image stretchableImageWithLeftCapWidth:image.size.width*ws topCapHeight:image.size.height*hs];
    return image;
}
@end
