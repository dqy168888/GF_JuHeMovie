//
//  CityMovieModel.h
//  GF_MovieDemo
//
//  Created by GaoFei on 16/3/20.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "BaseModel.h"

@interface CityMovieModel : BaseModel

@property (nonatomic,retain) NSArray *data;
@property (nonatomic,copy) NSString *title, *morelink, *url, *m_url, *date;

@property (nonatomic,retain) NSMutableArray *cityHotModelArr;
@property (nonatomic,retain) NSMutableArray *cityNextModelArr;

/*
 "title" : "潍坊影讯_最近上映电影",
 "morelink" : "http:\/\/theater.mtime.com\/China_Shandong_Province_Weifang\/",
 "url" : "http:\/\/theater.mtime.com\/China_Shandong_Province_Weifang\/",
 "m_url" : "http:\/\/m.mtime.cn\/?cityId=839",
 "date" : "2016-03-20"

 */

@end
