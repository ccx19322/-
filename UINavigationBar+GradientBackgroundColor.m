//
//  UINavigationBar+GradientBackgroundColor.m
//  智慧工地
//
//  Created by Sam on 2017/2/14.
//  Copyright © 2017年 ESCST. All rights reserved.
//

#import "UINavigationBar+GradientBackgroundColor.h"

@implementation UINavigationBar (GradientBackgroundColor)

static float const kDefaultOpacity = 0.5f;

-(void)setGradientBackgroundColorWithColors:(NSArray *)colors{
    NSMutableArray *cgcolors = [NSMutableArray arrayWithCapacity:colors.count];
    [colors enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [cgcolors addObject:(id)[obj CGColor]];
    }];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.opacity = self.translucent ? kDefaultOpacity : 1.f;
    self.barTintColor = [UIColor clearColor];
    gradientLayer.frame = CGRectMake(0, -20, kScreenW, CGRectGetMaxY(self.bounds) + 20);
    gradientLayer.colors = cgcolors;
    [self.layer insertSublayer:gradientLayer atIndex:1];
}
@end
