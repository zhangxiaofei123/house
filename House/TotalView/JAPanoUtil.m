//
//  JAPanoUtil.m
//  JAPanoViewDemo
//
//  Created by 张孝飞 on 2018/7/10.
//  Copyright © 2018年 张孝飞. All rights reserved.
//

#import "JAPanoUtil.h"
#import "RadarBtn.h"
@interface JAPanoUtil()<JAPanoViewDelegate>
@property (nonatomic,strong) JAPanoView *panoView;

@end
@implementation JAPanoUtil
-(instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self addSubview:self.panoView];
    }
    return self;
}

-(void)setPosString:(NSString *)posString {
    _posString = posString;
    [self updatePanorama];
}

-(JAPanoView*)panoView {
    if (!_panoView) {
        _panoView = [[JAPanoView alloc]initWithFrame:self.frame];
        _panoView.delegate = self;
    }
    return _panoView;
}

-(void)updatePanorama {
    
    for (UIView *subview in _panoView.subviews) {
        if ([subview isKindOfClass: [UIButton class]]) {
            [subview removeFromPanoView];
        }
    }
    
    [_panoView setFrontImage: [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@.bundle/front.jpg",_posString] ofType:nil]] rightImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@.bundle/right.jpg",_posString] ofType:nil]] backImage: [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@.bundle/back.jpg",_posString] ofType:nil]] leftImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@.bundle/left.jpg",_posString] ofType:nil]] topImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@.bundle/top.jpg",_posString] ofType:nil]] bottomImage: [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@.bundle/bottom.jpg",_posString] ofType:nil]]];
    
    if ([self.delegate respondsToSelector:@selector(hotspot:)]) {
        [self.delegate hotspot:_posString];
    }
    
  
    if ([self.introDelegate respondsToSelector:@selector(HotspotIntro:)]) {
        [self.introDelegate HotspotIntro:_posString];
    }
}

-(void)addHotspotWithImageName:(NSString *)imageName face:(SphereFace)face HotspotType:(HotspotType)type pos:(CGPoint)pos rotate:(double)rotate key:(NSString *)key {
    
    CGFloat x = pos.x;
    CGFloat y = pos.y;
    
    if (x<0||x>1||y<0||y>1) {
        NSLog(@"x,y大于0小于1!");
        return;
    }
    CGFloat ath ;
    CGFloat atv ;
    CGFloat angleX = 0.0 ;
    if (face == SphereFaceRight) {
        angleX = M_PI_4;
    }else if (face == SphereFaceBack) {
        angleX = M_PI-M_PI_4  ;
    }else if (face == SphereFaceLeft) {
        angleX = M_PI+M_PI_4;
    }else if (face == SphereFaceFront) {
        angleX = 2*M_PI-M_PI_4;
    }
    if (x==0) {
        ath = 0 + angleX;
    }else if (x<0.5) {
        x = 1 - 2*x;
        CGFloat q = atanf(x);
        ath = (M_PI_4- q)+ angleX;
    }else if (x==0.5){
        ath = M_PI_4+ angleX;
    }else if (x>0.5&&x<1){
        x = 2*x - 1;
        CGFloat q = atanf(x);
        ath = M_PI_4+q+ angleX;
    }else {
        ath = M_PI_2+ angleX;
    }
    
    if (y==0) {
        atv = -M_PI_4;
    }else if (y<0.5) {
        y = 1 - 2*y;
        CGFloat q = atanf(y);
        atv = -q;
    }else if (y==0.5){
        atv = 0;
    }else if (y>0.5&&y<1){
        y = 2*y - 1;
        CGFloat q = atanf(y);
        atv = q;
    }else {
        atv = M_PI_4;
    }
    
//    UIButton * hot = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
//    hot.backgroundColor = [UIColor clearColor];
//    [hot setTitle:key forState:UIControlStateNormal];
//    [hot setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
//    [hot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:nil]] forState:UIControlStateNormal];
//    hot.imageView.transform = CGAffineTransformMakeRotation(M_PI*rotate);

    RadarBtn *hot =[[RadarBtn alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [hot setTitle:key forState:UIControlStateNormal];
    hot.titleLabel.alpha = 0;
    if (type == HotspotTypeIntroduction) {
        [hot addTarget:self action:@selector(HotspotIntroduction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    if (type == HotspotTypeDefault) {
        [hot addTarget:self action:@selector(pressHot:) forControlEvents:UIControlEventTouchUpInside];
        
    }

    [_panoView addHotspot:(UIView *)hot atHAngle:ath vAngle:atv];
//    [self group:hot];
    
}

- (void)pressHot:(UIButton*)sender{
    self.posString = sender.titleLabel.text;
}
- (void)HotspotIntroduction:(UIButton*)sender{
    
    if ([self.introDelegate respondsToSelector:@selector(HotspotIntroduction:)]) {
        [self.introDelegate HotspotIntroduction:sender.titleLabel.text];
    }
}
-(void)dealloc {
    _panoView = nil;
}
- (void)group:(UIButton *)sender
{
    // 比例缩放
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    // 终止scale
    animation3.toValue = @(0.5);
    
    CABasicAnimation *animation4 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    // 终止scale
    animation4.toValue = @(1);
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    // 持续时间
    group.duration = 1;
    // 重复次数
    group.repeatCount = MAXFLOAT;
    // 动画结束是否恢复原状
    group.removedOnCompletion = YES;
    
    // 动画组
    group.animations = [NSArray arrayWithObjects: animation3, animation4, nil];
    // 添加动画
    [sender.layer addAnimation:group forKey:@"group"];
}

-(void)panoViewDidPan:(JAPanoView*)panoView {
    if ([self.delegate respondsToSelector:@selector(JAPanoViewDidPan:)]) {
        [self.delegate JAPanoViewDidPan:panoView];
    }
}

-(void)panoViewDidZoom:(JAPanoView*)panoView{
    if ([self.delegate respondsToSelector:@selector(JAPanoViewDidZoom:)]) {
        [self.delegate JAPanoViewDidZoom:panoView];
    }
}

-(void)panoViewWillBeginPanning:(JAPanoView*)panoView{
    if ([self.delegate respondsToSelector:@selector(JAPanoViewWillBeginPanning:)]) {
        [self.delegate JAPanoViewWillBeginPanning:panoView];
    }
}
-(void)panoViewWillBeginZooming:(JAPanoView *)panoView{
    if ([self.delegate respondsToSelector:@selector(JAPanoViewWillBeginZooming:)]) {
        [self.delegate JAPanoViewWillBeginZooming:panoView];
    }
}

-(void)panoViewDidEndPanning:(JAPanoView *)panoView{
    if ([self.delegate respondsToSelector:@selector(JAPanoViewDidEndPanning:)]) {
        [self.delegate JAPanoViewDidEndPanning:panoView];
    }
}
-(void)panoViewDidEndZooming:(JAPanoView *)panoView{
    if ([self.delegate respondsToSelector:@selector(JAPanoViewDidEndZooming:)]) {
        [self.delegate JAPanoViewDidEndZooming:panoView];
    }
}
@end
