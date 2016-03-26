//
//  SearchMovieViewController.m
//  GF_JuHeMovie
//
//  Created by GaoFei on 16/3/26.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "SearchMovieViewController.h"
#import "SearchMovieModel.h"

#import "SearchMovieHeaderView.h"
#import "TLDisplayView.h"

#import "SearchMovieVideo_Rec_CollectionView.h"
#import "SearchMovieAct_S_CollectionView.h"

@interface SearchMovieViewController ()<TLDisplayViewDelegate>{

    UIScrollView *_backScrollView;//背景的视图
    SearchMovieHeaderView *_headerView;//头视图
    TLDisplayView *_displayView;//电影简介
    SearchMovieModel *_movieModel;
    
    SearchMovieAct_S_CollectionView *_act_s_collectionView;
    SearchMovieVideo_Rec_CollectionView *_video_rec_collectionView;
}

@property (strong, nonatomic) IBOutlet UISearchBar *searchMovieBar;

@end

@implementation SearchMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"搜索电影";
    
    //首次加载此页面
    [self loadMoviesDatas:@"宝贝计划"];
    
    //创建背景视图
    [self loadBackUIScrollView];
}

//创建 演员及相关电影的视图
-(void)loadVideoAndActCollectionView{

    //相关电影
    if (!_video_rec_collectionView) {
        
        _video_rec_collectionView = [[SearchMovieVideo_Rec_CollectionView alloc] initWithFrame:CGRectMake(0, _displayView.bottom, kScreenW, 200)];
        
        _video_rec_collectionView.backgroundColor = [UIColor yellowColor];
        
        [_backScrollView addSubview:_video_rec_collectionView];
    }
    
    _video_rec_collectionView.movieModel = _movieModel;
    
    //演员
    if (!_act_s_collectionView) {
        
        _act_s_collectionView = [[SearchMovieAct_S_CollectionView alloc] initWithFrame:CGRectMake(0, _video_rec_collectionView.bottom, kScreenW, 200)];
        
        _act_s_collectionView.backgroundColor = [UIColor purpleColor];
        
        [_backScrollView addSubview:_act_s_collectionView];
    }
    
    _act_s_collectionView.movieModel = _movieModel;
    
    //--------- UIScrollView的内容尺寸
    _backScrollView.contentSize = CGSizeMake(kScreenW, _headerView.height+_displayView.height+_act_s_collectionView.height + _video_rec_collectionView.height);
}

//创建头视图 及 学校简介
-(void)loadHeaderViewAndIntroductionView{

    if (!_headerView) {
        
        _headerView = [[[NSBundle mainBundle] loadNibNamed:@"SearchMovieHeaderView" owner:nil options:nil] objectAtIndex:0];
        
        _headerView.backgroundColor = [UIColor clearColor];
        
        _headerView.frame = CGRectMake(0, 0, kScreenW, _headerView.height);
        
        [_backScrollView addSubview:_headerView];
    }
    
    _headerView.movieModel = _movieModel;
    
#pragma mark ------ 电影简介
        _displayView = [[TLDisplayView alloc] init];
        _displayView.delegate = self;
        
        _displayView.backgroundColor = [UIColor clearColor];
        _displayView.numberOfLines = 2;
        [_displayView setText:[NSString stringWithFormat:@"电影简介:%@",_movieModel.desc]];
        [_displayView setOpenString:@"［查看更多］" closeString:@"［点击收起］" font:[UIFont systemFontOfSize:16] textColor:[UIColor blueColor]];
        
        CGSize size = [_displayView sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width - 4, MAXFLOAT)];
        _displayView.frame = CGRectMake(2, _headerView.bottom, size.width, size.height);
        [_backScrollView addSubview:_displayView];
}

#pragma mark -
#pragma mark TLDisplayViewDelegate
- (void)displayView:(TLDisplayView *)label closeHeight:(CGFloat)height {
    CGRect frame = _displayView.frame;
    frame.size.height = height;
    _displayView.frame = frame;
    
    _video_rec_collectionView.frame = CGRectMake(0, _displayView.bottom, kScreenW, _video_rec_collectionView.height);
    _act_s_collectionView.frame = CGRectMake(0, _video_rec_collectionView.bottom, kScreenW, _act_s_collectionView.height);
    
    _backScrollView.contentSize = CGSizeMake(kScreenW, _headerView.height+_displayView.height+_act_s_collectionView.height + _video_rec_collectionView.height);
}

- (void)displayView:(TLDisplayView *)label openHeight:(CGFloat)height {
    CGRect frame = _displayView.frame;
    frame.size.height = height;
    _displayView.frame = frame;
    
    _video_rec_collectionView.frame = CGRectMake(0, _displayView.bottom, kScreenW, _video_rec_collectionView.height);
    _act_s_collectionView.frame = CGRectMake(0, _video_rec_collectionView.bottom, kScreenW, _act_s_collectionView.height);
    
    _backScrollView.contentSize = CGSizeMake(kScreenW, _headerView.height+_displayView.height+_act_s_collectionView.height + _video_rec_collectionView.height);
}

//创建UIScrollView
-(void)loadBackUIScrollView{

    if (!_backScrollView) {
        
        _backScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _searchMovieBar.bottom, kScreenW, kScreenH-64-_searchMovieBar.height)];
        
        _backScrollView.backgroundColor = [UIColor cyanColor];
        
        [self.view addSubview:_backScrollView];
    }
}

//解析数据
-(void)resolveCityMovieData:(NSDictionary *)dataDic{

    //获取到主要的数据
    NSDictionary * result = [dataDic objectForKey:@"result"];
    
    _movieModel = [[SearchMovieModel alloc] initWithDic:result];
    
    //创建头视图及电影简介
    [self loadHeaderViewAndIntroductionView];
    
    //调用创建 相关电影和演员视图
    [self loadVideoAndActCollectionView];
}

//获取到电影的数据
- (void)loadMoviesDatas:(NSString *)movieName{

    if (!movieName) {
        
        return;
    }
    
    NSDictionary *parameters = @{@"key":kMovieAppKey,@"q":movieName};
    
    [MHNetworkManager getRequstWithURL:kSearchMovieUrl params:parameters successBlock:^(id returnData, int code, NSString *msg) {
        
        NSNumber *error_code = [returnData objectForKey:@"error_code"];
        
        if ([error_code isEqual: @0]) {
        
            //解析数据
            [self resolveCityMovieData:(NSDictionary *)returnData];
            
            [self jsonWriteData:(NSDictionary *)returnData];
            
            _searchMovieBar.text = nil;
        }
        
    } failureBlock:^(NSError *error) {
        
        NSLog(@"搜索影视的错误信息：%@",error);
        
    } showHUD:YES];
}

//将获取到的数据源存入到json里面
-(void)jsonWriteData:(NSDictionary *)jsonDic{
    
    //1.获取json文件路径
    NSString *jsonPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/searchMovieData.json"];
    NSLog(@"jsonPath:%@",jsonPath);
    
    //3.将数据装化为json规格的data数据
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDic options:NSJSONWritingPrettyPrinted error:nil];
    
    //4.将json数据写入到文件中
    //如果文件不存在 则自动创建新的文件
    BOOL result = [jsonData writeToFile:jsonPath atomically:YES];
    
    if (result) {
        NSLog(@"写入成功");
    }
    else
    {
        NSLog(@"写入失败");
    }
}

//读取json数据
-(void)readJsonData{
    //1.获取文件路径
    NSString *jsonPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/searchMovieData.json"];
    
    //2.获取文件中内容
    NSData *jsondata = [NSData dataWithContentsOfFile:jsonPath];
    
    //3.解析json数据
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:jsondata options:NSJSONReadingAllowFragments error:nil];
    
    //解析数据
    [self resolveCityMovieData:result];
}

#pragma mark ---------UISearchBarDelegate
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{

    [searchBar resignFirstResponder];
    
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{

    [searchBar resignFirstResponder];
    
    if (searchBar.text.length != 0) {
        
        [self loadMoviesDatas:searchBar.text];
        
        [_displayView removeFromSuperview];
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [super touchesEnded:touches withEvent:event];
    
    [_searchMovieBar resignFirstResponder];
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
