//
//  WaterFlowLayout.m
//  自定义UICollectionView
//
//  Created by tima_maker on 16/5/3.
//  Copyright © 2016年 lll. All rights reserved.
//

#import "WaterFlowLayout.h"

@interface WaterFlowLayout()
/** 这个字典用来存储每一列最大的Y值(每一列的高度)@[@"0":@100,@"1":@101,@"2":@103] */
@property (nonatomic, strong) NSMutableDictionary *maxYDict;

/** 存放所有的布局属性 */
@property (nonatomic, strong) NSMutableArray *attrsArray;
@end




@implementation WaterFlowLayout

- (NSMutableDictionary *)maxYDict
{
    if (!_maxYDict) {
        self.maxYDict = [[NSMutableDictionary alloc] init];
    }
    return _maxYDict;
}

- (NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        self.attrsArray = [[NSMutableArray alloc] init];
    }
    return _attrsArray;
}


-(instancetype)init{
    if (self = [super init]) {
        //设置不变参数
        self.columnMargin = 10;
        self.rowMargin = 10;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        self.columnsCount = 3;
    }
    return self;
}



/**
 *  初始化参数。每次变化的时候，都会调用一次
 */
-(void)prepareLayout{
    [super prepareLayout];
    // 1.清空最大的Y值
    for (int i = 0; i<self.columnsCount; i++) {
        NSString *column = [NSString stringWithFormat:@"%d", i];
        self.maxYDict[column] = @(self.sectionInset.top);
    }
    
    // 2.计算所有cell的属性
    [self.attrsArray removeAllObjects];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i<count; i++) {
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [self.attrsArray addObject:attrs];
    }
}


/**
 *  设置滚动的范围，类似UIScrollerView
 *
 *  @return <#return value description#>
 */
-(CGSize)collectionViewContentSize{
    __block NSString *maxColumn = @"0";
    [self.maxYDict enumerateKeysAndObjectsUsingBlock:^(NSString *column, NSNumber *maxY, BOOL *stop) {
        if ([maxY floatValue] > [self.maxYDict[maxColumn] floatValue]) {
            maxColumn = column;
        }
    }];
    return CGSizeMake(0, [self.maxYDict[maxColumn] floatValue] + self.sectionInset.bottom);

}


/**
 *  是否重新布局
 *
 *  @param newBounds <#newBounds description#>
 *
 *  @return <#return value description#>
 */
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

/**
 *  计算布局
 *
 *  @param rect <#rect description#>
 *
 *  @return <#return value description#>
 */
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attrsArray;
}

/**
 *  设置item的属性，主要方法，分配每个item的显示位置
 *
 *  @param indexPath <#indexPath description#>
 *
 *  @return <#return value description#>
 */
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    // 假设最短的那一列的第0列
    __block NSString *minColumn = @"0";
    // 找出最短的那一列
    [self.maxYDict enumerateKeysAndObjectsUsingBlock:^(NSString *column, NSNumber *maxY, BOOL *stop) {
        if ([maxY floatValue] < [self.maxYDict[minColumn] floatValue]) {
            minColumn = column;
        }
    }];
    
    // 计算尺寸
    CGFloat width = (self.collectionView.frame.size.width - self.sectionInset.left - self.sectionInset.right - (self.columnsCount - 1) * self.columnMargin)/self.columnsCount;
    CGFloat height = [self.delegate waterflowLayout:self heightForWidth:width atIndexPath:indexPath];
    
    // 计算位置
    CGFloat x = self.sectionInset.left + (width + self.columnMargin) * [minColumn intValue];
    CGFloat y = [self.maxYDict[minColumn] floatValue] + self.rowMargin;
    
    // 更新这一列的最大Y值
    self.maxYDict[minColumn] = @(y + height);
    
    // 创建属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.frame = CGRectMake(x, y, width, height);
    return attrs;
}






@end
