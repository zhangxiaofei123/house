//
//  NaturalHarmonyViewController.m
//  House
//
//  Created by zxf on 2018/6/27.
//  Copyright © 2018年 zxf. All rights reserved.
//

#import "NaturalHarmonyViewController.h"
@interface NaturalHarmonyViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property(nonatomic,strong)AnimationImageView *imgView;
@end

@implementation NaturalHarmonyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.imgView];
     _bgImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"natural_harmony_bg.png" ofType:nil]];
}

-(AnimationImageView *)imgView {
    if (!_imgView) {
        _imgView = [[AnimationImageView alloc] initImageName:@"natural_harmony_clear.jpg"];
    }
    return _imgView;
}


- (IBAction)location:(id)sender {
    CycleViewController *vc = [CycleViewController new];
    vc.imageArray = @[@"peripheral_landscape1.jpg",@"peripheral_landscape2.jpg"].mutableCopy;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)support:(id)sender {
    CycleViewController *vc = [CycleViewController new];
    
    NSMutableArray *array = [NSMutableArray new];
    for (int i=1; i<42; i++) {
        [array addObject:[NSString stringWithFormat:@"community_%d.jpg",i]];
    }
    vc.imageArray = array;
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
