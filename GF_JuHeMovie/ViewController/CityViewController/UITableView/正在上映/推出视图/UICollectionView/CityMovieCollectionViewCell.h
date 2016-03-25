//
//  CityMovieCollectionViewCell.h
//  GF_MovieDemo
//
//  Created by GaoFei on 16/3/24.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityHotMovieDSMModel.h"

@interface CityMovieCollectionViewCell : UICollectionViewCell

@property (nonatomic,retain) CityHotMovieDSMModel *movieModel;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;


@end
