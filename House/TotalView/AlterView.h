//
//  AlterView.h
//  House
//
//  Created by apple on 2018/9/1.
//  Copyright © 2018年 张孝飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlterView : UIView

@property (nonatomic,copy) NSString *alterTitle;
@property (nonatomic,copy) NSArray *imageArr;
@property (nonatomic,copy) UIScrollView *scrollView;

-(id)initWithFrame:(CGRect)frame andTitle:(NSString*)title andImageArray:(NSArray*)imageArr;

@end
