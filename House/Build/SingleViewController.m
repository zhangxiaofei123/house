//
//  SingleViewController.m
//  House
//
//  Created by zxf on 2018/6/29.
//  Copyright © 2018年 zxf. All rights reserved.
//

#import "SingleViewController.h"
#import <sys/utsname.h>
@interface SingleViewController ()
@property (weak, nonatomic) IBOutlet UIButton *one;
@property (weak, nonatomic) IBOutlet UIButton *two;
@property (weak, nonatomic) IBOutlet UIButton *three;
@property (weak, nonatomic) IBOutlet UIButton *four;
@property (weak, nonatomic) IBOutlet UIButton *five;
@property (weak, nonatomic) IBOutlet UIButton *six;
@property (weak, nonatomic) IBOutlet UIButton *seven;
@property (weak, nonatomic) IBOutlet UIButton *eight;

@end

@implementation SingleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (IBAction)one:(id)sender {
}
- (IBAction)two:(id)sender {
}
- (IBAction)three:(id)sender {
}
- (IBAction)four:(id)sender {
}
- (IBAction)five:(id)sender {
}
- (IBAction)six:(id)sender {
}
- (IBAction)seven:(id)sender {
    CycleViewController *vc = [CycleViewController new];
    vc.imageArray = @[@"7#.jpg"].mutableCopy;
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)eight:(id)sender {
    CycleViewController *vc = [CycleViewController new];
    vc.imageArray = @[@"8#.jpg"].mutableCopy;
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
