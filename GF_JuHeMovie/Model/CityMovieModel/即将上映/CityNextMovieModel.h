//
//  CityNextMovieModel.h
//  GF_MovieDemo
//
//  Created by GaoFei on 16/3/20.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "BaseModel.h"

@interface CityNextMovieModel : BaseModel

@property (nonatomic,copy) NSString *link, *name;

@property (nonatomic,retain) NSArray *data;

@end
