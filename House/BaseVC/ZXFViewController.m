//
//  ZXFViewController.m
//  SDSecondApp
//
//  Created by zxf on 16/10/9.
//  Copyright © 2016年 zxf. All rights reserved.
//

#import "ZXFViewController.h"

@interface ZXFViewController ()


@end

@implementation ZXFViewController

//-(id)init
//{
//    if (self == [super init]) {
//
//    }
//    return self;
//}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.waterImgView];

    
}

-(UIButton *)backButton {
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (systemVersion.doubleValue >= 8.0) {
            _backButton.frame = CGRectMake(kScreenW-100, 50, 80, 80);
        } else {
            _backButton.frame = CGRectMake(kScreenH-100, 50, 80, 80);
        }
        _backButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_backButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"return.png" ofType:nil]] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}




-(UIImageView *)waterImgView {
    if (!_waterImgView) {
        if (systemVersion.doubleValue >= 8.0) {
            _waterImgView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenW-360,kScreenH-120, 350, 78) ];
        } else {
            _waterImgView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenH-360,kScreenW-120, 350, 78) ];
        }
        _waterImgView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"msr.png" ofType:nil]];
        _waterImgView.userInteractionEnabled = YES;
        
    }
    return _waterImgView;
}

-(void)back {
    [self.navigationController popViewControllerAnimated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
