//
//  ViewController.m
//  TestApp
//
//  Created by MichaeOu on 2017/5/26.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "MedicallyExaminedViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    天干:
//    甲乙丙丁戊
//    己庚辛壬癸
//
//
//    地支
//
//    子丑寅卯辰巳
//    午未申酉戌亥
//
//
//    鼠牛虎兔龙蛇
//    马羊猴鸡狗猪
    
    NSLog(@"%@",[ViewController getLocationVersion]);
    
   
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor cyanColor];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    
}

- (void)buttonClick
{
    
//    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
//    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
//
//    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://hc003tn-appapi.chinacloudsites.cn/#/tab/healthArchive/basicInfoCompleteness?Authorization=Basic%20ODYxMjMyMDExMTIwMDc1OjMwMjU3NzgyNzQ=&userCode=3025778274"]];
//
//    [self.view addSubview: webView];
//
//    [webView loadRequest:request];
    
    
    MedicallyExaminedViewController *medicallyVC = [[MedicallyExaminedViewController alloc]init];
    [self.navigationController pushViewController:medicallyVC animated:YES];
}

+ (NSString *)getLocationVersion
{

    NSDictionary *dic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentString = [dic objectForKey:@"CFBundleShortVersionString"];
    NSString *showString = [NSString stringWithFormat:@"%@",currentString];
    
    return showString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
