//
//  HMTransition.m
//  05-自定义UIPresentationController
//
//  Created by apple on 14/12/2.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMTransition.h"
#import "HMPresentationController.h"
#import "HMAnimatedTransitioning.h"

@implementation HMTransition
SingletonM(transition)

#pragma mark - UIViewControllerTransitioningDelegate

/**
 *  设置跳转管理类
 *
 *  @param presented  <#presented description#>
 *  @param presenting <#presenting description#>
 *  @param source     <#source description#>
 *
 *  @return <#return value description#>
 */
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[HMPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}


/**
 *  设置显示动画
 *
 *  @param presented  <#presented description#>
 *  @param presenting <#presenting description#>
 *  @param source     <#source description#>
 *
 *  @return <#return value description#>
 */
- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    HMAnimatedTransitioning *anim = [[HMAnimatedTransitioning alloc] init];
    anim.presented = YES;
    return anim;
}

/**
 *  设置dimiss动画
 *
 *  @param dismissed <#dismissed description#>
 *
 *  @return <#return value description#>
 */

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    HMAnimatedTransitioning *anim = [[HMAnimatedTransitioning alloc] init];
    anim.presented = NO;
    return anim;
}
@end
