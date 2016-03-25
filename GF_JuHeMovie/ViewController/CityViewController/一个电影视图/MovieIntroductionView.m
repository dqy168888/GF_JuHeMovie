//
//  MovieIntroductionView.m
//  GF_MovieDemo
//
//  Created by GaoFei on 16/3/21.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "MovieIntroductionView.h"
#import "BasePushWebViewController.h"

@implementation MovieIntroductionView



-(void)setDetailModel:(CityHotMovieDetailModel *)detailModel{

    _detailModel = detailModel;
    
    //评分
    //评分
    if (_detailModel.grade) {
        
        _startView.ratingFinal = (NSNumber *)_detailModel.grade;
        _gradeLabel.text = _detailModel.grade;
    }else{
        
        _startView.ratingFinal = @0;
        _gradeLabel.text = @"暂无评分";
    }
    
    //名字
    _tvTitle.text = _detailModel.tvTitle;
    
    //上映时间
    NSDictionary *playDate = _detailModel.playDate;
    NSString *showStr = [NSString stringWithFormat:@"%@:%@",[playDate objectForKey:@"showname"],[playDate objectForKey:@"data"]];
    _timeLabel.text = showStr;
    
    //类型
    NSDictionary *type = _detailModel.type;
    NSDictionary *typedata = [type objectForKey:@"data"];
    NSMutableString *typeStr = [NSMutableString stringWithFormat:@"%@:",[type objectForKey:@"showname"]];
    for (int i = 1; i <= typedata.count;i++) {
        
        NSDictionary * typeDic = [typedata objectForKey:[NSString stringWithFormat:@"%d",i]];
        
        //        NSLog(@"-------- 类型 link is %@",[typeDic objectForKey:@"link"]);
        
        NSString *strName = [NSString stringWithFormat:@"%@ ",[typeDic objectForKey:@"name"]];
        
        [typeStr appendString:strName];
    }
    _typeLabel.text = typeStr;
    
    //海报图片
    [_iconaddress setImageWithURL:[NSURL URLWithString:_detailModel.iconaddress]];
    
    //剧情
    NSDictionary *story = _detailModel.story;
    NSMutableString *storyStr = [NSMutableString stringWithFormat:@"%@:",[story objectForKey:@"showname"]];
    NSDictionary *data = [story objectForKey:@"data"];
    NSString *storyNameStr = [data objectForKey:@"storyBrief"];
    [storyStr appendString:storyNameStr];
    _introductionView.text = storyStr;
}


-(void)payNowBtnAct:(UIButton *)sender{

    //获取到 选票购坐
    NSDictionary *more = _detailModel.more;
    
    NSArray *data = [more objectForKey:@"data"];
    
    NSDictionary *payDic = data[0];
    
    NSString *link = [payDic objectForKey:@"link"];
    
    BasePushWebViewController *webvc = [[BasePushWebViewController alloc] init];
    
    webvc.weburl = link;
    
    [self.viewController.navigationController pushViewController:webvc animated:YES];
    
    //    for (int i = 0; i < data.count; i++) {
    //
    //        NSDictionary *dic = data[i];
    //
    //        NSLog(@"------- name is %@",[dic objectForKey:@"name"]);
    //    }

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
