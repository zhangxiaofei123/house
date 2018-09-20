//
//  FutureWorldViewController.m
//  House
//
//  Created by zxf on 2018/6/27.
//  Copyright © 2018年 zxf. All rights reserved.
//

#import "FutureWorldViewController.h"
//#import "VideoPlayerViewController.h"
#import "PViewController.h"

@interface FutureWorldViewController ()<CycleViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property(nonatomic,strong)AnimationImageView *imgView;

@end

@implementation FutureWorldViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.imgView];
    self.bgImageView.image = [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"future_world_bg.png" ofType:nil] ];
}

-(AnimationImageView *)imgView
{
    if (!_imgView) {
        _imgView = [[AnimationImageView alloc] initImageName:@"future_world_clear.jpg"];
    }
    return _imgView;
}

- (IBAction)location:(id)sender
{
    CycleViewController *vc = [CycleViewController new];
    NSMutableArray *array = [NSMutableArray new];
    for (int i=1; i<17; i++) {
        [array addObject:[NSString stringWithFormat:@"light_system_%d.jpg",i]];
    }
    vc.imageArray = array;
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)traffic:(id)sender
{
    CycleViewController *vc = [CycleViewController new];
    vc.deleagte = self;
    vc.imageArray = @[@"teacher_1.jpg",@"teacher_6.jpg",@"teacher_2.jpg",@"teacher_3.jpg",@"teacher_7.jpg",@"teacher_4.jpg",@"teacher_5.jpg"].mutableCopy;
     vc.showButtonArray = @[@"YES",@"NO",@"YES",@"YES",@"NO",@"YES",@"YES"].mutableCopy;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)clickImage:(NSInteger)index
{
    if (index==1 || index==4) return;
    PViewController *vc = [[PViewController alloc] init];
    NSString *path = [NSString stringWithFormat:@"teacher_%ld",index];
    NSString *url = [[NSBundle mainBundle] pathForResource:path ofType:@"mp4"];
    vc.assetUrlString = url;
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)support:(id)sender
{
    PViewController *vc = [[PViewController alloc] init];
    NSString *url =  [[NSBundle mainBundle] pathForResource:@"intr" ofType:@"mp4"];
    vc.assetUrlString =  url;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)dealloc{
    self.bgImageView = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
