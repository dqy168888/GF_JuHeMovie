//
//  SearchMovieModel.h
//  GF_JuHeMovie
//
//  Created by GaoFei on 16/3/26.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "BaseModel.h"
#import "SearchAct_S_Model.h"
#import "SearchVideo_Rec_Model.h"

@interface SearchMovieModel : BaseModel

@property (nonatomic,copy) NSString *title, *tag, *act, *year, *area, *dir, *desc, *cover, *vdo_status;

@property (nonatomic,retain) NSNumber *rating;

@property (nonatomic,retain) NSDictionary *playlinks;

@property (nonatomic,retain) NSArray *video_rec, *act_s;

@property (nonatomic,retain) NSMutableArray *video_rec_arr, *act_s_arr;

@property (nonatomic,retain) SearchAct_S_Model *act_s_model;
@property (nonatomic,retain) SearchVideo_Rec_Model *video_rec_model;

/*
 "result":{
 "title":"宝贝计划",
 "tag":"动作 \/ 喜剧 \/ 剧情",
 "act":"成龙 许冠文 古天乐 蔡卓妍 高圆圆 陈宝国 元彪 余安安",
 "year":"2006",
 "rating":7.1,
 "area":"大陆 \/ 香港",
 "dir":"陈木胜",
 "desc":"故事围绕一个刚出生的宝宝开始。人字拖（成龙饰）虽有不凡的身手，可是终日沉迷赌博毫无人生目标，便与包租公（许冠文饰）、八达通（古天乐饰）一起爆窃，干着偷偷摸摸的犯罪事。城中女富豪（余安安饰）唯一的孙子出生后，包租公受不了金钱的诱惑，答应把宝宝偷给黑帮老大，以证明BB是否自己死去的儿子与前女友的孩子。\r\n成功偷得孩子后，一连串发生的事情，使人字拖及八达通改变了自己的人生观念。人字拖开始关心家人，八达通也看到了自己老婆（蔡卓妍饰）的不易，开始重新做人。\r\n在包租公及黑势利的威胁下，他们还是要把偷来的BB交出来，到底又会发生些什么事，故事有会否大团圆结局呢？",
 "cover":"http:\/\/p7.qhimg.com\/d\/dy_2bd301d0da14a1187faa2541d5b756d0.jpg",
 "vdo_status":"play",
 "playlinks":{
 "m1905":"http:\/\/www.1905.com\/vod\/play\/85345.shtml",
 "imgo":"http:\/\/www.hunantv.com\/v\/3\/54328\/f\/709741.html",
 "qq":"http:\/\/v.qq.com\/cover\/r\/ruex4wk8ynvxxkx.html"
 },
 "video_rec":[
 {
 "cover":"http:\/\/p7.qhimg.com\/d\/dy_2f5d9ba522435741adcd33ebc921dbf5.jpg",
 "detail_url":"http:\/\/www.360kan.com\/m\/gafkYxH2QnX2SB.html",
 "title":"警察故事4：简单任务"
 },
 {
 "cover":"http:\/\/p8.qhimg.com\/d\/dy_f4a4bfed5a8fe1cc58b879cf3aa59d80.jpg",
 "detail_url":"http:\/\/www.360kan.com\/m\/gqjmY0MoQHP0Sh.html",
 "title":"飞龙猛将"
 },
 {
 "cover":"http:\/\/p1.qhimg.com\/t01cf308c4a6cc74519.jpg",
 "detail_url":"http:\/\/www.360kan.com\/m\/haPmYkP6SHr1SR.html",
 "title":"十二生肖"
 },
 {
 "cover":"http:\/\/p7.qhimg.com\/d\/dy_3398cb871e22f9e9bdba7f5f3bd14ff9.jpg",
 "detail_url":"http:\/\/www.360kan.com\/m\/gajjZUUoQHL0UR.html",
 "title":"夏日福星"
 },
 {
 "cover":"http:\/\/p0.qhimg.com\/d\/dy_66f32d8b272d358d2dd893e437d18682.jpg",
 "detail_url":"http:\/\/www.360kan.com\/m\/g6vmYkcrQHL1Sx.html",
 "title":"福星高照"
 }
 ],
 "act_s":[
 {
 "name":"成龙",
 "url":"http:\/\/baike.so.com\/doc\/3731460-3920668.html",
 "image":"http:\/\/i5.qhimg.com\/dmsmty\/120_110_100\/t016430d16ba657f1ee.png"
 },
 {
 "name":"许冠文",
 "url":"http:\/\/baike.so.com\/doc\/2864907-3023295.html",
 "image":"http:\/\/i8.qhimg.com\/dmsmty\/120_110_100\/t01f91daeb8633fd0a2.jpg"
 },
 {
 "name":"古天乐",
 "url":"http:\/\/baike.so.com\/doc\/592390-627107.html",
 "image":"http:\/\/i2.qhimg.com\/dmsmty\/120_110_100\/t0157a550b869ae0d5d.jpg"
 },
 {
 "name":"蔡卓妍",
 "url":"http:\/\/baike.so.com\/doc\/465818-493241.html",
 "image":"http:\/\/i4.qhimg.com\/dmsmty\/120_110_100\/t01ff9bb8769420d476.jpg"
 },
 {
 "name":"高圆圆",
 "url":"http:\/\/baike.so.com\/doc\/115692-122108.html",
 "image":"http:\/\/i6.qhimg.com\/dmsmty\/120_110_100\/t0193d3e49d10cb5fb7.jpg"
 },
 {
 "name":"陈宝国",
 "url":"http:\/\/baike.so.com\/doc\/5353477-5588940.html",
 "image":"http:\/\/i7.qhimg.com\/dmsmty\/120_110_100\/t01f62e58cae9d8b533.jpg"
 },
 {
 "name":"元彪",
 "url":"http:\/\/baike.so.com\/doc\/914737-966909.html",
 "image":"http:\/\/i5.qhimg.com\/dmsmty\/120_110_100\/t01c0f7580116ec7082.jpg"
 }
 ]
	},

 */

@end
