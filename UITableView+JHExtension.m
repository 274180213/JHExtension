//
//  UITableView+JHExtension.m
//  JHBaseClassDemo
//
//  Created by mac on 2020/6/21.
//  Copyright © 2020 JH Chen. All rights reserved.
//

#import "UITableView+JHExtension.h"

@implementation UITableView (JHExtension)
- (void)registerCellClass:(Class)cellClass
{
    [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

- (void)registerCellClasses:(NSArray *)cellClasses
{
    for (Class cellClass in cellClasses) {
        [self registerCellClass:cellClass];
    }
}
-(void)registerNibClass:(Class)cellClass
{
    [self registerNib:[UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil] forCellReuseIdentifier:NSStringFromClass(cellClass)];
}
-(void)registerNibClasses:(NSArray*)cellClasses
{
    for (Class cellClass in cellClasses) {
        [self registerNibClass:cellClass];
    }
}
@end
