//
//  LandLifeViewController.m
//  House
//
//  Created by zxf on 2018/6/27.
//  Copyright © 2018年 zxf. All rights reserved.
//

#import "LandLifeViewController.h"

@interface LandLifeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;


@property(nonatomic,strong)AnimationImageView *imgView;
@end

@implementation LandLifeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.imgView];
    
    _bgImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"land_life_bg.png" ofType:nil]];

}

-(AnimationImageView *)imgView {
    if (!_imgView) {
        _imgView = [[AnimationImageView alloc] initImageName:@"land_life_clear.jpg"];
    }
    return _imgView;
}

- (IBAction)location:(id)sender {
    CycleViewController *vc = [CycleViewController new];
    vc.imageArray = @[@"location1.jpg",@"location2.jpg",@"location3.jpg",@"location4.jpg"].mutableCopy;
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)traffic:(id)sender {
    CycleViewController *vc = [CycleViewController new];
    vc.imageArray = @[@"traffic1.jpg",@"traffic2.jpg",@"traffic3.jpg",@"traffic4.jpg"].mutableCopy;
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)support:(id)sender {
    CycleViewController *vc = [CycleViewController new];
    vc.imageArray = @[@"support1.jpg",@"support2.jpg",@"support3.jpg",@"support4.jpg"].mutableCopy;
    [self.navigationController pushViewController:vc animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
