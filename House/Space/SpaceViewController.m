//
//  SpaceViewController.m
//  House
//
//  Created by zxf on 2018/6/27.
//  Copyright © 2018年 zxf. All rights reserved.
//

#import "SpaceViewController.h"
#import "TotalViewController.h"
#import "TViewController.h"

@interface SpaceViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property(nonatomic,strong)AnimationImageView *imgView;

@end

@implementation SpaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.imgView];
    _bgImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"space_bg.png" ofType:nil]];

}

-(AnimationImageView *)imgView {
    if (!_imgView) {
        _imgView = [[AnimationImageView alloc] initImageName:@"space_clear.jpg"];
    }
    return _imgView;
}


- (IBAction)location:(id)sender {
    CycleViewController *vc = [CycleViewController new];
    vc.imageArray = @[@"143tu.jpg"].mutableCopy;
    //    vc.imageArray = @[@"140平米.jpg"].mutableCopy;
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)traffic:(id)sender {
//    TotalViewController *vc = [TotalViewController new];
    CycleViewController *vc = [CycleViewController new];
    vc.imageArray = @[@"165tu.jpg"].mutableCopy;
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)support:(id)sender {
    CycleViewController *vc = [CycleViewController new];
    vc.imageArray = @[@"195tu.jpg"].mutableCopy;
//    TViewController *vc = [TViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
