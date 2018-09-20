//
//  SingleVC.m
//  House
//
//  Created by zxf on 2018/6/29.
//  Copyright © 2018年 zxf. All rights reserved.
//

#import "SingleVC.h"
@interface SingleVC ()

@property (weak, nonatomic) IBOutlet UIButton *seven;
@property (weak, nonatomic) IBOutlet UIButton *eight;

@end

@implementation SingleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (systemVersion.doubleValue >= 8.0) {
        _seven.frame = CGRectMake(kScreenW*(0.4),  kScreenH*(0.260),kScreenW*(0.108) , kScreenH * (0.161));
        
        _eight.frame =CGRectMake(kScreenW*(0.314),  kScreenH*(0.455),kScreenW*(0.108) , kScreenH * (0.161));
    } else {
        _seven.frame = CGRectMake(kScreenH*(0.4),  kScreenW*(0.260),kScreenH*(0.108) , kScreenW * (0.161));
        
        _eight.frame =CGRectMake(kScreenH*(0.314),  kScreenW*(0.455),kScreenH*(0.108) , kScreenW * (0.161));
    }
  
}

- (IBAction)seven:(id)sender {
    NSArray *imageArray = @[@"7#.jpg"];
    CycleViewController *vc = [CycleViewController new];
    vc.imageArray = imageArray.mutableCopy;
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)eight:(id)sender {
    NSArray *imageArray = @[@"8#.jpg"];
    CycleViewController *vc = [CycleViewController new];
    vc.imageArray = imageArray.mutableCopy;
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
