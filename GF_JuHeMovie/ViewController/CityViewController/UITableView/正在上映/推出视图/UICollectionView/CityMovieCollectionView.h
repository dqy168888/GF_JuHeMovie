//
//  CityMovieCollectionView.h
//  GF_MovieDemo
//
//  Created by GaoFei on 16/3/24.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityMovieCollectionView : UICollectionView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property (nonatomic,retain) NSDictionary *dataDic;

@end
