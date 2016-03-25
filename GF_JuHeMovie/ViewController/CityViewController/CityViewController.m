//
//  CityViewController.m
//  GF_MovieDemo
//
//  Created by GaoFei on 16/3/19.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "CityViewController.h"
#import "Reachability.h"
#import "MBProgressHUD.h"

#import "CityMovieModel.h"
#import "CityHotMovieModel.h"
#import "CityNextMovieModel.h"

#import "GF_CityListViewController.h"
#import "ZKSegment.h"
#import "BasePath.h"
#import "HotMovieTableView.h"
#import "NextMovieTableView.h"

@interface CityViewController (){

    ZKSegment *_segment;//
    
#pragma mark ------ 正在上映
    HotMovieTableView *_hotMovieView;
    
#pragma mark ------ 即将上映
    NextMovieTableView *_nextMovieView;
}

@property (strong, nonatomic) IBOutlet UIBarButtonItem *cityListBarBtnItem;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *searchMoiveBarBtnItem;

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) IBOutlet UILabel *cityNameLabel;

@property (strong, nonatomic) IBOutlet UILabel *cityDateLabel;


@end

@implementation CityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"电影";
    
    if (kLocationCityName) {
        
        _cityListBarBtnItem.title = kLocationCityName;
    }
    
    [self loadGetDatas];
    
    //读取本地缓存数据
    [self readJsonData];
    
    //判断当前的网络
    [self isConnectionAvailable];
}

//UISearchBarDelegate
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{

    if (searchBar.text.length == 0) {
        
//        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];//<span style="font-family: Arial, Helvetica, sans-serif;">MBProgressHUD为第三方库，不需要可以省略或使用AlertView</span>
//        hud.removeFromSuperViewOnHide =YES;
//        hud.mode = MBProgressHUDModeText;
//        hud.labelText = NSLocalizedString(@"请重新输入", nil);
//        hud.minSize = CGSizeMake(132.f, 108.0f);
//        [hud hide:YES afterDelay:3];
        
    }else{
    
        [self getMovieDatas:searchBar.text];
    }
    
    return YES;
}

//城市列表
-(IBAction)cityListBarBtnItemAct:(UIBarButtonItem *)sender {

    GF_CityListViewController *cityListVC = [[GF_CityListViewController alloc] init];
    
    [cityListVC changeCityName:^(NSString *cityName) {
        
        sender.title = cityName;
        
        [self getMovieDatas:cityName];
    }];
    
    [self.navigationController pushViewController:cityListVC animated:YES];
}

//搜索影视
- (IBAction)searchMoiveBarBtnItemAct:(UIBarButtonItem *)sender {

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    CityViewController *cityVC = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    [self.navigationController pushViewController:cityVC animated:YES];
}

//创建segment
- (void) loadSegment:(NSArray *)segmentArr{

    if (!_segment) {
        
        _segment = [ZKSegment zk_segmentWithFrame:CGRectMake(0, _cityNameLabel.bottom, kScreenW, 30) style:ZKSegmentLineStyle];
        
        [_segment zk_setItems:segmentArr];
        
        [self.view addSubview:_segment];
    }
    
    [_segment zk_itemClickBlock:^(NSString *itemName, NSInteger itemIndex) {
       
        if (itemIndex == 0) {
            
            _hotMovieView.transform = CGAffineTransformIdentity;
            
            _nextMovieView.transform = CGAffineTransformMakeTranslation(kScreenW, 0);
            
        }else if (itemIndex == 1){
        
            _hotMovieView.transform = CGAffineTransformMakeTranslation(-kScreenW, 0);
            _nextMovieView.transform = CGAffineTransformMakeTranslation(-kScreenW, 0);

        }
        
    }];
}

//进行解析数据
- (void) resolveCityMovieData:(NSDictionary *)jsonDic{
    
    NSMutableArray *segmentArr = [NSMutableArray new];
    
    NSDictionary *result = [jsonDic objectForKey:@"result"];
    
    CityMovieModel *movieModel = [[CityMovieModel alloc] initWithDic:result];
    
    _cityNameLabel.text = movieModel.title;
    _cityDateLabel.text = [NSString stringWithFormat:@"日期:%@",movieModel.date];
    
    NSArray *dataArr = movieModel.data;
    
    CityHotMovieModel *hotModel;
    CityNextMovieModel *nextModel;
    
    for (int i = 0; i < dataArr.count; i++) {
        
        NSDictionary *dic = dataArr[i];
        
        [segmentArr addObject:[dic objectForKey:@"name"]];
        
        if ([[dic objectForKey:@"name"] isEqualToString:@"正在上映"]) {
            
            hotModel = [[CityHotMovieModel alloc] initWithDic:dic];
            
        }else if ([[dic objectForKey:@"name"] isEqualToString:@"即将上映"]){
        
            nextModel = [[CityNextMovieModel alloc] initWithDic:dic];
        }
    }
    
    //创建segment
    [self loadSegment:segmentArr];
    
    [self loadHotAndNextMovieView];
    
    //传入数据
    _hotMovieView.hotModel = hotModel;
    _nextMovieView.nextModel = nextModel;
}

//创建两个视图
-(void)loadHotAndNextMovieView{

#pragma mark ----------- 正在上映
    if (!_hotMovieView) {
        
        _hotMovieView = [[HotMovieTableView alloc]initWithFrame:CGRectMake(0, _segment.bottom, kScreenW, kScreenH-_searchBar.height-_cityNameLabel.height-_segment.height-64)];
        
        _hotMovieView.backgroundColor = [UIColor grayColor];
        
        [self.view addSubview:_hotMovieView];
    }
    
#pragma mark ----------- 即将上映
    if (!_nextMovieView) {
        
        _nextMovieView = [[NextMovieTableView alloc]initWithFrame:CGRectMake(kScreenW, _segment.bottom, kScreenW, kScreenH-_searchBar.height-_cityNameLabel.height-_segment.height-64)];
        
        _nextMovieView.backgroundColor = [UIColor cyanColor];
        
        [self.view addSubview:_nextMovieView];
    }
}

//判断当前手机是否有网络
-(BOOL) isConnectionAvailable{
    
    BOOL isExistenceNetwork = YES;
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            isExistenceNetwork = NO;
            NSLog(@"notReachable");
            break;
        case ReachableViaWiFi:
            isExistenceNetwork = YES;
            NSLog(@"WIFI");
            break;
        case ReachableViaWWAN:
            isExistenceNetwork = YES;
            NSLog(@"3G");
            break;
    }
    
    if (!isExistenceNetwork) {

        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];//<span style="font-family: Arial, Helvetica, sans-serif;">MBProgressHUD为第三方库，不需要可以省略或使用AlertView</span>
        hud.removeFromSuperViewOnHide =YES;
        hud.mode = MBProgressHUDModeText;
        
        //读取本地缓存数据
        [self readJsonData];
        
        hud.labelText = NSLocalizedString(@"没有网络", nil);
        hud.minSize = CGSizeMake(132.f, 108.0f);
        [hud hide:YES afterDelay:3];
        return NO;
    }else{
        
        //获取到数据源
        [self getMovieDatas:_cityName];
    }
    
    return isExistenceNetwork;
}

//获取数据
-(void)getMovieDatas:(NSString *)cityName{

    if (!cityName) {
        
        return;
    }
    
    NSDictionary *parameters = @{@"key":kMovieAppKey,@"city":cityName};
    
    [NetWorking getHomeTimeLineWithURLString:kMovieCityUrl withParameters:parameters success:^(id result) {
        
        NSNumber *error_code = [result objectForKey:@"error_code"];
        
        NSLog(@"-------- resullt is %@",result);
        
        if ([error_code isEqual: @0]) {
            
            //解析数据
            [self resolveCityMovieData:(NSDictionary *)result];
            
            [self jsonWriteData:(NSDictionary *)result];
            
            _searchBar.text = nil;
        }else{
        
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];//<span style="font-family: Arial, Helvetica, sans-serif;">MBProgressHUD为第三方库，不需要可以省略或使用AlertView</span>
            hud.removeFromSuperViewOnHide =YES;
            hud.mode = MBProgressHUDModeText;
            hud.labelText = NSLocalizedString(@"请重新输入", nil);
            hud.minSize = CGSizeMake(132.f, 108.0f);
            [hud hide:YES afterDelay:3];

        }
    }];
}

//解析非网络数据
- (void)loadGetDatas{

    NSDictionary * dic = [BasePath pathWithFileName:@"cityMovieData" withTypeName:@"json"];
    
    [self jsonWriteData:dic];
}

//将获取到的数据源存入到json里面
-(void)jsonWriteData:(NSDictionary *)jsonDic{
    
    //1.获取json文件路径
    NSString *jsonPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/cityMovieData.json"];
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
    NSString *jsonPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/cityMovieData.json"];
    
    //2.获取文件中内容
    NSData *jsondata = [NSData dataWithContentsOfFile:jsonPath];
    
    //3.解析json数据
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:jsondata options:NSJSONReadingAllowFragments error:nil];
    
    //解析数据
    [self resolveCityMovieData:result];
}

-(void)setCityName:(NSString *)cityName{

    _cityName = cityName;
}

//结束编辑
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [_searchBar resignFirstResponder];
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
