//
//  UIView+Extension.m
//  微博
//
//  Created by tima_maker on 16/3/12.
//  Copyright © 2016年 lll. All rights reserved.
//

#import "UIView+Extension.h"
/**
 *  跟UIView增加直接修改x,y的方法
 */
@implementation UIView (Extension)


-(void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame =frame;
}

-(CGFloat)x{
    return self.frame.origin.x;
}


-(void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame =frame;
}

-(CGFloat)y{
    return self.frame.origin.y;
}

-(void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame =frame;
}

-(CGFloat)width{
    return self.frame.size.width;
}


-(void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame =frame;
}

-(CGFloat)height{
    return self.frame.size.height;
}


-(void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

-(CGSize)size{
    return self.bounds.size;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}


@end
