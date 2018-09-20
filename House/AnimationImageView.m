//
//  AnimationImageView.m
//  House
//
//  Created by zxf on 2018/6/28.
//  Copyright © 2018年 zxf. All rights reserved.
//

#import "AnimationImageView.h"
@interface AnimationImageView()

@end
@implementation AnimationImageView

-(instancetype)initImageName:(NSString *)imageName{
    if ([super init]) {

        if (systemVersion.doubleValue >= 8.0) {
            self.frame = CGRectMake(0, 0, kScreenW, kScreenH);
        } else {
            self.frame = CGRectMake(0, 0, kScreenH, kScreenW);
        }
        self.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:nil]];

        [self animation];
    }
    return self;
}

-(void)animation {
//    [UIView animateKeyframesWithDuration:3.f
//                                   delay:0.0
//                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear
//                              animations:^{
//                                  [UIView addKeyframeWithRelativeStartTime:0.0
//                                                          relativeDuration:3.0
//                                                                animations:^{
//                                                                    self.alpha = 0.0;
//                                                                }];
//                                  [self removeFromSuperview];
//                              }
//                              completion:^(BOOL finished) {
//                              }];
    
    NSTimeInterval duration = 3;
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 0.f;
    } completion:^(BOOL finished) {
       [self removeFromSuperview];
    }];
}

@end



