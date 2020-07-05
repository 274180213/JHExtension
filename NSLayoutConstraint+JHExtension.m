//
//  NSLayoutConstraint+JHExtension.m
//  JHBaseClassDemo
//
//  Created by mac on 2020/6/22.
//  Copyright © 2020 JH Chen. All rights reserved.
//

#import "NSLayoutConstraint+JHExtension.h"
#import <objc/runtime.h>
@implementation NSLayoutConstraint (JHExtension)
@dynamic adapterScreen;
static char *adapterScreenKey = "adapterScreenKey";
- (void)setAdapterScreen:(BOOL)adapterScreen
{
    objc_setAssociatedObject(self, &adapterScreenKey, @(adapterScreen),OBJC_ASSOCIATION_ASSIGN);
    if (adapterScreen){
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        self.constant = self.constant * screenSize.width / 375.f;
    }
}
- (BOOL)adapterScreen
{
    NSNumber *numVaue = objc_getAssociatedObject(self, &adapterScreenKey);
    return [numVaue floatValue];
}
@end
