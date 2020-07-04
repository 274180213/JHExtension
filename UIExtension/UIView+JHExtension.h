//
//  UIView+JHExtension.h
//  JHBaseClassDemo
//
//  Created by mac on 2020/6/22.
//  Copyright © 2020 JH Chen. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface UIView (JHExtension)
/**
*  xib设置边框宽度
*/
@property (nonatomic,assign)IBInspectable CGFloat  borderWidth;
/**
*  xib设置边框颜色
*/
@property (nonatomic,strong)IBInspectable UIColor *borderColor;
/**
*  xib设置圆角
*/
@property (nonatomic,assign)IBInspectable CGFloat  cornerRadius;
@end

NS_ASSUME_NONNULL_END
