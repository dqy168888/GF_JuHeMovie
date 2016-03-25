//
//  AppDelegate.m
//  GF_MovieDemo
//
//  Created by GaoFei on 16/3/19.
//  Copyright © 2016年 YF_S. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<CLLocationManagerDelegate>{

    CLLocationManager *locationmanager;
    CLGeocoder *_geoCoder;//编码管理者
}

@end

@implementation AppDelegate

//开启定位功能
-(void)loadlocationmanager{

    locationmanager = [[CLLocationManager alloc] init];
    
    _geoCoder = [[CLGeocoder alloc] init];
    
    if (IS_IOS8) {
        
        //设置代理
        locationmanager.delegate = self;
        
        //1.判断当前系统定位服务是否开启
        if (![CLLocationManager locationServicesEnabled]) {
            NSLog(@"系统定位服务未开启");
            
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];//<span style="font-family: Arial, Helvetica, sans-serif;">MBProgressHUD为第三方库，不需要可以省略或使用AlertView</span>
            hud.removeFromSuperViewOnHide =YES;
            hud.mode = MBProgressHUDModeText;
            hud.labelText = NSLocalizedString(@"系统定位服务未开启", nil);
            hud.minSize = CGSizeMake(132.f, 108.0f);
            [hud hide:YES afterDelay:3];
            
            return;
        }
        
        //2.判断当前应用是否获取定位授权
        if([CLLocationManager authorizationStatus]==kCLAuthorizationStatusNotDetermined)
        {
            //首次启动授权状态为kCLAuthorizationStatusNotDetermined
            
            //更改授权状态 应用程序使用时给予定位授权
            [locationmanager requestWhenInUseAuthorization];
            
            //允许应用程序一直使用定位
            //        [_locManager requestAlwaysAuthorization];
        }
        else if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusDenied)
        {
            NSLog(@"禁止修改授权状态");
            
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];//<span style="font-family: Arial, Helvetica, sans-serif;">MBProgressHUD为第三方库，不需要可以省略或使用AlertView</span>
            hud.removeFromSuperViewOnHide =YES;
            hud.mode = MBProgressHUDModeText;
            hud.labelText = NSLocalizedString(@"禁止修改授权状态", nil);
            hud.minSize = CGSizeMake(132.f, 108.0f);
            [hud hide:YES afterDelay:3];
        }
        //3.修改授权需要 更改应用程序的info.plist文件
        //NSLocationWhenInUseUsageDescription ---- kCLAuthorizationStatusAuthorizedWhenInUse
        //NSLocationAlwaysUsageDescription ---- kCLAuthorizationStatusAuthorizedAlways
        
        //4.设置管理者属性
        
        //设置定位精度
        /*
         extern const CLLocationAccuracy kCLLocationAccuracyBestForNavigation //导航时最精确位置__OSX_AVAILABLE_STARTING(__MAC_10_7,__IPHONE_4_0);
         extern const CLLocationAccuracy kCLLocationAccuracyBest; //最精确位置
         extern const CLLocationAccuracy kCLLocationAccuracyNearestTenMeters; //精确到十米范围
         extern const CLLocationAccuracy kCLLocationAccuracyHundredMeters;
         extern const CLLocationAccuracy kCLLocationAccuracyKilometer;
         extern const CLLocationAccuracy kCLLocationAccuracyThreeKilometers;
         */
        locationmanager.desiredAccuracy = kCLLocationAccuracyKilometer;
        
        //设置定位刷新距离 当移动距离大于100米时将重新定位
        locationmanager.distanceFilter = 100;
        
        //开启区域追踪
        //初始化中心坐标 确定经纬度 纬度：北-正，南-负 经度：东-正，西-负
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(37, 112);
        
        //初始化区域范围
        CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:coordinate radius:1000 identifier:@"hehe"];
        [locationmanager startMonitoringForRegion:region];
        
        //开启定位
        [locationmanager startUpdatingLocation];
    }

}

//2.反地理编码
-(void)reverseCode{
    //初始化CLLocation对象
//    CLLocation *loc = [[CLLocation alloc] initWithLatitude:36 longitude:116];
    
    //反编码
    [_geoCoder reverseGeocodeLocation:locationmanager.location completionHandler:^(NSArray *placemarks, NSError *error) {
        
        if (error) {
            NSLog(@"输入的地址在火星");
            
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];//<span style="font-family: Arial, Helvetica, sans-serif;">MBProgressHUD为第三方库，不需要可以省略或使用AlertView</span>
            hud.removeFromSuperViewOnHide =YES;
            hud.mode = MBProgressHUDModeText;
            hud.labelText = NSLocalizedString(@"地址解析错误", nil);
            hud.minSize = CGSizeMake(132.f, 108.0f);
            [hud hide:YES afterDelay:3];
            
            return;
        }
        else
        {
            //获取到反编码对象
            CLPlacemark *pm = [placemarks firstObject];
            
            [[NSUserDefaults standardUserDefaults] setObject:pm.locality forKey:@"locationCity"];
            
            /*
             pm.country  国家
             pm.locality 城市
             pm.subLocality 子城市
             pm.thoroughfare 街道
             pm.subThoroughfare 子街道
             */
            
            NSString *address = [NSString stringWithFormat:@"%@ %@ %@ %@ %@",pm.country,pm.locality,pm.subLocality,pm.thoroughfare,pm.subThoroughfare];
            
            NSLog(@"addrss is:%@",address);
            
            NSLog(@"pm.name :%@",pm.name);
            
        }
        
        
    }];
    
}

//当用户定位信息发生改变时调用
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    NSLog(@"count is:%ld",locations.count);
    
    //1.从数组中获取到CLLocation对象 （数组中可能会存在多个对象，取出第一个最精确的对象）
    CLLocation *loc = locations[0];
    
    //取出经纬度
    CLLocationCoordinate2D coordinate = loc.coordinate;
    
    NSLog(@"精度：%f,纬度：%f",coordinate.longitude,coordinate.latitude);
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [self loadlocationmanager];
    
    [self reverseCode];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
