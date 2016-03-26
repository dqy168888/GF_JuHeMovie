//
//  SearchMovieVideo_Rec_CollectionViewCell.m
//  GF_JuHeMovie
//
//  Created by GaoFei on 16/3/26.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "SearchMovieVideo_Rec_CollectionViewCell.h"

@implementation SearchMovieVideo_Rec_CollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setVideo_rec_model:(SearchVideo_Rec_Model *)video_rec_model{

    _video_rec_model = video_rec_model;
    
    [_imageView setImageWithURL:[NSURL URLWithString:_video_rec_model.cover]];
    
    _nameLabel.text = _video_rec_model.title;
}

@end
