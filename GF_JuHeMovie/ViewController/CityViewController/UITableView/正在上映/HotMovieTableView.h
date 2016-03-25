//
//  HotMovieTableView.h
//  GF_MovieDemo
//
//  Created by GaoFei on 16/3/21.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityHotMovieModel.h"

@interface HotMovieTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain) CityHotMovieModel *hotModel;

@end
