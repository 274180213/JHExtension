//
//  UIView+JHExtension.m
//  JHBaseClassDemo
//
//  Created by mac on 2020/6/22.
//  Copyright © 2020 JH Chen. All rights reserved.
//

#import "UIView+JHExtension.h"
#import <objc/runtime.h>
@implementation UIView (JHExtension)
@dynamic borderColor;
@dynamic borderWidth;
@dynamic cornerRadius;
/**
*  xib设置边框宽度
*/
static char *borderWidthKey = "borderWidthKey";
- (void)setBorderWidth:(CGFloat)borderWidth {
    objc_setAssociatedObject(self, &borderWidthKey, @(borderWidth),OBJC_ASSOCIATION_ASSIGN);
    if (borderWidth < 0) return;
    self.layer.borderWidth = borderWidth;
}
-(CGFloat)borderWidth
{
    NSNumber *numVaue = objc_getAssociatedObject(self, &borderWidthKey);
    return [numVaue floatValue];
}
/**
*  xib设置边框颜色
*/
static char *borderColorKey = "borderColorKey";
- (void)setBorderColor:(UIColor *)borderColor {
    objc_setAssociatedObject(self, &borderColorKey, borderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.layer.borderColor = borderColor.CGColor;
}
-(UIColor *)borderColor
{
    return objc_getAssociatedObject(self, &borderColorKey);
}
/**
*  xib设置圆角
*/
static char *cornerRadiusKey = "cornerRadiusKey";
- (void)setCornerRadius:(CGFloat)cornerRadius {
    objc_setAssociatedObject(self, &cornerRadiusKey, @(cornerRadius),OBJC_ASSOCIATION_ASSIGN);
    self.layer.cornerRadius = cornerRadius;
}
-(CGFloat)cornerRadius
{
    NSNumber *numVaue = objc_getAssociatedObject(self, &cornerRadiusKey);
    return [numVaue floatValue];
}
@end
