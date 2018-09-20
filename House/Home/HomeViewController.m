//
//  HomeViewController.m
//  House
//
//  Created by zxf on 2018/6/27.
//  Copyright © 2018年 zxf. All rights reserved.
//

#import "HomeViewController.h"
#import "LandLifeViewController.h"
#import "BuildViewController.h"
#import "TechnologyContinueViewController.h"
#import "NaturalHarmonyViewController.h"
#import "SpaceViewController.h"
#import "FutureWorldViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.backButton.hidden = YES;
}
//土地生命观
- (IBAction)landLife:(id)sender {
    LandLifeViewController *vc = [[LandLifeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
//建筑淡泊观
- (IBAction)buildClear:(id)sender {
    BuildViewController *vc = [[BuildViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
//工艺永续观
- (IBAction)technologyContinue:(id)sender {
    TechnologyContinueViewController *vc = [[TechnologyContinueViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
//自然和谐观
- (IBAction)naturalHarmony:(id)sender {
    NaturalHarmonyViewController *vc = [[NaturalHarmonyViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
//空间无限观
- (IBAction)unlimitedSpace:(id)sender {
    SpaceViewController *vc = [[SpaceViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
//未来世界观
- (IBAction)futureWorld:(id)sender {
    FutureWorldViewController *vc = [[FutureWorldViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
