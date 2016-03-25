//
//  NextMovieTableView.h
//  GF_MovieDemo
//
//  Created by GaoFei on 16/3/23.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityNextMovieModel.h"

@interface NextMovieTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,retain) CityNextMovieModel *nextModel;

@end
