//
//  NSLayoutConstraint+JHExtension.h
//  JHBaseClassDemo
//
//  Created by mac on 2020/6/22.
//  Copyright © 2020 JH Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSLayoutConstraint (JHExtension)
/**
*  xib比例适配
*/
@property(nonatomic, assign) IBInspectable BOOL adapterScreen;
@end

NS_ASSUME_NONNULL_END
