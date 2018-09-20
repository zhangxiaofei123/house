//
//  AlterView.m
//  House
//
//  Created by apple on 2018/9/1.
//  Copyright © 2018年 张孝飞. All rights reserved.
//

#import "AlterView.h"
#define SCROLLVIEW_W self.frame.size.width/6*4
#define SCROLLVIEW_H self.frame.size.height/6*4

@interface AlterView()<UIScrollViewDelegate>
@end

@implementation AlterView

-(id)initWithFrame:(CGRect)frame andTitle:(NSString *)title andImageArray:(NSArray *)imageArr{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
     
        self.imageArr = imageArr;
        self.alterTitle = title;
        [self initSubView];
    }
    
    return self;
}
-(void)initSubView {
    
    if (self.imageArr.count==0)return ;
    
    UITapGestureRecognizer *tapRecognize = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:tapRecognize];
    // 1.创建UIScrollView
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(0, 0, SCROLLVIEW_W, SCROLLVIEW_H);
    _scrollView.layer.cornerRadius = 10;
    _scrollView.clipsToBounds = YES;
    _scrollView.center = self.center;
    _scrollView.bounces = NO;
    _scrollView.contentSize = CGSizeMake(_imageArr.count * SCROLLVIEW_W, SCROLLVIEW_H-40);
    _scrollView.tag = 100;
    //设置代理
    _scrollView.delegate=self;
    //设置分页
    _scrollView.pagingEnabled=YES;
    _scrollView.alwaysBounceVertical = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    //scrollView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
    
    for (int i = 0; i < _imageArr.count;i++) {
        UIImageView * imageV = [[UIImageView alloc]initWithFrame:CGRectMake(i * SCROLLVIEW_W, 0, SCROLLVIEW_W, SCROLLVIEW_H)];
        imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", _imageArr[i]]];
        [_scrollView addSubview:imageV];
    }
    
    [self addSubview:_scrollView];
    
    UILabel * la = [[UILabel alloc]initWithFrame:CGRectMake(_scrollView.frame.origin.x, _scrollView.frame.origin.y-50, _scrollView.frame.size.width, 40 )];
    la.text = self.alterTitle;
    la.textAlignment = NSTextAlignmentCenter;
    la.font = [UIFont systemFontOfSize:20];
    la.textColor = [UIColor whiteColor];
    [self addSubview:la];
    [self bringSubviewToFront:la];
    //创建UIPageControl
    UIPageControl * page = [[UIPageControl alloc]initWithFrame:CGRectMake(self.frame.size.width / 2 - 150, _scrollView.frame.size.height+_scrollView.frame.origin.y-40, 300, 40)];
    page.currentPageIndicatorTintColor = [UIColor blackColor];
    page.numberOfPages = _imageArr.count;
    page.tag = 101;
    [self addSubview:page];
}
#pragma 当视图停止减速的时候就会调用此函数
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    UIPageControl * page = [self viewWithTag:101] ;
    CGFloat index = scrollView.contentOffset.x / (SCROLLVIEW_W-1) ;
    page.currentPage = index;
}
#pragma UIGestureRecognizer Handles
-(void) handleTap:(UITapGestureRecognizer *)recognizer{
    CGPoint selectPoint = [recognizer locationInView:self];
    if(!CGRectContainsPoint(_scrollView.frame, selectPoint)){
        [self removeFromSuperview];
    }
}


@end
