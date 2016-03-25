//
//  StarView.m
//  M_Time
//
//  Created by mac on 15/12/5.
//  Copyright (c) 2015年 YF_S. All rights reserved.
//

#import "StarView.h"

@implementation StarView{

    UIView *yellowView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//如果通过该方法初始化StarView对象 那么该方法将作为入口方法
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建星星视图
        [self createStarView];
    }
    return self;
}

////如果StarView是被画在xib文件中 则系统默认调用该方法（入口方法）
-(void)awakeFromNib{

    [self createStarView];
}

-(void)createStarView{

    //获取灰色与黄色图片对象
    UIImage *grayImage = [UIImage imageNamed:@"gray@2x"];
    UIImage *yellowImage = [UIImage imageNamed:@"yellow@2x"];
    
    //获取灰色图片的高度与宽度
    CGFloat width = grayImage.size.width;
    
    CGFloat height = grayImage.size.height;
    
    //创建灰色视图对象
    UIView *grayView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width*5, height)];
    
    //设置灰色星星视图背景图 图片会平铺展示
    grayView.backgroundColor = [UIColor colorWithPatternImage:grayImage];
    
    [self addSubview:grayView];
    
    //创建黄色星星视图
    yellowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width*5, height)];
    
    yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowImage];
    
    [self addSubview:yellowView];
    
    //缩小或放大星星视图
    //获取缩放倍数
    CGFloat scale = self.frame.size.width/yellowView.frame.size.width;
    
    //视图的变化
    yellowView.transform = CGAffineTransformMakeScale(scale, scale);
    
    grayView.transform = CGAffineTransformMakeScale(scale, scale);
    
    //重新设置frame
    yellowView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    grayView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}
//根据传入分数设置黄色星星视图
-(void)setRatingFinal:(NSNumber *)ratingFinal{

    _ratingFinal = ratingFinal;
    
    CGFloat ratingFinalf = [_ratingFinal floatValue];
    
    if(ratingFinalf < 0){
    
        ratingFinalf = 0;
    }
    
    //宽度比例
    CGFloat widthScale = ratingFinalf/10.0;
    
    //设置黄图比例
    yellowView.frame = CGRectMake(0, 0, self.frame.size.width*widthScale, self.frame.size.height);
}

@end
