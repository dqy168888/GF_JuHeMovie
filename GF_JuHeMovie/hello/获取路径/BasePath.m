//
//  BasePath.m
//  M_Time
//
//  Created by mac on 15/12/5.
//  Copyright (c) 2015年 YF_S. All rights reserved.
//

#import "BasePath.h"

@implementation BasePath

//返回一个id类型的  1.需要文件名字 2.需要文件的类型
+(id)pathWithFileName:(NSString *)fileName withTypeName:(NSString *)typeName{

    //获取文件的路径
    NSString *path = [[NSBundle mainBundle]pathForResource:fileName ofType:typeName];
    
    //解析路径
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    //获取路径中的数据
    id dataId = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    //返回数据
    return dataId;
}

//返回一个id类型的  1.需要文件名字 2.需要文件的类型
-(id)pathWithFileName:(NSString *)fileName withTypeName:(NSString *)typeName{

    //获取文件的路径
    NSString *path = [[NSBundle mainBundle]pathForResource:fileName ofType:typeName];
    
    //解析路径
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    //获取路径中的数据
    id dataId = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    //返回数据
    return dataId;

}


@end
