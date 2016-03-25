//
//  BasePath.h
//  M_Time
//
//  Created by mac on 15/12/5.
//  Copyright (c) 2015年 YF_S. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasePath : NSObject

//返回一个id类型的  1.需要文件名字 2.需要文件的类型
+(id)pathWithFileName:(NSString *)fileName withTypeName:(NSString *)typeName;

//返回一个id类型的  1.需要文件名字 2.需要文件的类型
-(id)pathWithFileName:(NSString *)fileName withTypeName:(NSString *)typeName;


@end
