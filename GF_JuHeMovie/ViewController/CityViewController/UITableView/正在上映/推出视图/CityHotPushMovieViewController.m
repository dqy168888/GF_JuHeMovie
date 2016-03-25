//
//  CityHotPushMovieViewController.m
//  GF_MovieDemo
//
//  Created by GaoFei on 16/3/23.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "CityHotPushMovieViewController.h"
#import "MovieIntroductionView.h"
#import "CityMovieCollectionView.h"

@interface CityHotPushMovieViewController (){

    MovieIntroductionView *_introductionView;//简介
    UIScrollView *_backScrollView;
    CityMovieCollectionView *_contentSizeView;
    NSMutableDictionary *_contentSizeDataDic;
}

@end

@implementation CityHotPushMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = [NSString stringWithFormat:@"%@详情",_detailModel.tvTitle];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    //创建UIScrollView
    [self loadUIScrollView];
    //调用创建简介视图
    [self loadIntroductionView];
    //调用创建内容视图
    [self loadContentSizeView];
}

//创建内容视图
- (void)loadContentSizeView{

    if (!_contentSizeView) {
        
        _contentSizeView = [[CityMovieCollectionView alloc] initWithFrame:CGRectMake(0, _introductionView.bottom, kScreenW, kScreenH)];
        
        _contentSizeView.backgroundColor = [UIColor yellowColor];
        
        [_backScrollView addSubview:_contentSizeView];
        
        //设置内容尺寸
        _backScrollView.contentSize = CGSizeMake(kScreenW, _introductionView.height+_contentSizeView.height);
    }
    
    _contentSizeView.dataDic = _contentSizeDataDic;
}

//创建UIScrollView
- (void)loadUIScrollView{

    if (!_backScrollView) {
        
        _backScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
        
        _backScrollView.backgroundColor = [UIColor blueColor];
        
        //设置垂直滑动条关闭
        _backScrollView.showsVerticalScrollIndicator = NO;
        
        [self.view addSubview:_backScrollView];
    }
}

//创建简介视图
- (void)loadIntroductionView{

    if (!_introductionView) {
        
        _introductionView = [[[NSBundle mainBundle] loadNibNamed:@"MovieIntroductionView" owner:nil options:nil] objectAtIndex:0];
        
        _introductionView.frame = CGRectMake(0, 0, _introductionView.width, _introductionView.height);
        
        [_backScrollView addSubview:_introductionView];
    }
    
    _introductionView.detailModel = _detailModel;
}

//解析数据
-(void)setDetailModel:(CityHotMovieDetailModel *)detailModel{

    _detailModel = detailModel;
    
    //初始化字典
    _contentSizeDataDic = [NSMutableDictionary new];
    
    //解析数据
    // ---- 导演
    NSDictionary *director = _detailModel.director;
    NSDictionary *directordata = [director objectForKey:@"data"];
    NSArray *keyDirectorDataArr = [directordata allKeys];
    NSMutableArray *directordataArr = [NSMutableArray new];
    
    for (int i = 1; i <= directordata.count; i++) {
        
        NSString *key = [NSString stringWithFormat:@"%d",i];
        
        for (NSString * keyStr in keyDirectorDataArr) {
            
            if ([keyStr isEqualToString:key]) {
                
                [directordataArr addObject:[directordata objectForKey:key]];
            }
        }
    }
    
    [_contentSizeDataDic setObject:directordataArr forKey:[director objectForKey:@"showname"]];
    
    //----- 演员
    NSDictionary *star = _detailModel.star;
    NSDictionary *stardata = [star objectForKey:@"data"];
    NSArray *keystarDataArr = [stardata allKeys];
    NSMutableArray *stardataArr = [NSMutableArray new];
    
    for (int i = 1; i <= stardata.count; i++) {
        
        NSString *key = [NSString stringWithFormat:@"%d",i];
        
        for (NSString * keyStr in keystarDataArr) {
            
            if ([keyStr isEqualToString:key]) {
                
                [stardataArr addObject:[stardata objectForKey:key]];
            }
        }
    }
    
    [_contentSizeDataDic setObject:stardataArr forKey:[star objectForKey:@"showname"]];
    
    // ----- 更多
    NSDictionary *more = _detailModel.more;
    [_contentSizeDataDic setValue:[more objectForKey:@"data"] forKey:[more objectForKey:@"showname"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
