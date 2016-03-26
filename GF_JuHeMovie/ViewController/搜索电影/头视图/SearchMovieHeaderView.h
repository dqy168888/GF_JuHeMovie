//
//  SearchMovieHeaderView.h
//  GF_JuHeMovie
//
//  Created by GaoFei on 16/3/26.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"

#import "SearchMovieModel.h"

@interface SearchMovieHeaderView : UIView

@property (nonatomic,retain) SearchMovieModel *movieModel;

//电影图片
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
//电影名字
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
//评分
@property (strong, nonatomic) IBOutlet StarView *ratingView;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
//类型
@property (strong, nonatomic) IBOutlet UILabel *taglabel;
//演员
@property (strong, nonatomic) IBOutlet UILabel *actLabel;
//导演
@property (strong, nonatomic) IBOutlet UILabel *dirLabel;
//地区
@property (strong, nonatomic) IBOutlet UILabel *areaLabel;
//上映时间
@property (strong, nonatomic) IBOutlet UILabel *yearLabel;
//播放
@property (strong, nonatomic) IBOutlet UIButton *playBtn;
//播放方法
- (IBAction)PlayBtnAct:(UIButton *)sender;


@end
