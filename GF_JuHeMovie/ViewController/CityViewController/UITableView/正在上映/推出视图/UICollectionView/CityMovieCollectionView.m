//
//  CityMovieCollectionView.m
//  GF_MovieDemo
//
//  Created by GaoFei on 16/3/24.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "CityMovieCollectionView.h"
#import "CityHotMovieDSMModel.h"
#import "CityMovieCollectionViewCell.h"
#import "BasePushWebViewController.h"

static NSString *headerCell = @"headerCell";

@implementation CityMovieCollectionView{

    NSArray *_allKeysArr;
    NSMutableDictionary *_dataModelDic;
}

-(instancetype)initWithFrame:(CGRect)frame{

    //创建布局类
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    //设置最小的距离
    flowLayout.minimumInteritemSpacing = 5;
    flowLayout.minimumLineSpacing = 5;
    
    //设置滚动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    
    if (self) {
        
        //设置代理及数据源
        self.delegate = self;
        self.dataSource = self;
        
        //注册单元格 ------ 使用xib加载
        [self registerNib:[UINib nibWithNibName:@"CityMovieCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"msmcell1" ];
        
        //注册组的头视图
        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerCell];
    }
    
    return self;
}

// 数据源协议 ---- UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return _allKeysArr.count;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    NSArray * array = [_dataModelDic objectForKey:_allKeysArr[section]];
    
    return array.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    CityMovieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"msmcell1" forIndexPath:indexPath];
    
    NSArray * array = [_dataModelDic objectForKey:_allKeysArr[indexPath.section]];

    cell.movieModel = array[indexPath.row];
    
    return cell;
}

//返回组头视图的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    return CGSizeMake(0, 36);
}

//创建组头视图
-(UICollectionReusableView *)
collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    if (kind == UICollectionElementKindSectionHeader) {
        
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerCell forIndexPath:indexPath];
        
        UILabel *label = [[UILabel alloc] initWithFrame:headerView.bounds];
        
        label.backgroundColor = [UIColor grayColor];
        
        label.text = _allKeysArr[indexPath.section];
        
        label.font = [UIFont systemFontOfSize:18];
        
        [headerView addSubview:label];
        
        return headerView;
    }
    
    return nil;
}
//返回单元格的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(180, 36);
}

//点击相应事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSArray * array = [_dataModelDic objectForKey:_allKeysArr[indexPath.section]];
    
    CityHotMovieDSMModel *model = array[indexPath.row];
    
    BasePushWebViewController *pushVC = [[BasePushWebViewController alloc] init];
    
    pushVC.weburl = model.link;
    
    [self.viewController.navigationController pushViewController:pushVC animated:YES];
}

-(void)setDataDic:(NSDictionary *)dataDic{

    _dataDic = dataDic;
    
    _allKeysArr = [_dataDic allKeys];
    _dataModelDic = [NSMutableDictionary dictionary];
    
    for (int i = 0; i < _allKeysArr.count; i++) {
        
        NSMutableArray *dataArr = [NSMutableArray new];
        
        for (NSDictionary * dic in [_dataDic objectForKey:_allKeysArr[i]]) {
            
            CityHotMovieDSMModel *model = [[CityHotMovieDSMModel alloc] initWithDic:dic];
            
            [dataArr addObject:model];
        }
        
        [_dataModelDic setObject:dataArr forKey:_allKeysArr[i]];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
