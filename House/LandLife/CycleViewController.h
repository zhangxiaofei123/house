//
//  CycleViewController.h
//  House
//
//  Created by zxf on 2018/6/27.
//  Copyright © 2018年 zxf. All rights reserved.
//

#import "ZXFViewController.h"
@protocol CycleViewDelegate <NSObject>

-(void)clickImage:(NSInteger)index;

@end
@interface CycleViewController : ZXFViewController
@property(nonatomic,strong)NSMutableArray *imageArray;
@property(nonatomic,strong)NSMutableArray *showButtonArray;

@property (nonatomic,weak) id<CycleViewDelegate> deleagte;


@end
