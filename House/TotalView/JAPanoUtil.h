//
//  JAPanoUtil.h
//  JAPanoViewDemo
//
//  Created by 张孝飞 on 2018/7/10.
//  Copyright © 2018年 张孝飞. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "JAPanoView.h"

@protocol HotspotDelegate <NSObject>
-(void)hotspot:(NSString *)hotspotName;

-(void)JAPanoViewDidPan:(JAPanoView*)panoView;
-(void)JAPanoViewDidZoom:(JAPanoView*)panoView;

-(void)JAPanoViewWillBeginPanning:(JAPanoView*)panoView;
-(void)JAPanoViewWillBeginZooming:(JAPanoView *)panoView;

-(void)JAPanoViewDidEndPanning:(JAPanoView *)panoView;
-(void)JAPanoViewDidEndZooming:(JAPanoView *)panoView;
@end

@protocol HotspotIntroDelegate <NSObject>
-(void)HotspotIntro:(NSString *)hotspotName;
-(void)HotspotIntroduction:(NSString *)hotspotName;

@end
@interface JAPanoUtil : UIView

typedef NS_ENUM(NSUInteger, SphereFace) {
    SphereFaceFront,
    SphereFaceLeft,
    SphereFaceBack,
    SphereFaceRight,
    SphereFaceUp,
    SphereFaceDown,
};
typedef NS_ENUM(NSUInteger, HotspotType) {
    HotspotTypeIntroduction,
    HotspotTypeDefault,
};
@property (nonatomic,weak) id <HotspotDelegate> delegate ;
@property (nonatomic,weak) id <HotspotIntroDelegate> introDelegate ;

@property (nonatomic,copy) NSString *posString;

-(void)addHotspotWithImageName:(NSString *)imageName face:(SphereFace)face HotspotType:(HotspotType)type pos:(CGPoint)pos rotate:(double)rotate key:(NSString *)key;
@end
