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
#import "HomeHeaderButton.h"

static NSString *HOMECELLREUSEID = @"HOMECELLREUSEID";

static CGFloat const  CELLHEIGHT = 200;
static int  const HEADERHEIGHT   = 120;
static int  const SECTIONHEADERHEIGHT = 80;

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic, strong) UITableView   *tableView;

@property (nonatomic, strong) UIScrollView  *bottomScrollView;

@property (nonatomic, strong) UIView        *homeHeaderView;
@property (nonatomic, strong) UILabel       *welcomeView;

@end

@implementation HomeViewController

#pragma mark -- Lazy Load

- (UIView *)homeHeaderView {
    
    if (!_homeHeaderView) {
        _homeHeaderView = [[UIView alloc] init];
        _homeHeaderView.backgroundColor = KColor_White;
        
        UIButton *leftButton = [HomeHeaderButton buttonWithType:(UIButtonTypeCustom)];
        [leftButton setTitle:@"登录" forState:(UIControlStateNormal)];
        [leftButton addTarget:self action:@selector(loginAction) forControlEvents:(UIControlEventTouchUpInside)];
        [_homeHeaderView addSubview:leftButton];
        
        
    }
    return _homeHeaderView;
}

- (UILabel *)welcomeView {
    
    if (!_welcomeView) {
        _welcomeView = [[UILabel alloc] init];
        _welcomeView.frame = CGRectMake(0, 0, kMainWidth, HEADERHEIGHT);
        [_welcomeView setBackgroundColor:KColor_Yellow];
        [_welcomeView setFont:[UIFont systemFontOfSize:22*kMainScaleMiunes]];
        [_welcomeView setLineBreakMode:(NSLineBreakByWordWrapping)];
        [_welcomeView setNumberOfLines:2];
        NSString *currentTime = [Heler getCurrentTimeHMS];
        
        NSArray *timeArr = [currentTime componentsSeparatedByString:@"-"];
        
        for (NSString *str in timeArr) {
            NSLog(@"%@",str);
        }
        NSInteger hour = [timeArr[1] integerValue];
        if (3 <= hour && 12 >= hour) {
            [_welcomeView setText:@"上午好🍵"];
        } else {
            [_welcomeView setText:@"愿少年乘风破浪，他日勿忘化雨功！🍵"];
        }
        
    }
    return _welcomeView;
}

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
    
    [self.view addSubview:self.welcomeView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (HEADERHEIGHT + SECTIONHEADERHEIGHT)*kMainScaleMiunes, kMainWidth, kMainHeight - kTabbarHeight - (SECTIONHEADERHEIGHT+HEADERHEIGHT)*kMainScaleMiunes) style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[HomeCell class] forCellReuseIdentifier:HOMECELLREUSEID];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:(CGRectZero)];
    [self.view addSubview:self.tableView];

    [self getCurrentTime];
}


-(NSString*)getCurrentTime {
    
    NSDateFormatter*formatter = [[NSDateFormatter alloc]init];[formatter setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
    
    NSString *dateTime = [formatter stringFromDate:[NSDate date]];

    
    return dateTime;
    
}


#pragma mark -- getData

- (void)HomeGetData {
    
    [HttpManager postAsynRequestWithUrl:KURLIndex_banner Parms:nil Success:^(NSDictionary *resultObject) {
        
    } Failure:^(NSError *requestErr) {
        
    }];
    
}

#pragma mark -- ScrollView delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat y = scrollView.contentOffset.y;
    if (self.tableView == scrollView) {
        if (HEADERHEIGHT >= y && y > 0) {
            self.tableView.frame = CGRectMake(0, (HEADERHEIGHT + SECTIONHEADERHEIGHT)*kMainScaleMiunes - y, kMainWidth, kMainHeight - kTabbarHeight - (SECTIONHEADERHEIGHT+ HEADERHEIGHT)*kMainScaleMiunes + y);
            self.tableView.contentOffset = CGPointMake(0, y);
            
            self.welcomeView.frame = CGRectMake(0, -y, kMainWidth, HEADERHEIGHT);
            self.welcomeView.alpha = 1 - y / 100;
        } else {
            
        }

    }
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

#pragma mark -- Private Instance method

- (void)loginAction {
    
}

@end

