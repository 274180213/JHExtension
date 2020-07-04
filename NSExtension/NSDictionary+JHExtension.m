//
//  NSDictionary+JHExtension.m
//  JHBaseClassDemo
//
//  Created by mac on 2020/6/22.
//  Copyright © 2020 JH Chen. All rights reserved.
//

#import "NSDictionary+JHExtension.h"

@implementation NSDictionary (JHExtension)
/**
*  打印属性名
*
*  @param dictionary 模型中属性根据字典的key
*/
+(void)jh_printPropertyName:(NSDictionary*)dictionary
{
    // 有多少个key，生成多少个属性
    NSMutableString *codes = [NSMutableString string];
    
    // 遍历字典
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *code = nil;
        // 模型中属性根据字典的key
        if ([obj isKindOfClass:[NSString class]]) { // NSString
            code = [NSString stringWithFormat:@"@property(nonatomic,strong)NSString *%@;", key];
        } else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) { // BOOL
            code = [NSString stringWithFormat:@"@property(nonatomic,assign)BOOL *%@;", key];
        } else if ([obj isKindOfClass:[NSNumber class]]) { // NSNumber
            code = [NSString stringWithFormat:@"@property(nonatomic,assign)NSNumber %@;", key];
        } else if ([obj isKindOfClass:[NSArray class]]) { // NSArray
            code = [NSString stringWithFormat:@"@property(nonatomic,strong)NSArray *%@;", key];
        } else if ([obj isKindOfClass:[NSDictionary class]]) { // NSDIctionary
            code = [NSString stringWithFormat:@"@property(nonatomic,strong)NSDictionary *%@;", key];
        }else if ([obj isKindOfClass:[NSDecimalNumber class]]){
            code = [NSString stringWithFormat:@"@property(nonatomic,strong)NSDecimalNumber *%@;", key];
        }
        [codes appendFormat:@"\n%@", code];
        NSLog(@"%@",codes);
    }];
}
@end
