//
//  UIViewController+JHExtension.m
//  JHBaseClassDemo
//
//  Created by mac on 2020/6/21.
//  Copyright © 2020 JH Chen. All rights reserved.
//

#import "UIViewController+JHExtension.h"

@implementation UIViewController (JHExtension)
/*  视图控制器入栈
*
*  @param classOrName 类名(字符串和类)
*  @param animated    动画
*/
- (void)jh_pushViewControllerWithClassOrName:(id)classOrName animated:(BOOL)animated
{
    if (classOrName) {
        Class classs;
        if ([classOrName isKindOfClass:[NSString class]]) {
            NSString *name = classOrName;
            classs = NSClassFromString(name);
        } else if ([classOrName isSubclassOfClass:[UIViewController class]]) {
            classs = classOrName;
        }
        UIViewController *vc = [classs new];
        if (vc) {
            [self.navigationController pushViewController:vc animated:animated];
        }
    }
}
/**
*  模态推视图控制器
*
*  @param classOrName 类名(字符串和类)
*  @param animated    动画
*/
-(void)jh_presentViewControllerWithClassOrName:(id)classOrName
                                      animated:(BOOL)animated
                                    completion:(void (^ __nullable)(void))completion
{
    if (classOrName) {
        Class classs;
        if ([classOrName isKindOfClass:[NSString class]]) {
            NSString *name = classOrName;
            classs = NSClassFromString(name);
        } else if ([classOrName isSubclassOfClass:[UIViewController class]]) {
            classs = classOrName;
        }
        UIViewController *vc = [classs new];
        if (vc) {
            vc.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:vc animated:animated completion:completion];
        }
    }
}
/**
*  视图控制器出栈
*
*  @param classOrName 类名(字符串和类)
*  @param animated    动画
*/
- (void)jh_popViewControllerWithClassOrName:(id)classOrName animated:(BOOL)animated
{
    if (classOrName) {
        Class classs;
        if ([classOrName isKindOfClass:[NSString class]]) {
            NSString *name = classOrName;
            classs = NSClassFromString(name);
        } else if ([classOrName isSubclassOfClass:[UIViewController class]]) {
            classs = classOrName;
        }
        [self.navigationController.viewControllers enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:classs]) {
                [self.navigationController popToViewController:obj animated:YES];
                *stop = YES;
                return;
            }
        }];
    }
}
/**
*  根据下标索引标签栏子控制器
*
*  @param index      下标
*  @param completion 完成回调
*/
- (void)jh_popToTabBarSubViewControllerWithIndex:(NSInteger)index
                                       completion:(void (^)(void))completion
{
    UIWindow *keyWindow = [[UIApplication sharedApplication].windows objectAtIndex:0];
    NSInteger viewIndex = 0;
    for (UIView *view in keyWindow.subviews)
    {
        if (viewIndex > 0)
        {
            [view removeFromSuperview];
        }
        viewIndex++;
    }
    
    self.tabBarController.selectedIndex = index;
    if ([self.tabBarController presentedViewController]) {
        [self.tabBarController dismissViewControllerAnimated:NO completion:^{
            for (UINavigationController *nav in self
                 .tabBarController.viewControllers) {
                [nav popToRootViewControllerAnimated:NO];
            }
            if (completion)
                completion();
        }];
    } else {
        for (UINavigationController *nav in self
             .tabBarController.viewControllers) {
            [nav popToRootViewControllerAnimated:NO];
        }
        if (completion)
            completion();
    }
}
@end
