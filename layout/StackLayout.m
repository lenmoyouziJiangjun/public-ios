//
//  StackLayout.m
//  自定义UICollectionView
//
//  Created by tima_maker on 16/5/3.
//  Copyright © 2016年 lll. All rights reserved.
//

#import "StackLayout.h"

@implementation StackLayout



/**
 *  初始化
 */
-(void)prepareLayout{
    [super prepareLayout];

}

/**
 *  是否重绘
 *
 *  @param newBounds <#newBounds description#>
 *
 *  @return <#return value description#>
 */
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

/**
 *  设置显示区域,必须设置这个，不然没办法滑动
 *
 *  @return <#return value description#>
 */
-(CGSize)collectionViewContentSize{
    return CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height);
}

/**
 *  滚动停止后，cell显示的位置
 *
 *  @param proposedContentOffset <#proposedContentOffset description#>
 *  @param velocity              <#velocity description#>
 *
 *  @return <#return value description#>
 */
//-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
//
//
//}


/**
 *  绘制布局
 *
 *  @param rect <#rect description#>
 *
 *  @return <#return value description#>
 */
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    /**
     *  这么做没什么用，因为我们继承的是UICollectionViewLayout，父类没做处理
     */
//    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray *array = [NSMutableArray array];
    
    //1、获取第0组的所有子元素（因为我们没有分组，所以获取第0组就是获取所有元素）
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    
    
//    NSArray *angles = @[@0,@arc4random(1)];
    
    for(int i=0;i<count;i++){
//       //2、获取每个子元素的属性
//        UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath: [NSIndexPath indexPathForItem:i inSection:0]];
//        attr.size = CGSizeMake(100, 100);//测试大小
//        //统一位置为中心位置
//        attr.center = centerPoint;
//        attr.zIndex = count-i;//按图片顺序显示（默认情况先添加的显示在后面，我们要安按照图片顺序显示）；
//        if (i==0) {
//            attr.transform = CGAffineTransformMakeRotation(0);
//        }else{
//            attr.transform = CGAffineTransformMakeRotation(arc4random_uniform(100)/100.0);
//        }
        
        UICollectionViewLayoutAttributes *attr  = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [array addObject:attr];
    }
    return array;
}

/**
 *  如果继承的不是流水布局，需要实现这个方法。与layoutAttributesForElementsInRect的区别在于：layoutAttributesForElementsInRect不止包括cell的布局，还包括header,footer等
 *
 *  @param indexPath <#indexPath description#>
 *
 *  @return <#return value description#>
 */
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath: indexPath];
    attr.size = CGSizeMake(100, 100);//测试大小
    
    //计算中点位置
    CGPoint centerPoint = CGPointMake(self.collectionView.frame.size.width*0.5, self.collectionView.frame.size.height *0.5);
    //统一位置为中心位置
    attr.center = centerPoint;
    attr.zIndex = [self.collectionView numberOfItemsInSection:indexPath.section] - indexPath.item;//按图片顺序显示（默认情况先添加的显示在后面，我们要安按照图片顺序显示）；
    if (indexPath.item==0) {
        attr.transform = CGAffineTransformMakeRotation(0);
    }else{
        attr.transform = CGAffineTransformMakeRotation(arc4random_uniform(100)/100.0);
    }
    
    return attr;
}



@end
