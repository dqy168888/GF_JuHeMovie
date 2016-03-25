//
//  CityMovieCollectionViewCell.m
//  GF_MovieDemo
//
//  Created by GaoFei on 16/3/24.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "CityMovieCollectionViewCell.h"

@implementation CityMovieCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setMovieModel:(CityHotMovieDSMModel *)movieModel{

    _movieModel = movieModel;
    
    if (_movieModel.name) {
        
        _nameLabel.text = _movieModel.name;
    }
}

@end
