//
//  TechnologyContinueViewController.m
//  House
//
//  Created by zxf on 2018/6/27.
//  Copyright © 2018年 zxf. All rights reserved.
//

#import "TechnologyContinueViewController.h"

@interface TechnologyContinueViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property(nonatomic,strong)AnimationImageView *imgView;
@end

@implementation TechnologyContinueViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.imgView];
    _bgImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"technology_continue_bg.png" ofType:nil]];
}

-(AnimationImageView *)imgView {
    if (!_imgView) {
        _imgView = [[AnimationImageView alloc] initImageName:@"technology_continue_clear.jpg"];
    }
    return _imgView;
}

- (IBAction)location:(id)sender {
    CycleViewController *vc = [CycleViewController new];
    vc.imageArray = @[@"chinese_style1.jpg"].mutableCopy;
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)traffic:(id)sender {
    CycleViewController *vc = [CycleViewController new];
    vc.imageArray = @[@"solar_panels1.jpg"].mutableCopy;
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)support:(id)sender {
    CycleViewController *vc = [CycleViewController new];
    vc.imageArray = @[@"facade_material1.jpg"].mutableCopy;
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
