//
//  SearchMovieHeaderView.m
//  GF_JuHeMovie
//
//  Created by GaoFei on 16/3/26.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "SearchMovieHeaderView.h"

@implementation SearchMovieHeaderView

-(void)awakeFromNib{

    
}

-(void)setMovieModel:(SearchMovieModel *)movieModel{

    _movieModel = movieModel;
    
    //图片
    [_imageView setImageWithURL:[NSURL URLWithString:_movieModel.cover]];
    
    //电影名字
    _titleLabel.text = _movieModel.title;
    
    //评分    
    _ratingView.ratingFinal = _movieModel.rating;
    _ratingLabel.text = [NSString stringWithFormat:@"%@",_movieModel.rating];
    
    //类型
    _taglabel.text = _movieModel.tag;
    
    //演员
    _actLabel.text = _movieModel.act;
    
    //地区
    _areaLabel.text = _movieModel.area;
    
    //导演
    _dirLabel.text = [NSString stringWithFormat:@"导演:%@",_movieModel.dir];
    
    //上映时间
    _yearLabel.text = [NSString stringWithFormat:@"上映时间:%@年",_movieModel.year];
    
    //播放按钮
    if (![_movieModel.vdo_status isEqualToString:@"play"]) {
        
        _playBtn.enabled = NO;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//播放
- (IBAction)PlayBtnAct:(UIButton *)sender {

    
}

@end
