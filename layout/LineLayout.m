//
//  MyCollectionViewFlowLayout.m
//  自定义UICollectionView
//
//  Created by tima_maker on 16/4/29.
//  Copyright © 2016年 lll. All rights reserved.
//

#import "LineLayout.h"

static const CGFloat ITEM_SIZE=150;


@implementation LineLayout


-(instancetype)init{

    if (self = [super init]) {
    }
    return  self;
}

/**
 *  初始化操作
 */
-(void)prepareLayout{
    [super prepareLayout];
    //定义item的大小
    self.itemSize = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
    /*
     设置滚动方向
     typedef NS_ENUM(NSInteger, UICollectionViewScrollDirection) {
     UICollectionViewScrollDirectionVertical,
     UICollectionViewScrollDirectionHorizontal
     };
     */
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //设置每个cell之间的距离
    self.minimumLineSpacing =12;
    //设置属性
    //        UICollectionViewLayoutAttributes;
}

/**
 *  显示边界发生变化，就重新布局,就会重新调用layoutAttributesForElementsInRect
 *
 *  @param newBounds <#newBounds description#>
 *
 *  @return <#return value description#>
 */
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{

    return YES;
}

/**
 *  用来设置scrollView停止滚动的那一刻的位置（实现停止滑动的时候，自动滚动到中间）
 *
 *  @param proposedContentOffset <#proposedContentOffset description#>
 *  @param velocity              <#velocity description#>
 *
 *  @return <#return value description#>
 */
-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    //1、计算出ScrollView最后会停留的范围
    CGRect lastRect;
    lastRect.size = self.collectionView.frame.size;
    lastRect.origin =proposedContentOffset;
    
    //2:取出这个范围的所有属性
    NSArray *array=[self layoutAttributesForElementsInRect:lastRect];
    
    //计算屏幕中点坐标
    CGFloat centerX = proposedContentOffset.x+self.collectionView.frame.size.width*0.5;
    //定义一个最小值标记
    CGFloat adjustOffsetX = MAXFLOAT;
    //3：获取所有属性
    for (UICollectionViewLayoutAttributes *attr in array) {
        //计算出距离中心的坐标的最小位置，
        if(ABS(attr.center.x-centerX)<adjustOffsetX){
            adjustOffsetX  = attr.center.x-centerX;
        }
    }
    
    //返回中点坐标
    return CGPointMake(proposedContentOffset.x+adjustOffsetX, proposedContentOffset.y);
}



/**
 *  重绘
 *
 *  @param rect
 *
 *  @return
 */
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{

    //1、取得默认的Cell的UICollectionViewLayoutAttributes
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
    //计算屏幕最中间的X(用来处理数据比例),和UIsrcollerView一样需要加上偏移量
    CGFloat centerX = self.collectionView.contentOffset.x+self.collectionView.frame.size.width*0.5;
    //计算可见区域
    CGRect visiableRect;
    visiableRect.size = self.collectionView.frame.size;
    visiableRect.origin = self.collectionView.contentOffset;
    
    //2、遍历所有的布局属性
    for (UICollectionViewLayoutAttributes *attr in array) {
        //如果不可见，继续循环
        bool isVisiable= CGRectIntersectsRect(visiableRect, attr.frame);
        if (!isVisiable) {
            continue;
        }
        
        //计算每个item的中点x位置(用来处理计算比例)
        CGFloat itemCenterX = attr.center.x;
        //设置3D选择角度,只能设置一次
//        attr.transform3D= CATransform3DMakeRotation(10000, 100, 10, 10);
        //计算变化比例，距离越远的，比例越小
        CGFloat scale = 1-ABS(itemCenterX-centerX)/self.collectionView.frame.size.width;
        
        //计算3D尺寸变化（x,y,z）
        attr.transform3D =CATransform3DMakeScale(scale, scale, scale);
    }
    
    return array;
}




@end
