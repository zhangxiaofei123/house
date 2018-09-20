//
//  RadarBtn.m
//  House
//
//  Created by apple on 2018/9/2.
//  Copyright © 2018年 张孝飞. All rights reserved.
//

#import "RadarBtn.h"

@implementation RadarBtn

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
    CGRect frame = CGRectMake((rect.size.width*2)/5,(rect.size.height*2)/5,rect.size.width/5,rect.size.height/5);
    CGContextAddEllipseInRect(ctx, frame);
    [[UIColor colorWithRed:(64.0f/255.f) green:(224.f/255.f) blue:(208.f/255.f) alpha:0.8] set];
    CGContextFillPath(ctx);
    
    NSInteger pulsingCount = 3;
    double animationDuration = 3;
    CALayer * animationLayer = [CALayer layer];
    for (int i = 0; i < pulsingCount; i++) {
        CALayer * pulsingLayer = [CALayer layer];
        pulsingLayer.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
        pulsingLayer.borderColor = [UIColor whiteColor].CGColor;
        pulsingLayer.borderWidth = 2.2f;
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
        scaleAnimation.removedOnCompletion = NO;
        scaleAnimation.fillMode = kCAFillModeForwards;


        CAKeyframeAnimation * opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
        opacityAnimation.values = @[@1, @0.9, @0.8, @0.7, @0.6, @0.5, @0.4, @0.3, @0.2, @0.1, @0];
        opacityAnimation.keyTimes = @[@0, @0.1, @0.2, @0.3, @0.4, @0.5, @0.6, @0.7, @0.8, @0.9, @1];
        opacityAnimation.removedOnCompletion = NO;
        opacityAnimation.fillMode = kCAFillModeForwards;

        animationGroup.animations = @[scaleAnimation, opacityAnimation];
        [pulsingLayer addAnimation:animationGroup forKey:@"pulsing"];
        [animationLayer addSublayer:pulsingLayer];
        animationGroup.removedOnCompletion = NO;
        opacityAnimation.fillMode = kCAFillModeForwards;


        //        CALayer * centerLayer = [CALayer layer];
        //        centerLayer.frame = CGRectMake(0, 0, rect.size.width / 2, rect.size.height/2);
        //        centerLayer.borderColor = [UIColor whiteColor].CGColor;
        //        centerLayer.cornerRadius = rect.size.height / 2;
    }
    [self.layer addSublayer:animationLayer];
    self.backgroundColor = [UIColor redColor];
    
}
@end
