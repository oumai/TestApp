//
//  BATFibonacciResultViewController.m
//  HealthBAT_Pro
//
//  Created by kmcompany on 2017/10/18.
//  Copyright © 2017年 KMHealthCloud. All rights reserved.
//

#import "BATFibonacciResultViewController.h"
#import "BATOTCDrugModel.h"
#import "BATShoppingTrolleyView.h"
#import "BATOTCDrugCellTableViewCell.h"
#import "BATResultCell.h"
//#import "BATOTCProductView.h"
//#import "BATSubmitOrderViewController.h"

@interface BATFibonacciResultViewController ()<UITableViewDelegate,UITableViewDataSource,BATOTCDrugCellTableViewCellDelegate,BATShoppingTrolleyViewDelegate>//,BATOTCProductViewDelegate>

@property (nonatomic,strong) UITableView *resultTab;

@property (nonatomic,strong) BATOTCDrugModel *model;

@property (nonatomic,strong) BATShoppingTrolleyView *shoppingView;

@property(nonatomic,strong) NSString *tags;

@property (nonatomic,assign) CGFloat totalPrice;

@property (nonatomic,assign) NSInteger totalCount;

@property (nonatomic,strong) UIView *blackBackView;

//@property (nonatomic,strong) BATOTCProductView *shoppingCar;

@property (nonatomic,assign) BOOL isOpen;

@property (nonatomic,strong) NSMutableArray *dataArry;

@property (nonatomic,assign) NSInteger height;

@property (nonatomic,strong) UIView *topBlackView;

@end

@implementation BATFibonacciResultViewController

//- (void)dealloc {
//    [self.topBlackView removeFromSuperview];
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//
//    NSMutableArray *data =  [NSKeyedUnarchiver unarchiveObjectWithFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DrugModel.data"]];
//
//    NSMutableArray *tempData = [NSMutableArray array];
//    for (OTCSearchData *data in self.model.Data) {
//        if (data.drugCount >0) {
//            [tempData addObject:data];
//        }
//    }
//    for (int i=0; i<tempData.count; i++) {
//        OTCSearchData *mainData = tempData[i];
//        BOOL isTheSame = NO;
//        for (int j=0; j<data.count; j++) {
//            OTCSearchData *changeData = data[j];
//            if ([mainData.ID isEqualToString:changeData.ID]) {
//                 changeData.drugCount = mainData.drugCount;
//                isTheSame = YES;
//                break;
//            }
//
//        }
//        if (!isTheSame) {
//            [data addObject:mainData];
//        }
//    }
//
//
//
//    NSString *file = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DrugModel.data"];
//    [NSKeyedArchiver archiveRootObject:data toFile:file];
//}
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    WEAK_SELF(self);
//    self.title = @"药品推荐";
//    self.dataArry = [NSMutableArray array];
//    [self.view addSubview:self.resultTab];
//
//    self.topBlackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 65)];
//    self.topBlackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
//    self.topBlackView.hidden = YES;
//    [[UIApplication sharedApplication].keyWindow addSubview:self.topBlackView];
//
//    self.blackBackView = [[UIView alloc]initWithFrame:CGRectMake(0,-64, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    self.blackBackView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
//    self.blackBackView.hidden = YES;
//    self.blackBackView.userInteractionEnabled = YES;
//    [self.blackBackView bk_whenTapped:^{
//        STRONG_SELF(self);
//        [self BATShoppingTrolleyViewShoppingCarAction];
//    }];
//    [self.view addSubview:self.blackBackView];
//
//     [self.view addSubview:self.shoppingCar];
//
//    self.shoppingView = [[[NSBundle mainBundle] loadNibNamed:@"BATShoppingTrolleyView" owner:self options:nil] lastObject];
//    self.shoppingView.delegate = self;
//    [self.view addSubview:self.shoppingView];
//    [self.shoppingView mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.left.right.bottom.equalTo(self.view);
//        make.height.mas_equalTo(50);
//    }];
//
//    [self  getRecommendRequest];
//
//    NSMutableArray *data =  [NSKeyedUnarchiver unarchiveObjectWithFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DrugModel.data"]];
//    NSLog(@"%@",data);
//    [self.dataArry addObjectsFromArray:data];
//
//    if (self.dataArry.count >0) {
//        for (OTCSearchData *data in self.dataArry) {
//            if (data.isSelect) {
//                if (data.drugCount >0) {
//                    self.totalCount += data.drugCount;
//                    self.totalPrice += data.drugCount * [data.Price floatValue];
//                }
//            }
//        }
//        self.shoppingView.priceLb.text = [NSString stringWithFormat:@"¥%.2f",self.totalPrice];
//        [self.shoppingView.countBtn setTitle:[NSString stringWithFormat:@"结算 (%zd)",self.totalCount] forState:UIControlStateNormal];
//    }
//}
//
//- (void)getRecommendRequest {
//
//    NSString *heightPressureTag = nil;
//    if (self.heightPressureValue == 0) {
//        heightPressureTag = @"低血压";
//    }else if(self.heightPressureValue == 1){
//        heightPressureTag = @"保健品";
//    }else {
//
//        heightPressureTag = @"高血压";
//    }
//
//    NSString *heartRateTag = nil;
//    if (self.heartRateValue == 0) {
//        heartRateTag = @"心率不齐";
//    }else if(self.heartRateValue == 1){
//        heartRateTag = @"保健品";
//    }else {
//        heartRateTag = @"心率不齐";
//
//    }
//
//    NSString *bloodOxygen = nil;
//    if (self.bloodOxygenValue == 0) {
//        bloodOxygen = @"血氧低";
//    }else if(self.bloodOxygenValue == 1){
//        bloodOxygen = @"保健品";
//    }else {
//        bloodOxygen = @"血氧高";
//
//    }
//
////    NSString *tag = [NSString stringWithFormat:@"%@,%@,%@",heightPressureTag,bloodOxygen,heartRateTag];
////    self.tags = tag;
////    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
////    [dict setValue:@"" forKey:@"storeId"];
////    [dict setValue:tag forKey:@"tags"];
////
////    [HTTPTool requestWithOTCURLString:@"/api/drug/GetRecommendDrugList" parameters:dict type:kGET success:^(id responseObject) {
////
////        self.model = [BATOTCDrugModel mj_objectWithKeyValues:responseObject];
////        NSLog(@"%@",responseObject);
////
////        NSMutableArray *mainData =  [NSKeyedUnarchiver unarchiveObjectWithFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DrugModel.data"]];
////        for (OTCSearchData *data in self.model.Data) {
////            for (OTCSearchData *tempData in mainData) {
////                if ([tempData.ID isEqualToString:data.ID]) {
////                    data.drugCount = tempData.drugCount;
////                }
////            }
////        }
////        [self.resultTab reloadData];
////    } failure:^(NSError *error) {
////
////    }];
//
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    return 2;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    if (indexPath.section == 1) {
//        return 90;
//    }
//    return 57;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    if (section == 0) {
//        return 1;
//    }else {
//
//        return self.model.Data.count;
//    }
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    if (indexPath.section == 1) {
//        BATOTCDrugCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BATOTCDrugCellTableViewCell"];
//        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
//        cell.rowPath = indexPath;
//        cell.delegate = self;
//        if (self.model) {
//            cell.drugModel = self.model.Data[indexPath.row];
//        }
//        return cell;
//    }else {
//        BATResultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BATResultCell"];
//        if(self.tags) {
//            cell.tags = self.tags;
//        }
//        return cell;
//
//    }
//
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//
//    if (section == 1) {
//        return 34;
//    }
//
//    return 0;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//
//    if (section == 1) {
//        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 34)];
//        backView.backgroundColor = [UIColor whiteColor];
//
//        UILabel *titleLb = [[UILabel alloc]init];
//        titleLb.font = [UIFont systemFontOfSize:15];
//        titleLb.textColor = UIColorFromRGB(51, 51, 51, 1);
//        titleLb.text = @"推荐您使用";
//        [backView addSubview:titleLb];
//
//        [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
//
//            make.left.equalTo(backView.mas_left).offset(10);
//            make.centerY.equalTo(backView.mas_centerY);
//
//        }];
//
//        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 34, SCREEN_WIDTH, 0.5)];
//        lineView.backgroundColor = UIColorFromRGB(224, 224, 224, 1);
//        [backView addSubview:lineView];
//
//        return backView;
//    }
//
//    return nil;
//
//}
//
//#pragma mark - BATOTCDrugCellTableViewCellDelegate
////增加
//- (void)BATOTCDrugCellTableViewCellDelegateWithAddActionRowPaht:(NSIndexPath *)rowPath cell:(BATOTCDrugCellTableViewCell *)cell {
//
//    OTCSearchData *SearchData = self.model.Data[rowPath.row];
//    SearchData.drugCount += 1;
//    SearchData.isSelect = YES;
//    self.totalCount = 0;
//    self.totalPrice = 0.0;
//    NSMutableArray *data =  [NSKeyedUnarchiver unarchiveObjectWithFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DrugModel.data"]];
//    if (data == nil) {
//
//        data = [NSMutableArray array];
//    }
//    NSMutableArray *tempData = [NSMutableArray array];
//    for (OTCSearchData *data in self.model.Data) {
//        if (data.drugCount >0) {
//            [tempData addObject:data];
//        }
//    }
//    for (int i=0; i<tempData.count; i++) {
//        OTCSearchData *mainData = tempData[i];
//        BOOL isTheSame = NO;
//        for (int j=0; j<data.count; j++) {
//            OTCSearchData *changeData = data[j];
//            if ([mainData.ID isEqualToString:changeData.ID]) {
//                changeData.drugCount = mainData.drugCount;
//                isTheSame = YES;
//                break;
//            }
//
//        }
//        if (!isTheSame) {
//            [data addObject:mainData];
//        }
//    }
//
//    for (OTCSearchData *checkData in data) {
//        if ([checkData.ID isEqualToString:SearchData.ID]) {
//            checkData.drugCount = SearchData.drugCount;
//            checkData.isSelect = YES;
//        }
//    }
//
//    NSString *file = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DrugModel.data"];
//    [NSKeyedArchiver archiveRootObject:data toFile:file];
//
//    for (OTCSearchData *mainData in data) {
//        if (mainData.isSelect) {
//            self.totalCount += mainData.drugCount;
//            if (mainData.drugCount >0) {
//                self.totalPrice += mainData.drugCount * [mainData.Price floatValue];
//            }
//        }
//    }
//
//    if(self.totalCount <=0){
//
//        self.totalCount = 0;
//        [self.shoppingView.countBtn setTitle:@"结算" forState:UIControlStateNormal];
//        self.shoppingView.priceLb.text = @"¥0.00";
//    }else {
//        self.shoppingView.priceLb.text = [NSString stringWithFormat:@"¥%.2f",self.totalPrice];
//        [self.shoppingView.countBtn setTitle:[NSString stringWithFormat:@"结算 (%zd)",self.totalCount] forState:UIControlStateNormal];
//    }
//
//    [self.resultTab reloadRowsAtIndexPaths:@[rowPath] withRowAnimation:UITableViewRowAnimationNone];
//}
////减少
//-(void)BATOTCDrugCellTableViewCellDelegateWithReduceActionRowPaht:(NSIndexPath *)rowPath cell:(BATOTCDrugCellTableViewCell *)cell {
//
//    OTCSearchData *SearchData = self.model.Data[rowPath.row];
//    SearchData.drugCount -=1;
//    if(SearchData.drugCount <=0){
//        SearchData.drugCount = 0;
//        SearchData.isSelect = NO;
//    }
//
//    self.totalCount = 0;
//    self.totalPrice = 0.0;
//    NSMutableArray *data =  [NSKeyedUnarchiver unarchiveObjectWithFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DrugModel.data"]];
//
//    NSMutableArray *tempData = [NSMutableArray array];
//    for (OTCSearchData *data in self.model.Data) {
//        if (data.drugCount >0) {
//            [tempData addObject:data];
//        }
//    }
//    for (int i=0; i<tempData.count; i++) {
//        OTCSearchData *mainData = tempData[i];
//        BOOL isTheSame = NO;
//        for (int j=0; j<data.count; j++) {
//            OTCSearchData *changeData = data[j];
//            if ([mainData.ID isEqualToString:changeData.ID]) {
//                changeData.drugCount = mainData.drugCount;
//                isTheSame = YES;
//                break;
//            }
//
//        }
//        if (!isTheSame) {
//            [data addObject:mainData];
//        }
//    }
//
//    for (OTCSearchData *checkData in data) {
//        if ([checkData.ID isEqualToString:SearchData.ID]) {
//            checkData.drugCount = SearchData.drugCount;
//        }
//    }
//
//    [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//
//        OTCSearchData *tempSearchData = obj;
//        if (tempSearchData.drugCount == 0) {
//            [data removeObjectAtIndex:idx];
//        }
//    }];
//
//    NSString *file = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DrugModel.data"];
//    [NSKeyedArchiver archiveRootObject:data toFile:file];
//
//
//    for (OTCSearchData *mainData in data) {
//        if (mainData.isSelect) {
//            self.totalCount += mainData.drugCount;
//            if (mainData.drugCount >0) {
//                self.totalPrice += mainData.drugCount * [mainData.Price floatValue];
//            }
//        }
//    }
//
//    if(self.totalCount <=0){
//
//        self.totalCount = 0;
//        [self.shoppingView.countBtn setTitle:@"结算" forState:UIControlStateNormal];
//        self.shoppingView.priceLb.text = @"¥0.00";
//    }else {
//        self.shoppingView.priceLb.text = [NSString stringWithFormat:@"¥%.2f",self.totalPrice];
//        [self.shoppingView.countBtn setTitle:[NSString stringWithFormat:@"结算 (%zd)",self.totalCount] forState:UIControlStateNormal];
//    }
//
//    [self.resultTab reloadRowsAtIndexPaths:@[rowPath] withRowAnimation:UITableViewRowAnimationNone];
//}
//
//#pragma mark - BATShoppingTrolleyViewDelegate
////结算按钮
//- (void)BATShoppingTrolleyViewCountAcion {
//
//
////    NSMutableArray *tempData = [NSMutableArray array];
////    for (OTCSearchData *data in self.model.Data) {
////        if (data.drugCount >0) {
////            [tempData addObject:data];
////        }
////    }
//    NSMutableArray *data =  [NSKeyedUnarchiver unarchiveObjectWithFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DrugModel.data"]];
//
////    [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
////
////        OTCSearchData *searchData = obj;
////        if (!searchData.isSelect) {
////            [data removeObjectAtIndex:idx];
////        }
////    }];
////
////    NSMutableArray *data3 = [NSMutableArray array];
////    for (OTCSearchData *data0 in data) {
////        BOOL isTheSame = NO;
////        for (OTCSearchData *data1 in tempData) {
////            if ([data0.ID isEqualToString:data1.ID]) {
////                isTheSame = YES;
////            }
////        }
////        if (!isTheSame) {
////            [data3 addObject:data0];
////        }
////    }
////    [tempData addObjectsFromArray:data3];
////
////    NSString *file = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DrugModel.data"];
////    [NSKeyedArchiver archiveRootObject:data toFile:file];
//
//
//    if (data.count == 0) {
//        [self showText:@"没有添加商品"];
//        return;
//    }
//
//    BOOL isPush = NO;
//    for (OTCSearchData *selectData in data) {
//        if (selectData.isSelect) {
//            isPush = YES;
//            break;
//        }
//    }
//    if (!isPush) {
//        [self showText:@"没有选中商品"];
//        return;
//    }
//
//    if (self.isOpen) {
//        self.topBlackView.hidden = YES;
//        self.blackBackView.hidden = YES;
//        [self BATShoppingTrolleyViewShoppingCarAction];
//    }
//
//    BATSubmitOrderViewController *subminVC = [[BATSubmitOrderViewController alloc]init];
//    NSMutableArray *contData = [NSMutableArray array];
//    for (OTCSearchData *tempCountData in data) {
//        if (tempCountData.isSelect) {
//            [contData addObject:tempCountData];
//        }
//    }
//    subminVC.dataArry = contData;
//    subminVC.orderType = BATOTCOrderType_NonPrescriptionDrugs;
//    [self.navigationController pushViewController:subminVC animated:YES];
//}
////点击购物车按钮
//- (void)BATShoppingTrolleyViewShoppingCarAction {
//
//    if (!self.isOpen) {
//
//        NSMutableArray *tempData = [NSMutableArray array];
//        for (OTCSearchData *data in self.model.Data) {
//            if (data.drugCount >0) {
//                [tempData addObject:data];
//            }
//        }
//
//        NSMutableArray *data =  [NSKeyedUnarchiver unarchiveObjectWithFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DrugModel.data"]];
//
//
//        NSMutableArray *data3 = [NSMutableArray array];
//        for (OTCSearchData *data0 in data) {
//            BOOL isTheSame = NO;
//            for (OTCSearchData *data1 in tempData) {
//                if ([data0.ID isEqualToString:data1.ID]) {
//                    isTheSame = YES;
//                    data1.isSelect = data0.isSelect;
//                    break;
//                }
//            }
//            if (!isTheSame) {
//                [data3 addObject:data0];
//            }
//        }
//        // [tempData addObjectsFromArray:data3];
//        [data3 addObjectsFromArray:tempData];
//
//        [data3 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//
//            OTCSearchData *removeData = obj;
//            if (removeData.drugCount == 0) {
//                [data3 removeObject:removeData];
//            }
//        }];
//
//        NSString *file = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DrugModel.data"];
//        [NSKeyedArchiver archiveRootObject:data3 toFile:file];
//
//        self.shoppingCar.shoppingData = data3;
//
//        if (data3.count>4) {
//            self.height = 4*90 +34;
//        }else {
//            self.height = data3.count * 90 + 34;
//        }
//        self.blackBackView.hidden = NO;
//        self.topBlackView.hidden = NO;
//        [UIView animateWithDuration:0.3 animations:^{
//
//            self.shoppingCar.frame = CGRectMake(0, SCREEN_HEIGHT- 50 -self.height-64, SCREEN_WIDTH, self.height);
//        }];
//
//        self.isOpen = !self.isOpen;
//    }else {
//        self.blackBackView.hidden = YES;
//        self.topBlackView.hidden = YES;
//        NSMutableArray *data =  [NSKeyedUnarchiver unarchiveObjectWithFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DrugModel.data"]];
//
//        for (OTCSearchData *modelData in self.model.Data) {
//            for (OTCSearchData *mainData in data) {
//                if ([modelData.ID isEqualToString:mainData.ID]) {
//                    modelData.drugCount = mainData.drugCount;
//                    if (mainData.drugCount == 0) {
//                        modelData.isSelect = NO;
//                    }
//                }
//            }
//        }
//
//
//        [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//
//            OTCSearchData *searchData = obj;
//            if (searchData.drugCount == 0) {
//                [data removeObject:searchData];
//            }
//
//        }];
//
//        NSString *file = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DrugModel.data"];
//        [NSKeyedArchiver archiveRootObject:data toFile:file];
//
//        //        for (OTCSearchData *modelData in self.model.Data) {
//        //            for (OTCSearchData *mainData in data) {
//        //                if ([modelData.ID isEqualToString:mainData.ID]) {
//        //                    modelData.drugCount = mainData.drugCount;
//        //                }
//        //            }
//        //        }
//
//
//
//        [self.resultTab reloadData];
//
//        [UIView animateWithDuration:0.3 animations:^{
//
//            self.shoppingCar.frame = CGRectMake(0, SCREEN_HEIGHT - 50, SCREEN_WIDTH, self.height);
//        }];
//        self.isOpen = !self.isOpen;
//    }
//}
//
//#pragma mark - BATOTCProductViewDelegate
//- (void)BATOTCProductViewDelegateWithModel:(OTCSearchData *)model {
//
//    self.totalCount = 0;
//    self.totalPrice = 0.0;
//
//
//    NSMutableArray *data =  [NSKeyedUnarchiver unarchiveObjectWithFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DrugModel.data"]];
//
//    NSMutableArray *tempData = [NSMutableArray array];
//    for (OTCSearchData *data in self.model.Data) {
//        if ([data.ID isEqualToString:model.ID]) {
//            data.isSelect = model.isSelect;
//        }
//        if (data.drugCount >0) {
//            [tempData addObject:data];
//        }
//    }
//    for (int i=0; i<tempData.count; i++) {
//        OTCSearchData *mainData = tempData[i];
//        BOOL isTheSame = NO;
//        for (int j=0; j<data.count; j++) {
//            OTCSearchData *changeData = data[j];
//            if ([mainData.ID isEqualToString:changeData.ID]) {
//                 changeData.drugCount = mainData.drugCount;
//                isTheSame = YES;
//                break;
//            }
//
//        }
//        if (!isTheSame) {
//            [data addObject:mainData];
//        }
//    }
//
//    for (OTCSearchData *tempData in data) {
//        if ([tempData.ID isEqualToString:model.ID]) {
//            tempData.isSelect = model.isSelect;
//        }
//    }
//
//    NSString *file = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DrugModel.data"];
//    [NSKeyedArchiver archiveRootObject:data toFile:file];
//
//    for (OTCSearchData *data1 in data) {
//        if (data1.isSelect) {
//            self.totalCount += data1.drugCount;
//            if (data1.drugCount >0) {
//                self.totalPrice += data1.drugCount * [data1.Price floatValue];
//            }
//        }
//    }
//
//    if(self.totalCount <=0){
//
//        self.totalCount = 0;
//        [self.shoppingView.countBtn setTitle:@"结算" forState:UIControlStateNormal];
//        self.shoppingView.priceLb.text = @"¥0.00";
//    }else {
//        self.shoppingView.priceLb.text = [NSString stringWithFormat:@"¥%.2f",self.totalPrice];
//        [self.shoppingView.countBtn setTitle:[NSString stringWithFormat:@"结算 (%zd)",self.totalCount] forState:UIControlStateNormal];
//    }
//}
//
//- (void)BATOTCProductViewAddActionDelegateWithModel:(OTCSearchData *)model {
//    self.totalCount = 0;
//    self.totalPrice = 0.0;
//
//
//    NSMutableArray *data =  [NSKeyedUnarchiver unarchiveObjectWithFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DrugModel.data"]];
//
//    NSMutableArray *tempData = [NSMutableArray array];
//    for (OTCSearchData *data in self.model.Data) {
//        if (data.drugCount >0) {
//            [tempData addObject:data];
//        }
//    }
//    for (int i=0; i<tempData.count; i++) {
//        OTCSearchData *mainData = tempData[i];
//        BOOL isTheSame = NO;
//        for (int j=0; j<data.count; j++) {
//            OTCSearchData *changeData = data[j];
//            if ([mainData.ID isEqualToString:changeData.ID]) {
//                 changeData.drugCount = mainData.drugCount;
//                isTheSame = YES;
//                break;
//            }
//
//        }
//        if (!isTheSame) {
//            [data addObject:mainData];
//        }
//    }
//
//    for (OTCSearchData *checkData in data) {
//        if ([checkData.ID isEqualToString:model.ID]) {
//            checkData.drugCount = model.drugCount;
//        }
//    }
//
//    NSString *file = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DrugModel.data"];
//    [NSKeyedArchiver archiveRootObject:data toFile:file];
//
//    for (OTCSearchData *checkData in self.model.Data) {
//        if ([checkData.ID isEqualToString:model.ID]) {
//            checkData.drugCount = model.drugCount;
//        }
//    }
//
//
//    for (OTCSearchData *mainData in data) {
//        if (mainData.isSelect) {
//            self.totalCount += mainData.drugCount;
//            if (mainData.drugCount >0) {
//                self.totalPrice += mainData.drugCount * [mainData.Price floatValue];
//            }
//        }
//    }
//
//    if(self.totalCount <=0){
//
//        self.totalCount = 0;
//        [self.shoppingView.countBtn setTitle:@"结算" forState:UIControlStateNormal];
//        self.shoppingView.priceLb.text = @"¥0.00";
//    }else {
//        self.shoppingView.priceLb.text = [NSString stringWithFormat:@"¥%.2f",self.totalPrice];
//        [self.shoppingView.countBtn setTitle:[NSString stringWithFormat:@"结算 (%zd)",self.totalCount] forState:UIControlStateNormal];
//    }
//     [self.resultTab reloadData];
//}
//
//- (void)BATOTCProductViewReduceActionDelegateWithModel:(OTCSearchData *)model {
//
//    self.totalCount = 0;
//    self.totalPrice = 0.0;
//
//    NSMutableArray *data =  [NSKeyedUnarchiver unarchiveObjectWithFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DrugModel.data"]];
//
//    NSMutableArray *tempData = [NSMutableArray array];
//    for (OTCSearchData *data in self.model.Data) {
//        if (data.drugCount >0) {
//            [tempData addObject:data];
//        }
//    }
//    for (int i=0; i<tempData.count; i++) {
//        OTCSearchData *mainData = tempData[i];
//        BOOL isTheSame = NO;
//        for (int j=0; j<data.count; j++) {
//            OTCSearchData *changeData = data[j];
//            if ([mainData.ID isEqualToString:changeData.ID]) {
//                 changeData.drugCount = mainData.drugCount;
//                isTheSame = YES;
//                break;
//            }
//
//        }
//        if (!isTheSame) {
//            [data addObject:mainData];
//        }
//    }
//
//    for (OTCSearchData *checkData in data) {
//        if ([checkData.ID isEqualToString:model.ID]) {
//            checkData.drugCount = model.drugCount;
//            if (model.drugCount == 0) {
//                checkData.isSelect = NO;
//            }
//
//        }
//    }
//
//    [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//
//        OTCSearchData *tempdata = obj;
//        if (tempdata.drugCount == 0) {
//            [data removeObjectAtIndex:idx];
//        }
//    }];
//
//    if (data.count>4) {
//        self.height = 4*90 +34;
//    }else {
//        self.height = data.count * 90 + 34;
//    }
//    self.shoppingCar.frame = CGRectMake(0, SCREEN_HEIGHT- 50 -self.height-64, SCREEN_WIDTH, self.height);
//    if (data.count == 0) {
//
//        if (self.isOpen) {
//            [self BATShoppingTrolleyViewShoppingCarAction];
//        }
//
//    }
//
//    NSString *file = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DrugModel.data"];
//    [NSKeyedArchiver archiveRootObject:data toFile:file];
//
//    for (OTCSearchData *checkData in self.model.Data) {
//        if ([checkData.ID isEqualToString:model.ID]) {
//            checkData.drugCount = model.drugCount;
//        }
//    }
//
//
//    for (OTCSearchData *mainData in data) {
//        if (mainData.isSelect) {
//            self.totalCount += mainData.drugCount;
//            if (mainData.drugCount >0) {
//                self.totalPrice += mainData.drugCount * [mainData.Price floatValue];
//            }
//        }
//    }
//
//
//    if(self.totalCount <=0){
//
//        self.totalCount = 0;
//        [self.shoppingView.countBtn setTitle:@"结算" forState:UIControlStateNormal];
//        self.shoppingView.priceLb.text = @"¥0.00";
//    }else {
//        self.shoppingView.priceLb.text = [NSString stringWithFormat:@"¥%.2f",self.totalPrice];
//        [self.shoppingView.countBtn setTitle:[NSString stringWithFormat:@"结算 (%zd)",self.totalCount] forState:UIControlStateNormal];
//    }
//     [self.resultTab reloadData];
//}
//
//#pragma mark - Lazy Load
//- (BATOTCProductView *)shoppingCar {
//
//    if (!_shoppingCar) {
//        _shoppingCar = [[BATOTCProductView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-50, SCREEN_WIDTH, 50)];
//        _shoppingCar.delegate = self;
//    }
//    return _shoppingCar;
//
//}
//
//- (UITableView *)resultTab {
//
//    if (!_resultTab) {
//        _resultTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-50 - 64) style:UITableViewStylePlain];
//        _resultTab.delegate = self;
//        _resultTab.dataSource = self;
//        [_resultTab setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//        [_resultTab registerNib:[UINib nibWithNibName:@"BATOTCDrugCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"BATOTCDrugCellTableViewCell"];
//        [_resultTab registerNib:[UINib nibWithNibName:@"BATResultCell" bundle:nil] forCellReuseIdentifier:@"BATResultCell"];
//    }
//
//    return _resultTab;
//}
//
//
@end

