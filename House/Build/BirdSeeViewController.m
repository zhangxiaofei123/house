//
//  BirdSeeViewController.m
//  House
//
//  Created by zxf on 2018/6/29.
//  Copyright © 2018年 zxf. All rights reserved.
//

#import "BirdSeeViewController.h"

@interface BirdSeeViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic,strong)NSMutableArray *imageArray;
@property(nonatomic,assign)CGFloat imgW;
@property (weak, nonatomic) IBOutlet UIImageView *gestureGuideImageView;

@end

@implementation BirdSeeViewController

-(NSMutableArray *)imageArray {
    if (!_imageArray) {
        _imageArray = [NSMutableArray new];
    }
    return _imageArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    [self.view bringSubviewToFront:self.backButton];
    [self.view bringSubviewToFront:self.gestureGuideImageView];
    
    _imgW = 50;
    
    for (int i =0; i<251; i++) {
        [self.imageArray addObject:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"nk_00%03d.jpg",i] ofType:nil]];
    }
    self.scrollView.contentSize = CGSizeMake(_imgW*_imageArray.count+kScreenW, 0);
    self.scrollView.contentOffset = CGPointMake(_imgW, 0);
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    
    if (offsetX>=0) {
        NSInteger imageIndex = offsetX/_imgW;
        if (imageIndex>=_imageArray.count-1) {
            self.scrollView.contentOffset = CGPointMake(_imgW, 0);
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                _imageView.image = [UIImage imageWithContentsOfFile:_imageArray[imageIndex]];
            });
        }
        
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
