//
//  CycleViewController.m
//  House
//
//  Created by zxf on 2018/6/27.
//  Copyright © 2018年 zxf. All rights reserved.
//

#import "CycleViewController.h"
#import "SDCycleScrollView.h"

@interface CycleViewController ()<SDCycleScrollViewDelegate>
@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycleScrollView;

@end

@implementation CycleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _cycleScrollView.autoScroll = NO;
    _cycleScrollView.localizationImageNamesGroup = _imageArray;
    _cycleScrollView.playerButtonGroup = _showButtonArray;
    _cycleScrollView.delegate =self;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    if ([self.deleagte respondsToSelector:@selector(clickImage:)]) {
        [self.deleagte clickImage:index];
    }
    
}
-(void)setImageArray:(NSMutableArray *)imageArray{
    _imageArray = imageArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
