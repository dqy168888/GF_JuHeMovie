//
//  BasePushWebViewController.m
//  GF_MovieDemo
//
//  Created by GaoFei on 16/3/24.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "BasePushWebViewController.h"

@interface BasePushWebViewController ()

@end

@implementation BasePushWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadWebView];
}

//创建webView视图
- (void)loadWebView{
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    //适配屏幕
    webView.scalesPageToFit = YES;
    
    [self.view addSubview:webView];
    
    //创建加载网页视图
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:_weburl]];
    
    [webView loadRequest:request];
    
    //方法二:使用html加载
    //    NSString *path = [[NSBundle mainBundle]pathForResource:@"baidu.html" ofType:nil];
    //
    //    //将文件内容转化为字符串
    //    NSString *baidu = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    //
    //    //3.加载//    //3.加载html文件内容字符串
    //    [webView loadHTMLString:baidu baseURL:nil];
}

//
-(void)setWeburl:(NSString *)weburl{

    _weburl = weburl;
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
