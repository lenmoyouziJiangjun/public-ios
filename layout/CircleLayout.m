//
//  CircleLayout.m
//  自定义UICollectionView
//
//  Created by tima_maker on 16/5/3.
//  Copyright © 2016年 lll. All rights reserved.
//

#import "CircleLayout.h"

@implementation CircleLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

/**
 *  计算每个item的属性，
 *
 *  @param indexPath <#indexPath description#>
 *
 *  @return <#return value description#>
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attrs.size = CGSizeMake(50, 50);
    
    // 圆的半径
    CGFloat circleRadius = 70;
    CGPoint circleCenter = CGPointMake(self.collectionView.frame.size.width * 0.5, self.collectionView.frame.size.height * 0.5);
    // 每个item之间的角度
    CGFloat angleDelta = M_PI * 2 / [self.collectionView numberOfItemsInSection:indexPath.section];
    
    // 计算当前item的角度
    CGFloat angle = indexPath.item * angleDelta;
    
    attrs.center = CGPointMake(circleCenter.x + circleRadius * cosf(angle), circleCenter.y - circleRadius * sinf(angle));
    
    attrs.zIndex = indexPath.item;
    
    return attrs;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *array = [NSMutableArray array];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i<count; i++) {
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [array addObject:attrs];
    }
    return array;
}
@end
