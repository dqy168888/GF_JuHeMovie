//
//  SearchMovieAct_S_CollectionViewCell.h
//  GF_JuHeMovie
//
//  Created by GaoFei on 16/3/26.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchAct_S_Model.h"

@interface SearchMovieAct_S_CollectionViewCell : UICollectionViewCell

@property (nonatomic,retain) SearchAct_S_Model *act_s_model;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;


@end
