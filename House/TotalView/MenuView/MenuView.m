//
//  MenuView.m
//  RotationViewDemo
//
//  Created by 张孝飞 on 2018/5/23.
//  Copyright © 2018年 张孝飞. All rights reserved.
//

#import "MenuView.h"

#import "MenuViewCell.h"
@interface MenuView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)UIButton *selectBtn;

@end

@implementation MenuView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame: frame]) {
        [self addSubview:self.selectBtn];
        [self addSubview:self.collectionView];
    }
    return self;
}

-(UIButton *)selectBtn {
    if (!_selectBtn) {
        _selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectBtn.frame = CGRectMake(self.frame.size.width/2-25, 0, 50, 50);
        [_selectBtn setImage:[UIImage imageNamed:@"plus.png"] forState:UIControlStateNormal];
        [_selectBtn addTarget:self action:@selector(expenAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectBtn;
}

- (void)expenAction:(UIButton*)sender {
    self.selectBtn.selected = !self.selectBtn.selected;
    if (self.expanHander) {
        self.expanHander(self, self.selectBtn.selected);
    }
}


-(UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, self.frame.size.width, self.frame.size.height-50) collectionViewLayout:flowLayout];
        [_collectionView registerNib:[UINib nibWithNibName:@"MenuViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"MenuViewCell"];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

-(void)setItems:(NSArray *)items {
    _items = items;
    [_collectionView reloadData];
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *indentifer =@"MenuViewCell";
    MenuViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentifer forIndexPath:indexPath];
    NSDictionary *dic = _items[indexPath.row];
    cell.titleLabel.text=[dic objectForKey:@"Title"];
    cell.imageV.image= [UIImage imageWithData:[NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:[dic objectForKey:@"ImageName"] ofType:nil]]];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = _items[indexPath.row];
    if (self.hander) {
        self.hander(dic);
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.frame.size.height/5*6, self.frame.size.height-60);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10.0f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10.0f;
}

@end
