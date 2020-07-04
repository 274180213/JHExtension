//
//  NSDictionary+JHExtension.h
//  JHBaseClassDemo
//
//  Created by mac on 2020/6/22.
//  Copyright © 2020 JH Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (JHExtension)
/**
*  打印属性名
*
*  @param dictionary 模型中属性根据字典的key
*/
+(void)jh_printPropertyName:(NSDictionary*)dictionary;
@end

NS_ASSUME_NONNULL_END
