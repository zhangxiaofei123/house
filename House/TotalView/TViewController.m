//
//  TViewController.m
//  House
//
//  Created by zxf on 2018/6/29.
//  Copyright © 2018年 zxf. All rights reserved.
//

#import "TViewController.h"
#import "JAPanoUtil.h"
#import "MenuView.h"
#import "RotationViewController.h"
#import "AlterView.h"
@interface TViewController ()<HotspotDelegate,HotspotIntroDelegate>
@property (nonatomic,strong) JAPanoUtil *panoView;
@property (nonatomic,strong) MenuView *menuView;
@property (nonatomic,strong) UIButton *jumpButton;
@property (nonatomic,strong) UIImageView *houseImageView;

@property (nonatomic,strong) AlterView *alterView;
@property (nonatomic,strong) NSArray *imageArr;

@end

@implementation TViewController

-(UIButton *)jumpButton {
    if (!_jumpButton) {
        _jumpButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _jumpButton.frame = CGRectMake(kScreenW-100, 100, 180, 180);
        _jumpButton.center = CGPointMake(0, 0);
        _jumpButton.layer.cornerRadius = 90;
        _jumpButton.clipsToBounds=YES;
        [_jumpButton setTitle:@"户型图" forState: UIControlStateNormal];
        _jumpButton.backgroundColor = [UIColor grayColor];
        _jumpButton.alpha = 0.7;
        _jumpButton.titleEdgeInsets = UIEdgeInsetsMake(90, 75, 10, 10);
        [_jumpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_jumpButton addTarget:self action:@selector(showImageV:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jumpButton;
}

-(UIImageView *)houseImageView {
    if (!_houseImageView) {
        if (systemVersion.doubleValue >= 8.0) {
            _houseImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
        } else {
            _houseImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenH,kScreenW )];
        }
        _houseImageView.image = [UIImage imageNamed:@"190平米.jpg"];
        _houseImageView.alpha=0;
        _houseImageView.userInteractionEnabled = YES;
    }
    return _houseImageView;
}

-(JAPanoUtil*)panoView {
    if (!_panoView) {
        _panoView = [[JAPanoUtil alloc]initWithFrame:self.view.frame];
        _panoView.delegate=self;
        _panoView.introDelegate = self;
    }
    return _panoView;
}

-(void)showImageV:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        [UIView animateKeyframesWithDuration:1.f
                                       delay:0.0
                                     options:UIViewKeyframeAnimationOptionCalculationModeLinear
                                  animations:^{
                                      [UIView addKeyframeWithRelativeStartTime:0.0
                                                              relativeDuration:1.0
                                                                    animations:^{
                                                                        _houseImageView.alpha = 1.0;
                                                                    }];
                                  }
                                  completion:^(BOOL finished) {
                                  }];
    }else{
        [UIView animateKeyframesWithDuration:1.f
                                       delay:0.0
                                     options:UIViewKeyframeAnimationOptionCalculationModeLinear
                                  animations:^{
                                      [UIView addKeyframeWithRelativeStartTime:0.0
                                                              relativeDuration:1.0
                                                                    animations:^{
                                                                        _houseImageView.alpha = 0.0;
                                                                    }];
                                  }
                                  completion:^(BOOL finished) {
                                  }];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.panoView];
    [self.view addSubview:self.houseImageView];
    [self.view addSubview:self.jumpButton];
    
    _panoView.posString = @"190客厅";
    
    [self initMenuView];
    [self.view bringSubviewToFront:self.backButton];
    
//    UIImageView *imagev;
//    if (systemVersion.doubleValue >= 8.0) {
//        imagev = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreenH - 50, 50,50 )];
//
//    } else {
//        imagev = [[UIImageView alloc] initWithFrame:CGRectMake(0, kScreenW - 50, 50,50 )];
//    }
//    imagev.backgroundColor =[UIColor redColor];
//    [self.view addSubview:imagev];
//    [self.view bringSubviewToFront:imagev];

}

-(void)initMenuView{
    if (systemVersion.doubleValue >= 8.0) {
        _menuView = [[MenuView alloc] initWithFrame:CGRectMake(0, kScreenH-50, kScreenW, 180)];

    } else {
        
        _menuView = [[MenuView alloc] initWithFrame:CGRectMake(0, kScreenW-50, kScreenH, 180)];

    }
    _menuView.items = @[@{@"Key":@"190客厅",
                          @"ImageName":@"190客厅.bundle/right_s.jpg",
                          @"Title":@"客厅"},
                        @{@"Key":@"190主卧",
                          @"ImageName":@"190主卧.bundle/right_s.jpg",
                          @"Title":@"主卧"},
                        @{@"Key":@"190客卧",
                          @"ImageName":@"190客卧.bundle/right_s.jpg",
                          @"Title":@"客卧"},
                        @{@"Key":@"190女儿房",
                          @"ImageName":@"190女儿房.bundle/right_s.jpg",
                          @"Title":@"女儿房"},
                        @{@"Key":@"190书房",
                          @"ImageName":@"190书房.bundle/right_s.jpg",
                          @"Title":@"书房"},
                        @{@"Key":@"190厨房",
                          @"ImageName":@"190厨房.bundle/right_s.jpg",
                          @"Title":@"厨房"},
                        @{@"Key":@"190公卫",
                          @"ImageName":@"190公卫.bundle/right_s.jpg",
                          @"Title":@"公卫"},
                        @{@"Key":@"190主卫",
                          @"ImageName":@"190主卫.bundle/right_s.jpg",
                          @"Title":@"主卫"},
                        @{@"Key":@"190次卫",
                          @"ImageName":@"190次卫.bundle/right_s.jpg",
                          @"Title":@"次卫"}
                        ];
    MPWeakSelf(self)
    _menuView.hander = ^(NSDictionary *item) {
        MPStrongSelf(self)
        self.houseImageView.alpha=0;
        self.jumpButton.selected = NO;
        self.panoView.posString = item[@"Key"];
    };
    _menuView.expanHander = ^(MenuView *view, BOOL isExpan) {
        [UIView animateWithDuration:0.3 animations:^{
            if (isExpan) {
//                MPStrongSelf(self)
                if (systemVersion.doubleValue >= 8.0) {
                    view.frame = CGRectMake(0, kScreenH - view.bounds.size.height,
                                            kScreenW,
                                            180);
                } else {
                    view.frame = CGRectMake(0, kScreenW - view.bounds.size.height,
                                            kScreenH,
                                        180);
                }
                
            }else {
                if (systemVersion.doubleValue >= 8.0) {
                    view.frame = CGRectMake(0, kScreenH - 50,
                                            kScreenW,
                                            180);
                } else {
             
                    view.frame = CGRectMake(0, kScreenH - view.bounds.size.height,
                                            kScreenW,
                                            180);
                }
//                MPStrongSelf(self)
              
            }
        }];
    };
    if (systemVersion.doubleValue >= 8.0) {
        _menuView.frame = CGRectMake(0, kScreenH - 50,
                                     kScreenW,
                                     180);
    } else {
        
        _menuView.frame = CGRectMake(0, kScreenW - 50,
                                     kScreenH,
                                     180);
    }
  
    [self.view addSubview:_menuView];
}


-(void)HotspotIntro:(NSString *)hotspotName{
    
    if ([hotspotName isEqualToString:@"190客厅"]) {
        [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
                                          face:SphereFaceLeft HotspotType:HotspotTypeIntroduction
                                           pos:(CGPoint){0.921,0.55}
                                        rotate:0
                                           key:@"情景开关"];
        [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
                                          face:SphereFaceBack HotspotType:HotspotTypeIntroduction
                                           pos:(CGPoint){0.5,1-0.5}
                                        rotate:0
                                           key:@"智能窗帘"];
        [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
                                          face:SphereFaceLeft HotspotType:HotspotTypeIntroduction
                                           pos:(CGPoint){0.158,0.5}
                                        rotate:0
                                           key:@"智能家电"];
        [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
                                          face:SphereFaceLeft HotspotType:HotspotTypeIntroduction
                                           pos:(CGPoint){0.684,0.5}
                                        rotate:0
                                           key:@"智能面板"];
        [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
                                          face:SphereFaceUp HotspotType:HotspotTypeIntroduction
                                           pos:(CGPoint){0,1}
                                        rotate:0
                                           key:@"中央空调"];
        [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
                                          face:SphereFaceBack HotspotType:HotspotTypeIntroduction
                                           pos:(CGPoint){0.421,1-0.826}
                                        rotate:0
                                           key:@"远程控制"];
    }else if ([hotspotName isEqualToString:@"190客卧"]) {
        [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
                                          face:SphereFaceFront HotspotType:HotspotTypeIntroduction
                                           pos:(CGPoint){0.368,0.526}
                                        rotate:0
                                           key:@"智能窗帘"];
        [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
                                          face:SphereFaceLeft HotspotType:HotspotTypeIntroduction
                                           pos:(CGPoint){0.447,0.368}
                                        rotate:0
                                           key:@"智能灯光"];
    }else if ([hotspotName isEqualToString:@"190女儿房"]) {
        
        [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
                                          face:SphereFaceFront HotspotType:HotspotTypeIntroduction
                                           pos:(CGPoint){0.632,0.579}
                                        rotate:0
                                           key:@"智能窗帘"];
        [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
                                          face:SphereFaceRight HotspotType:HotspotTypeIntroduction
                                           pos:(CGPoint){0.474,0.474}
                                        rotate:0
                                           key:@"智能灯光"];
        
    }else if ([hotspotName isEqualToString:@"190主卧"]) {
        [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
                                          face:SphereFaceFront HotspotType:HotspotTypeIntroduction
                                           pos:(CGPoint){0.684,0.526}
                                        rotate:0
                                           key:@"智能窗帘"];
        [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
                                          face:SphereFaceRight HotspotType:HotspotTypeIntroduction
                                           pos:(CGPoint){0.474,0.474}
                                        rotate:0
                                           key:@"智能灯光"];
    }else if ([hotspotName isEqualToString:@"190主卫"]) {
        [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
                                          face:SphereFaceRight HotspotType:HotspotTypeIntroduction
                                           pos:(CGPoint){0.605,0.25}
                                        rotate:0
                                           key:@"智能家电2"];
    }else if ([hotspotName isEqualToString:@"190书房"]) {
        [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
                                          face:SphereFaceFront HotspotType:HotspotTypeIntroduction
                                           pos:(CGPoint){0.632,0.421}
                                        rotate:0
                                           key:@"智能灯光"];
    }
}
-(void)HotspotIntroduction:(NSString *)hotspotName{
    if ([hotspotName isEqualToString:@"情景开关"]) {
        _imageArr = [NSArray arrayWithObjects:@"情景开关.jpg",@"情景开关2.jpg",@"调光开关.jpg",nil];
        _alterView = [[AlterView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) andTitle:@"情景开关" andImageArray:_imageArr];
        [self.view addSubview:_alterView];
    }else if ([hotspotName isEqualToString:@"智能窗帘"]) {
        _imageArr = [NSArray arrayWithObjects:@"智能窗帘.jpg",nil];
        _alterView = [[AlterView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) andTitle:@"智能窗帘" andImageArray:_imageArr];
        [self.view addSubview:_alterView];
    }else if ([hotspotName isEqualToString:@"智能灯光"]) {
        _imageArr = [NSArray arrayWithObjects:@"智能灯光.jpg",@"智能灯光卧室.jpg",nil];
        _alterView = [[AlterView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) andTitle:@"智能灯光" andImageArray:_imageArr];
        [self.view addSubview:_alterView];
    }else if ([hotspotName isEqualToString:@"智能家电"]) {
        _imageArr = [NSArray arrayWithObjects:@"智能家电.jpg",nil];
        _alterView = [[AlterView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) andTitle:@"智能家电" andImageArray:_imageArr];
        [self.view addSubview:_alterView];
    }else if ([hotspotName isEqualToString:@"智能家电2"]) {
        _imageArr = [NSArray arrayWithObjects:@"智能家电2.jpg",nil];
        _alterView = [[AlterView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) andTitle:@"智能家电" andImageArray:_imageArr];
        [self.view addSubview:_alterView];
    }else if ([hotspotName isEqualToString:@"智能面板"]) {
        _imageArr = [NSArray arrayWithObjects:@"智能面板.jpg",nil];
        _alterView = [[AlterView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) andTitle:@"智能面板" andImageArray:_imageArr];
        [self.view addSubview:_alterView];
    }else if ([hotspotName isEqualToString:@"中央空调"]) {
        _imageArr = [NSArray arrayWithObjects:@"中央空调.jpg",nil];
        _alterView = [[AlterView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) andTitle:@"中央空调" andImageArray:_imageArr];
        [self.view addSubview:_alterView];
    }else if ([hotspotName isEqualToString:@"远程控制"]) {
        _imageArr = [NSArray arrayWithObjects:@"远程控制.jpg",@"远程控制2.jpg",nil];
        _alterView = [[AlterView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) andTitle:@"远程控制" andImageArray:_imageArr];
        [self.view addSubview:_alterView];
    }
//    RotationViewController *vc = [RotationViewController new];
//
//    if ([hotspotName isEqualToString:@"情景开关"]) {
//        vc.imageArray = @[@"情景开关.jpg",@"情景开关2.jpg",@"调光开关.jpg"].mutableCopy;
//    }else if ([hotspotName isEqualToString:@"智能窗帘"]) {
//        vc.imageArray = @[@"智能窗帘.jpg"].mutableCopy;
//    }else if ([hotspotName isEqualToString:@"智能灯光"]) {
//        vc.imageArray = @[@"智能灯光.jpg",@"智能灯光卧室.jpg"].mutableCopy;
//    }else if ([hotspotName isEqualToString:@"智能家电"]) {
//        vc.imageArray = @[@"智能家电.jpg"].mutableCopy;
//    }else if ([hotspotName isEqualToString:@"智能家电2"]) {
//        vc.imageArray = @[@"智能家电2.jpg"].mutableCopy;
//    }else if ([hotspotName isEqualToString:@"智能面板"]) {
//        vc.imageArray = @[@"智能面板.jpg"].mutableCopy;
//    }else if ([hotspotName isEqualToString:@"中央空调"]) {
//        vc.imageArray = @[@"中央空调.jpg"].mutableCopy;
//    }else if ([hotspotName isEqualToString:@"远程控制"]) {
//        vc.imageArray = @[@"远程控制.jpg",@"远程控制2.jpg"].mutableCopy;
//    }
//    [self.navigationController presentViewController:vc animated:YES completion:nil];
}

//热点位置
-(void)hotspot:(NSString *)hotspotName {
    
    /*  if ([hotspotName isEqualToString:@"190客厅"]) {
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceFront
     pos:(CGPoint){0.5, 0.5}
     rotate:-0.1
     key:@"190主卫"];
      [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceBack
     pos:(CGPoint){0.75, 0.3}
     rotate:0
     key:@"190公卫"];
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceLeft
     pos:(CGPoint){0.1, 0.3}
     rotate:0
     key:@"190女儿房"];
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceLeft
     pos:(CGPoint){0.4, 0.3}
     rotate:0
     key:@"190次卧3"];
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceFront
     pos:(CGPoint){0.1, 0.25}
     rotate:0
     key:@"190客卧"];
     }
    else if ([hotspotName isEqualToString:@"190次卧3"]) {
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceBack
     pos:(CGPoint){0.22, 0.2}
     rotate:0
     key:@"190客卧"];
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceBack
     pos:(CGPoint){0.8, 0.2}
     rotate:0
     key:@"190客厅"];
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceFront
     pos:(CGPoint){0.2, 0.15}
     rotate:0
     key:@"190女儿房"];
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceLeft
     pos:(CGPoint){0.25, 0.3}
     rotate:0
     key:@"190主卫"];
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceLeft
     pos:(CGPoint){0.68, 0.3}
     rotate:0
     key:@"190公卫"];
     }
     else if ([hotspotName isEqualToString:@"190女儿房"]) {
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceFront
     pos:(CGPoint){0.45, 0.1}
     rotate:0
     key:@"190客厅"];
     }else if ([hotspotName isEqualToString:@"190公卫"]) {
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceFront
     pos:(CGPoint){0.22, 0.08}
     rotate:0
     key:@"190客厅"];
     }else if ([hotspotName isEqualToString:@"190客卧"]) {
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceBack
     pos:(CGPoint){0.25, 0.2}
     rotate:0
     key:@"190客厅"];
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceBack
     pos:(CGPoint){0.35, 0.4}
     rotate:0
     key:@"190主卫"];
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceBack
     pos:(CGPoint){0.8, 0.2}
     rotate:0
     key:@"190次卧3"];
     }else if ([hotspotName isEqualToString:@"二楼卧室"]) {
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceBack
     pos:(CGPoint){0.6, 0.22}
     rotate:0
     key:@"190主卫"];
     }else if ([hotspotName isEqualToString:@"190厨房"]) {
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceBack
     pos:(CGPoint){0.85, 0.5}
     rotate:0
     key:@"三楼书房"];
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceRight
     pos:(CGPoint){0.4, 0.35}
     rotate:0
     key:@"二楼卧室"];
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceBack
     pos:(CGPoint){0.05, 0.25}
     rotate:0
     key:@"190主卫"];
     }else if ([hotspotName isEqualToString:@"190主卫"]) {
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceBack
     pos:(CGPoint){0.1, 0.35}
     rotate:0
     key:@"190厨房"];
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceBack
     pos:(CGPoint){0.2, 0.4}
     rotate:0
     key:@"二楼卧室"];
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceBack
     pos:(CGPoint){0.3, 0.32}
     rotate:0
     key:@"二楼餐厅"];
     }else if ([hotspotName isEqualToString:@"二楼餐厅"]) {
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceRight
     pos:(CGPoint){0.7, 0.3}
     rotate:0
     key:@"190主卫"];
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceRight
     pos:(CGPoint){0.95, 0.35}
     rotate:0
     key:@"190客厅"];
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceRight
     pos:(CGPoint){0.95, 0.55}
     rotate:0
     key:@"三楼客厅"];
     }else if ([hotspotName isEqualToString:@"三楼客厅"]) {
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceBack
     pos:(CGPoint){0.92, 0.1}
     rotate:0
     key:@"三楼小卧室"];
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceLeft
     pos:(CGPoint){0.8, 0.1}
     rotate:0
     key:@"三楼书房"];
     }else if ([hotspotName isEqualToString:@"三楼大卧室"]) {
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceLeft
     pos:(CGPoint){0.1, 0.1}
     rotate:0
     key:@"三楼书房"];
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceLeft
     pos:(CGPoint){0.6, 0.2}
     rotate:0
     key:@"三楼浴室"];
     }else if ([hotspotName isEqualToString:@"三楼小卧室"]) {
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceBack
     pos:(CGPoint){0.06, 0.05}
     rotate:0
     key:@"三楼客厅"];
     }else if ([hotspotName isEqualToString:@"三楼浴室"]) {
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceBack
     pos:(CGPoint){0.05, 0.05}
     rotate:0
     key:@"三楼大卧室"];
     }else if ([hotspotName isEqualToString:@"三楼书房"]) {
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceBack
     pos:(CGPoint){0.45, 0.3}
     rotate:0
     key:@"190厨房"];
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceRight
     pos:(CGPoint){0.45, 0.25}
     rotate:0
     key:@"三楼大卧室"];
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceRight
     pos:(CGPoint){0.9, 0.25}
     rotate:0
     key:@"三楼儿童房"];
     }else if ([hotspotName isEqualToString:@"三楼儿童房"]) {
     [self.panoView addHotspotWithImageName:@"hotspot_arrow.png"
     face:SphereFaceRight
     pos:(CGPoint){0.9, 0.2}
     rotate:0
     key:@"三楼儿童房"];
     }*/
}
- (void)JAPanoViewDidEndPanning:(JAPanoView *)panoView {
    
}


- (void)JAPanoViewDidEndZooming:(JAPanoView *)panoView {
    
}


- (void)JAPanoViewDidPan:(JAPanoView *)panoView {
    
}


- (void)JAPanoViewDidZoom:(JAPanoView *)panoView {
    
}


- (void)JAPanoViewWillBeginPanning:(JAPanoView *)panoView {
    
}


- (void)JAPanoViewWillBeginZooming:(JAPanoView *)panoView {
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
