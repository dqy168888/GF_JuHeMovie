//
//  HotMovieTableViewCell.h
//  GF_MovieDemo
//
//  Created by GaoFei on 16/3/23.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityHotMovieDetailModel.h"
#import "StarView.h"
//#import "TLDisplayView.h"
#import "CNLabel.h"

@interface HotMovieTableViewCell : UITableViewCell

@property (nonatomic,retain) CityHotMovieDetailModel *detaileModel;

//评分
@property (strong, nonatomic) IBOutlet UILabel *gradeLabel;
//海报图片
@property (strong, nonatomic) IBOutlet UIImageView *iconaddress;
//名字
@property (strong, nonatomic) IBOutlet UILabel *tvTitle;
//五星评分
@property (strong, nonatomic) IBOutlet StarView *startView;
//时间label
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
//电影类型
@property (strong, nonatomic) IBOutlet UILabel *typeLabel;
//支付btn
@property (strong, nonatomic) IBOutlet UIButton *payNowBuutton;
//支付btn方法
- (IBAction)payNowBtnAct:(UIButton *)sender;
//简介
@property (strong, nonatomic) IBOutlet CNLabel *introductionView;



@end
