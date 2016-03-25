//
//  HotMovieTableView.m
//  GF_MovieDemo
//
//  Created by GaoFei on 16/3/21.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "HotMovieTableView.h"
#import "CityHotMovieModel.h"
#import "HotMovieTableViewCell.h"
#import "CityHotMovieDetailModel.h"
#import "CNLabel.h"
#import "CityHotPushMovieViewController.h"

@implementation HotMovieTableView{

    NSMutableArray *_dataArr;
}

- (instancetype) initWithFrame:(CGRect)frame{

    if ([super initWithFrame:frame]) {
        
        //设置代理和数据源协议
        self.dataSource = self;
        self.delegate = self;
        
        //设置分割线 为空
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return self;
}

#pragma mark ------- 数据源协议 UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _hotModel.data.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    HotMovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1"];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HotMovieTableViewCell" owner:nil options:nil] objectAtIndex:0];
        
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    cell.detaileModel = _dataArr[indexPath.row];
    
    return cell;
}

//点击单元格的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    CityHotPushMovieViewController *pushVC = [[CityHotPushMovieViewController alloc] init];
    
    pushVC.detailModel = _dataArr[indexPath.row];
    
    [self.viewController.navigationController pushViewController:pushVC animated:YES];
}

//返回单元格的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    CNLabel *label = [[CNLabel alloc] init];
    
    CityHotMovieDetailModel *model = _dataArr[indexPath.row];
    
    NSDictionary *story = model.story;
    NSMutableString *storyStr = [NSMutableString stringWithFormat:@"%@:",[story objectForKey:@"showname"]];
    NSDictionary *data = [story objectForKey:@"data"];
    NSString *storyNameStr = [data objectForKey:@"storyBrief"];
    [storyStr appendString:storyNameStr];
    label.text = storyStr;
    
    return 200 + label.height;
}

-(void)setHotModel:(CityHotMovieModel *)hotModel{

    _hotModel = hotModel;
    
    //初始化数组
    _dataArr = [NSMutableArray new];
    
    for (NSDictionary * dic in _hotModel.data) {
        
        CityHotMovieDetailModel *model = [[CityHotMovieDetailModel alloc] initWithDic:dic];
        
        [_dataArr addObject:model];
    }
    
    NSLog(@"--------- name is %@",_hotModel.name);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
