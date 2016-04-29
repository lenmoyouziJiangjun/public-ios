//
//  HMPresentationController.m
//  05-自定义UIPresentationController
//
//  Created by apple on 14/12/2.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMPresentationController.h"

@implementation HMPresentationController
//设置presentedView的frame
//- (CGRect)frameOfPresentedViewInContainerView
//{
////    return CGRectMake(0, 50, self.containerView.frame.size.width, self.containerView.frame.size.height - 100);
//    return CGRectInset(self.containerView.bounds, 0, 100);
//}

/**
 *  即将显示的时候，将presentedView添加到containerView
 */
- (void)presentationTransitionWillBegin
{
//    NSLog(@"presentationTransitionWillBegin");
    
    self.presentedView.frame = self.containerView.bounds;
    [self.containerView addSubview:self.presentedView];
    
}

- (void)presentationTransitionDidEnd:(BOOL)completed
{
//    NSLog(@"presentationTransitionDidEnd");
}

- (void)dismissalTransitionWillBegin
{
//    NSLog(@"dismissalTransitionWillBegin");
}

/**
 *  dismiss后，移除presentedView
 *
 *  @param completed <#completed description#>
 */
- (void)dismissalTransitionDidEnd:(BOOL)completed
{
//    NSLog(@"dismissalTransitionDidEnd");
    [self.presentedView removeFromSuperview];
}
@end
