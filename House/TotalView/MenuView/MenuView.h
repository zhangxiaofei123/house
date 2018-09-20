//
//  MenuView.h
//  RotationViewDemo
//
//  Created by 张孝飞 on 2018/5/23.
//  Copyright © 2018年 张孝飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MenuView;

typedef void(^MenuSelectHander) (NSDictionary *item);
typedef void(^MenuExpanHander) (MenuView *view, BOOL isExpan);

@interface MenuView : UIView
@property(nonatomic,strong)NSArray *items;
@property (nonatomic, copy) MenuSelectHander hander;
@property (nonatomic, copy) MenuExpanHander  expanHander;
@end
