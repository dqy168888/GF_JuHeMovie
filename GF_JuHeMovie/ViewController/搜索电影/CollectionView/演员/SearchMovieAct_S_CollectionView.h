//
//  SearchMovieAct_S_CollectionView.h
//  GF_JuHeMovie
//
//  Created by GaoFei on 16/3/26.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchMovieModel.h"

@interface SearchMovieAct_S_CollectionView : UICollectionView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic,retain) SearchMovieModel *movieModel;

@end
