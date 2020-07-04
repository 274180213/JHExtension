//
//  UIViewController+JHExtension.h
//  JHBaseClassDemo
//
//  Created by mac on 2020/6/21.
//  Copyright © 2020 JH Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (JHExtension)
/**
*  视图控制器入栈
*
*  @param classOrName 类名(字符串和类)
*  @param animated    动画
*/
- (void)jh_pushViewControllerWithClassOrName:(id)classOrName
                                    animated:(BOOL)animated;
/**
*  模态推视图控制器
*
*  @param classOrName 类名(字符串和类)
*  @param animated    动画
*/
-(void)jh_presentViewControllerWithClassOrName:(id)classOrName
                                      animated:(BOOL)animated
                                    completion:(void (^ __nullable)(void))completion;
/**
*  视图控制器出栈
*
*  @param classOrName 类名(字符串和类)
*  @param animated    动画
*/
- (void)jh_popViewControllerWithClassOrName:(id)classOrName
                                   animated:(BOOL)animated;
/**
*  根据下标索引标签栏子控制器
*
*  @param index      下标
*  @param completion 完成回调
*/
- (void)jh_popToTabBarSubViewControllerWithIndex:(NSInteger)index
                                      completion:(void (^)(void))completion;
@end

NS_ASSUME_NONNULL_END
