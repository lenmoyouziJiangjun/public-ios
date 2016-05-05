//
//  WaterFlowLayout.h
//  自定义UICollectionView
//
//  Created by tima_maker on 16/5/3.
//  Copyright © 2016年 lll. All rights reserved.
//

#import <UIKit/UIKit.h>


@class WaterFlowLayout;
/**
 *  定义一个协议，用来处理外部传入的item的高度
 */
@protocol WaterflowLayoutDelegate <NSObject>

/**
 *  计算每个item的高度
 *
 *  @param waterflowLayout 
 *  @param width           宽度
 *  @param indexPath       item 的索引
 *
 *  @return <#return value description#>
 */
- (CGFloat)waterflowLayout:(WaterFlowLayout *)waterflowLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath;

@end

@interface WaterFlowLayout : UICollectionViewLayout

@property (nonatomic, assign) UIEdgeInsets sectionInset;
/** 每一列之间的间距 */
@property (nonatomic, assign) CGFloat columnMargin;
/** 每一行之间的间距 */
@property (nonatomic, assign) CGFloat rowMargin;
/** 显示多少列 */
@property (nonatomic, assign) int columnsCount;

@property (nonatomic, weak) id<WaterflowLayoutDelegate> delegate;



@end
