//
//  SearchMovieAct_S_CollectionView.m
//  GF_JuHeMovie
//
//  Created by GaoFei on 16/3/26.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "SearchMovieAct_S_CollectionView.h"
#import "BasePushWebViewController.h"
#import "SearchMovieAct_S_CollectionViewCell.h"
#import "SearchAct_S_Model.h"

@implementation SearchMovieAct_S_CollectionView

-(instancetype)initWithFrame:(CGRect)frame{
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.minimumInteritemSpacing = 5;
    layout.minimumLineSpacing = 5;
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    
    if (self) {
        
        self.dataSource = self;
        self.delegate = self;
        
        //注册单元格
        [self registerNib:[UINib nibWithNibName:@"SearchMovieAct_S_CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Act_S_Cell"];
    }
    
    return self;
}

-(void)setMovieModel:(SearchMovieModel *)movieModel{

    _movieModel = movieModel;
    
    [self reloadData];
}

// -------- UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _movieModel.act_s_arr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    SearchMovieAct_S_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Act_S_Cell" forIndexPath:indexPath];
    
    cell.act_s_model = self.movieModel.act_s_arr[indexPath.row];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(120, 180);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BasePushWebViewController *pushVC = [[BasePushWebViewController alloc] init];
    
    SearchAct_S_Model *model = self.movieModel.act_s_arr[indexPath.row];
    
    pushVC.weburl = model.url;
    
    [self.viewController.navigationController pushViewController:pushVC animated:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
