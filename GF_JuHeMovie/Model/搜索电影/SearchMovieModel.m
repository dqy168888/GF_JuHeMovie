//
//  SearchMovieModel.m
//  GF_JuHeMovie
//
//  Created by GaoFei on 16/3/26.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "SearchMovieModel.h"

@implementation SearchMovieModel

-(void)setAtributes:(NSDictionary *)dic{

    [super setAtributes:dic];
    
    _act_s_arr = [NSMutableArray new];
    _video_rec_arr = [NSMutableArray new];
    
    //演员数组
    _act_s = [dic objectForKey:@"act_s"];
    for (NSDictionary * act_s_dic in _act_s) {
        
        _act_s_model = [[SearchAct_S_Model alloc] initWithDic:act_s_dic];
        
        [_act_s_arr addObject:_act_s_model];
    }
    
    //相关电影
    _video_rec = [dic objectForKey:@"video_rec"];
    for (NSDictionary * video_rec_dic in _video_rec) {
        
        _video_rec_model = [[SearchVideo_Rec_Model alloc] initWithDic:video_rec_dic];
        
        [_video_rec_arr addObject:_video_rec_model];
    }
}

//懒加载
//演员数组
-(NSMutableArray *)act_s_arr{

    if (!_act_s_arr) {
        
        _act_s_arr = [NSMutableArray new];
    }
    
    return _act_s_arr;
}
//相关电影
-(NSMutableArray *)video_rec_arr{

    if (!_video_rec_arr) {
        
        _video_rec_arr = [NSMutableArray new];
    }
    
    return _video_rec_arr;
}

@end
