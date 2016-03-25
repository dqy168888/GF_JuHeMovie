//
//  HotMovieTableViewCell.m
//  GF_MovieDemo
//
//  Created by GaoFei on 16/3/23.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "HotMovieTableViewCell.h"
#import "BasePushWebViewController.h"

@implementation HotMovieTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}

//-(void)loadIntroductionView:(NSString *)str{
//    
//    _introductionView.delegate = self;
//    _introductionView.backgroundColor = [UIColor grayColor];
//    _introductionView.numberOfLines = 1;
//    [_introductionView setText:str];
//    [_introductionView setOpenString:@"［查看更多］" closeString:@"［点击收起］" font:[UIFont systemFontOfSize:16] textColor:[UIColor blueColor]];
//    
//    //    CGSize size = [_introductionView sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, MAXFLOAT)];
//    //    _introductionView.frame = CGRectMake(10, 100, size.width, size.height);
//}

#pragma mark -
#pragma mark TLDisplayViewDelegate
//- (void)displayView:(TLDisplayView *)label closeHeight:(CGFloat)height {
//    CGRect frame = _introductionView.frame;
//    frame.size.height = height;
//    self.introductionView.frame = frame;
//}

//- (void)displayView:(TLDisplayView *)label openHeight:(CGFloat)height {
//    CGRect frame = _introductionView.frame;
//    frame.size.height = height;
//    self.introductionView.frame = frame;
//}


-(void)setDetaileModel:(CityHotMovieDetailModel *)detaileModel{

    _detaileModel = detaileModel;
    
    //评分
    if (_detaileModel.grade) {
        
        _startView.ratingFinal = (NSNumber *)_detaileModel.grade;
        _gradeLabel.text = _detaileModel.grade;
    }else{
    
        _startView.ratingFinal = @0;
        _gradeLabel.text = @"暂无评分";
    }
    
    //名字
    _tvTitle.text = _detaileModel.tvTitle;
    
    //上映时间
    NSDictionary *playDate = _detaileModel.playDate;
    NSString *showStr = [NSString stringWithFormat:@"%@:%@",[playDate objectForKey:@"showname"],[playDate objectForKey:@"data"]];
    _timeLabel.text = showStr;
    
    //类型
    NSDictionary *type = _detaileModel.type;
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
    [_iconaddress setImageWithURL:[NSURL URLWithString:_detaileModel.iconaddress]];
    
    //剧情
    NSDictionary *story = _detaileModel.story;
    NSMutableString *storyStr = [NSMutableString stringWithFormat:@"%@:",[story objectForKey:@"showname"]];
    NSDictionary *data = [story objectForKey:@"data"];
    NSString *storyNameStr = [data objectForKey:@"storyBrief"];
    [storyStr appendString:storyNameStr];
    _introductionView.text = storyStr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)payNowBtnAct:(UIButton *)sender {

    //获取到 选票购坐
    NSDictionary *more = _detaileModel.more;
    
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

@end
