//
//  CityHotMovieModel.h
//  GF_MovieDemo
//
//  Created by GaoFei on 16/3/20.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "BaseModel.h"

@interface CityHotMovieModel : BaseModel

@property (nonatomic,copy) NSString *link, *name;

@property (nonatomic,retain) NSArray *data;

/*
 {
 "link" : "http:\/\/theater.mtime.com\/China_Shandong_Province_Weifang\/movie\/#hot",
 "name" : "正在上映",
 
 、、----------- 基本信息 -----------------
 
 "data" : [
 {
 "tvTitle" : "荒野猎人",
 "gradeNum" : "\/10.0(时光网)",
 "iconlinkUrl" : "http:\/\/movie.mtime.com\/156682\/",
 
 ---------------------   导演   ----------------------
 "director" : {
 "showname" : "导演",
 "data" : {
 "1" : {
 "link" : "http:\/\/people.mtime.com\/1248624\/",
 "name" : "亚利桑德罗·冈萨雷斯·伊纳里图"
 },
 "m_1" : {
 "link" : "http:\/\/m.mtime.cn\/#!\/person\/1248624\/"
 }
 }
 },
 
 ---------------------   演员    ----------------------
 
 "star" : {
 "data" : {
 "m_3" : {
 "link" : "http:\/\/m.mtime.cn\/#!\/person\/1266469\/"
 },
 "3" : {
 "link" : "http:\/\/people.mtime.com\/1266469\/",
 "name" : "威尔·保尔特"
 },
 "4" : {
 "link" : "http:\/\/people.mtime.com\/1372905\/",
 "name" : "多姆纳尔·格里森"
 },
 "m_2" : {
 "link" : "http:\/\/m.mtime.cn\/#!\/person\/917362\/"
 },
 "1" : {
 "link" : "http:\/\/people.mtime.com\/924319\/",
 "name" : "莱昂纳多·迪卡普里奥"
 },
 "m_1" : {
 "link" : "http:\/\/m.mtime.cn\/#!\/person\/924319\/"
 },
 "m_4" : {
 "link" : "http:\/\/m.mtime.cn\/#!\/person\/1372905\/"
 },
 "2" : {
 "link" : "http:\/\/people.mtime.com\/917362\/",
 "name" : "汤姆·哈迪"
 }
 },
 "showname" : "主演"
 },
 
 -------------   上映时间   -----------------
 
 "playDate" : {
 "data2" : "2016-3-18",
 "showname" : "上映日期",
 "data" : "2016年3月18日"
 },
 
 -------------------  类型  ------------
 
 
 "type" : {
 "showname" : "类型",
 "data" : {
 "3" : {
 "link" : "http:\/\/movie.mtime.com\/movie\/search\/section\/?type=Thriller",
 "name" : "惊悚"
 },
 "1" : {
 "link" : "http:\/\/movie.mtime.com\/movie\/search\/section\/?type=Adventure",
 "name" : "冒险"
 },
 "4" : {
 "link" : "http:\/\/movie.mtime.com\/movie\/search\/section\/?type=Western",
 "name" : "西部"
 },
 "2" : {
 "link" : "http:\/\/movie.mtime.com\/movie\/search\/section\/?type=Drama",
 "name" : "剧情"
 }
 }
 },
 
 
 
 "iconaddress" : "http:\/\/p0.qhimg.com\/t0114d026fa0940d880.jpg",
 "m_iconlinkUrl" : "http:\/\/m.mtime.cn\/#!\/movie\/156682\/",
 "story" : {
 "showname" : "剧情",
 "data" : {
 "storyMoreLink" : "http:\/\/movie.mtime.com\/156682\/plots.html",
 "storyBrief" : "《荒野猎人》根据迈克尔·彭克的长篇小说改编，原著讲述了一名皮草猎人在森林中被熊所伤，他乘.."
 }
 },
 "grade" : "8.1",
 "subHead" : "今日14家影院上映",
 
 
 "more" : {
 "data" : [
 {
 "name" : "选座购票",
 "link" : "http:\/\/theater.mtime.com\/China_Shandong_Province_Weifang\/movie\/156682\/"
 },
 {
 "name" : "剧照\/海报",
 "link" : "http:\/\/movie.mtime.com\/156682\/posters_and_images\/"
 },
 {
 "link" : "http:\/\/m.mtime.cn\/#!\/movie\/156682\/posters_and_images\/"
 },
 {
 "link" : "http:\/\/m.mtime.cn\/#!\/movie\/156682\/comment\/"
 },
 {
 "link" : "http:\/\/m.mtime.cn\/#!\/theater\/839\/movie\/156682\/"
 },
 {
 "name" : "热门影评",
 "link" : "http:\/\/movie.mtime.com\/156682\/comment.html"
 }
 ],
 "showname" : "更多"
 }
 },
 */

@end
