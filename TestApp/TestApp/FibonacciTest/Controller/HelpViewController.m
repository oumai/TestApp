//
//  HelpViewController.m
//  Fibonacci
//
//  Created by woaiqiu947 on 16/9/8.
//  Copyright © 2016年 woaiqiu947. All rights reserved.
//

#import "HelpViewController.h"

@interface HelpViewController ()

@end

@implementation HelpViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.title = @"帮助";
////    NSString *labelText = @"";
////    switch (_helpType) {
////        case EPageHelpTypeNone:
////        {
////            labelText = @"1:建议左手拿手机，将左手食指轻轻放在手机背面的摄像头上，确保摄像头被完全覆盖\n2:点击开始测试\n3:保持这个姿势直到测试完成\n\n\n\n\n\n\n ";
////            myImageView.image = [UIImage imageNamed:@"hepl_bg"];
////        }
////            break;
////        case EPageHelpTypeEyeTest:
////        {
////            labelText = @"1:将手机放在距眼前40cm处\n2:尽量保持视线与屏幕中的“E”平行\n3:尽量保持视线与屏幕中的“E”平行\n\n\n\n\n\n\n ";
////            myImageView.image = [UIImage imageNamed:@"hepl_eye_bg"];
////        }
////            break;
////        case EPageHelpTypeColorTest:
////        {
////            labelText = @"1:选择您在图中看到的数字\n2:确认输入后继续\n3:全部选择完成后得到结果\n\n\n\n\n\n\n";
////            myImageView.image = [UIImage imageNamed:@"hepl_color_bg"];
////        }
////            break;
////
////        default:
////            break;
////    }
////
//
//    // Do any additional setup after loading the view.
//    UIImageView *img = [[UIImageView alloc]init];
//    img.image = [UIImage imageNamed:@"hepl_bg"];
//    [self.view addSubview:img];
//
//    WEAK_SELF(self);
//    [img mas_makeConstraints:^(MASConstraintMaker *make) {
//        STRONG_SELF(self);
//        make.top.equalTo(self.view);
//        make.width.mas_equalTo(320);
//        make.centerX.equalTo(self.view);
//
//    }];
//    NSString *labelText = @"1:建议左手拿手机，将左手食指轻轻放在手机背面的摄像头上，确保摄像头被完全覆盖\n2:点击开始测试\n3:保持这个姿势直到测试完成\n\n\n\n\n\n\n ";
//    UILabel *lb = [[UILabel alloc]init];
//    lb.numberOfLines = 0;
//    lb.font = [UIFont systemFontOfSize:14];
//    lb.textAlignment = NSTextAlignmentCenter;
//    lb.text = labelText;
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    [paragraphStyle setLineSpacing:5];
//    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
//    [attributedString addAttribute:NSForegroundColorAttributeName value:RGB(102, 102, 102) range:NSMakeRange(0, [labelText length])];
//    lb.attributedText = attributedString;
//
//    [self.view addSubview:lb];
//    [lb mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(img.mas_bottom).offset(30);
//        make.left.equalTo(img.mas_left);
//        make.right.equalTo(img.mas_right);
//    }];
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
@end

