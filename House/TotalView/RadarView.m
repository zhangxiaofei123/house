//
//  RadarView.m
//  House
//
//  Created by apple on 2018/9/2.
//  Copyright © 2018年 张孝飞. All rights reserved.
//

#import "RadarView.h"

@implementation RadarView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.opaque = NO;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect frame = CGRectMake((rect.size.width*3)/8,(rect.size.height*3)/8,rect.size.width/4,rect.size.height/4);
    CGContextAddEllipseInRect(ctx, frame);
    [[UIColor colorWithRed:0/225 green:0/225 blue:1 alpha:0.6] set];
    CGContextFillPath(ctx);
    
    NSInteger pulsingCount = 3;
    double animationDuration = 3;
    CALayer * animationLayer = [CALayer layer];
    for (int i = 0; i < pulsingCount; i++) {
        CALayer * pulsingLayer = [CALayer layer];
        pulsingLayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
        pulsingLayer.borderColor = [UIColor whiteColor].CGColor;
        pulsingLayer.borderWidth = 1;
        pulsingLayer.cornerRadius = rect.size.height / 2;
        
        CAMediaTimingFunction * defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        
        CAAnimationGroup * animationGroup = [CAAnimationGroup animation];
        animationGroup.fillMode = kCAFillModeBackwards;
        animationGroup.beginTime = CACurrentMediaTime() + (double)i * animationDuration / (double)pulsingCount;
        animationGroup.duration = animationDuration;
        animationGroup.repeatCount = HUGE;
        animationGroup.timingFunction = defaultCurve;
        
        CABasicAnimation * scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.fromValue = @0.2;
        scaleAnimation.toValue = @1;
        
        CAKeyframeAnimation * opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.values = @[@1, @0.9, @0.8, @0.7, @0.6, @0.5, @0.4, @0.3, @0.2, @0.1, @0];
        opacityAnimation.keyTimes = @[@0, @0.1, @0.2, @0.3, @0.4, @0.5, @0.6, @0.7, @0.8, @0.9, @1];
        
        animationGroup.animations = @[scaleAnimation, opacityAnimation];
        [pulsingLayer addAnimation:animationGroup forKey:@"pulsing"];
        [animationLayer addSublayer:pulsingLayer];
        
//        CALayer * centerLayer = [CALayer layer];
//        centerLayer.frame = CGRectMake(0, 0, rect.size.width / 2, rect.size.height/2);
//        centerLayer.borderColor = [UIColor whiteColor].CGColor;
//        centerLayer.cornerRadius = rect.size.height / 2;
    }
    [self.layer addSublayer:animationLayer];
    self.backgroundColor = [UIColor redColor];
    
}
@end
