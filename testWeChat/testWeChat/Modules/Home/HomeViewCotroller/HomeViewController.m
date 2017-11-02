//
//  HomeViewController.m
//  testWeChat
//
//  Created by Tesla_Chen on 2017/10/31.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "HomeViewController.h"

#import "HomeCell.h"
#import "HomeHeaderView.h"

static NSString *HOMECELLREUSEID = @"HOMECELLREUSEID";

static CGFloat const  CELLHEIGHT = 200;
static int  const HEADERHEIGHT   = 120;
static int  const SECTIONHEADERHEIGHT = 80;

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) UIScrollView  *bottomScrollView;

@property (nonatomic, strong) UITableViewHeaderFooterView *headerView;

@end

@implementation HomeViewController


#pragma mark -- Controller LiftCircle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = KColor_White;
    
    [self setHomeMainView];
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

#pragma mark -- SetMainView

- (void)setHomeMainView {
    
    
    self.bottomScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kMainWidth, kMainHeight - kTabbarHeight)];
    self.bottomScrollView.delegate = self;
    self.bottomScrollView.backgroundColor = KColor_White;
    self.bottomScrollView.contentSize = CGSizeMake(kMainWidth, kMainHeight);
    self.bottomScrollView.bounces = NO;
    self.bottomScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.bottomScrollView];

    UIView *headerView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kMainWidth, HEADERHEIGHT*kMainScaleMiunes))];
    headerView.backgroundColor = KColor_Gray;
    [self.bottomScrollView addSubview:headerView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, HEADERHEIGHT*kMainScaleMiunes, kMainWidth, kMainHeight - kTabbarHeight) style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[HomeCell class] forCellReuseIdentifier:HOMECELLREUSEID];
    
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:(CGRectZero)];
    [self.bottomScrollView addSubview:self.tableView];

}


#pragma mark -- getData

- (void)HomeGetData {
    
    [HttpManager postAsynRequestWithUrl:KURLIndex_banner Parms:nil Success:^(NSDictionary *resultObject) {
        
    } Failure:^(NSError *requestErr) {
        
    }];
    
}

#pragma mark -- TableView Delegate And Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeCell *homeCell = [tableView dequeueReusableCellWithIdentifier:HOMECELLREUSEID forIndexPath:indexPath];
    [homeCell setBackgroundColor:KColor_Gray_66];
    
    return homeCell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CELLHEIGHT*kMainScaleMiunes;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld",indexPath.row);
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *sectionHeaderView = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, kMainWidth, 80*kMainScaleMiunes))];
//    sectionHeaderView.backgroundColor = KColor_White;
//    return sectionHeaderView;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return SECTIONHEADERHEIGHT * kMainScaleMiunes;
//}

@end

