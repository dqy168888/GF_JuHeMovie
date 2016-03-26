//
//  SearchMovieAct_S_CollectionViewCell.m
//  GF_JuHeMovie
//
//  Created by GaoFei on 16/3/26.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "SearchMovieAct_S_CollectionViewCell.h"

@implementation SearchMovieAct_S_CollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setAct_s_model:(SearchAct_S_Model *)act_s_model{

    _act_s_model = act_s_model;
    
    [_imageView setImageWithURL:[NSURL URLWithString:_act_s_model.image]];
    
    _nameLabel.text = _act_s_model.name;
}

@end
