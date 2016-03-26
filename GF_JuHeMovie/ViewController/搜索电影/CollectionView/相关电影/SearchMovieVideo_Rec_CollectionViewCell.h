//
//  SearchMovieVideo_Rec_CollectionViewCell.h
//  GF_JuHeMovie
//
//  Created by GaoFei on 16/3/26.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchVideo_Rec_Model.h"

@interface SearchMovieVideo_Rec_CollectionViewCell : UICollectionViewCell

@property (nonatomic,retain) SearchVideo_Rec_Model *video_rec_model;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;

@end
