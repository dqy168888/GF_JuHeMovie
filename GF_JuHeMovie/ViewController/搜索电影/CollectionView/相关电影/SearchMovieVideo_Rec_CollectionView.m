//
//  SearchMovieVideo_Rec_CollectionView.m
//  GF_JuHeMovie
//
//  Created by GaoFei on 16/3/26.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "SearchMovieVideo_Rec_CollectionView.h"
#import "SearchMovieVideo_Rec_CollectionViewCell.h"

#import "BasePushWebViewController.h"
#import "SearchVideo_Rec_Model.h"

@implementation SearchMovieVideo_Rec_CollectionView

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
        [self registerNib:[UINib nibWithNibName:@"SearchMovieVideo_Rec_CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"Video_Rec_Cell"];
    }
    
    return self;
}

-(void)setMovieModel:(SearchMovieModel *)movieModel{

    _movieModel = movieModel;
    
    [self reloadData];
}

// -------- UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return _movieModel.video_rec_arr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    SearchMovieVideo_Rec_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Video_Rec_Cell" forIndexPath:indexPath];
    
    cell.video_rec_model = self.movieModel.video_rec_arr[indexPath.row];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(120, 180);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    BasePushWebViewController *pushVC = [[BasePushWebViewController alloc] init];
    
    SearchVideo_Rec_Model *model = self.movieModel.video_rec_arr[indexPath.row];
    
    pushVC.weburl = model.detail_url;
    
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
