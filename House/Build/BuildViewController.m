//
//  BuildViewController.m
//  House
//
//  Created by zxf on 2018/6/27.
//  Copyright © 2018年 zxf. All rights reserved.
//

#import "BuildViewController.h"
#import "BirdSeeViewController.h"
#import "SingleViewController.h"
#import "SingleVC.h"
@interface BuildViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property(nonatomic,strong)AnimationImageView *imgView;
@end

@implementation BuildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;

    [self.view addSubview:self.imgView];
    _bgImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"build_bg.png" ofType:nil]];
    
}

-(AnimationImageView *)imgView {
    if (!_imgView) {
        _imgView = [[AnimationImageView alloc] initImageName:@"natural_harmony_clear.jpg"];
    }
    return _imgView;
}


- (IBAction)location:(id)sender {
    BirdSeeViewController *vc = [BirdSeeViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)support:(id)sender {
//    SingleVC *vc = [SingleVC new];
//    [self.navigationController pushViewController:vc animated:YES];
    CycleViewController *vc = [CycleViewController new];
    vc.imageArray = @[@"single_1.jpg",@"single_2.jpg",@"single_3.jpg",@"single_4.jpg",@"single_5.jpg",@"single_6.jpg"].mutableCopy;
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
