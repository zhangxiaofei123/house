//
//  CycleViewController.m
//  House
//
//  Created by zxf on 2018/6/27.
//  Copyright © 2018年 zxf. All rights reserved.
//

#import "RotationViewController.h"
#import "SDCycleScrollView.h"

@interface RotationViewController ()
@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycleScrollView;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

@end

@implementation RotationViewController
- (IBAction)RotationViewController:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _cycleScrollView.autoScroll = NO;
    _cycleScrollView.localizationImageNamesGroup = _imageArray;
    [self.view bringSubviewToFront:self.cancelBtn];

}

-(void)setImageArray:(NSMutableArray *)imageArray{
    _imageArray = imageArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
