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
static CGFloat const  CELLHEIGHT        = 200;
static int  const WELCOMEHEADERHEIGHT   = 100;
static int  const SECTIONHEADERHEIGHT   = 40;
static int  const ButtonHeight          = 30;
static int  const ButtonWeight          = 100;

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic, strong) UITableView   *tableView;

@property (nonatomic, strong) UIScrollView  *bottomScrollView;

@property (nonatomic, strong) UIView        *homeHeaderView;
@property (nonatomic, strong) UILabel       *welcomeView;

@property (nonatomic, assign) CGFloat       historyY;

@end

@implementation HomeViewController

#pragma mark -- Lazy Load

- (UITableView *)tableView {
    if (!_tableView) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (WELCOMEHEADERHEIGHT + SECTIONHEADERHEIGHT)*kMainScaleMiunes, kMainWidth, kMainHeight - kTabbarHeight - (SECTIONHEADERHEIGHT+WELCOMEHEADERHEIGHT)*kMainScaleMiunes) style:(UITableViewStylePlain)];
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView registerClass:[HomeCell class] forCellReuseIdentifier:HOMECELLREUSEID];
        self.tableView.tableFooterView = [[UIView alloc] initWithFrame:(CGRectZero)];
    }
    return _tableView;
}

- (UIView *)homeHeaderView {
    
    if (!_homeHeaderView) {
        _homeHeaderView = [[UIView alloc] initWithFrame:(CGRectMake(0, WELCOMEHEADERHEIGHT*kMainScaleMiunes, kMainWidth, SECTIONHEADERHEIGHT*kMainScaleMiunes))];
        _homeHeaderView.backgroundColor = KColor_White;
        
    }
    return _homeHeaderView;
}

- (UILabel *)welcomeView {
    
    if (!_welcomeView) {
        _welcomeView = [[UILabel alloc] init];
        _welcomeView.frame = CGRectMake(0, 0, kMainWidth, WELCOMEHEADERHEIGHT*kMainScaleMiunes);
        [_welcomeView setBackgroundColor:KColor_Yellow];
        [_welcomeView setFont:[UIFont systemFontOfSize:22*kMainScaleMiunes]];
        [_welcomeView setLineBreakMode:(NSLineBreakByWordWrapping)];
        [_welcomeView setNumberOfLines:2];
        NSString *currentTime = [Heler getCurrentTimeHMS];
        
        NSArray *timeArr = [currentTime componentsSeparatedByString:@"-"];
        
        for (NSString *str in timeArr) {
            NSLog(@"%@",str);
        }
        NSInteger hour = [timeArr[0] integerValue];
        if (3 <= hour && 12 >= hour) {
            [_welcomeView setText:@"上午好🍵"];
        } else if (12 < hour && 18 >= hour){
            [_welcomeView setText:@"下午好🍵"];
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
    [self.view addSubview:self.homeHeaderView];

    UIButton *leftButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    leftButton.frame = CGRectMake(15, (SECTIONHEADERHEIGHT - ButtonHeight)*kMainScaleMiunes /2, ButtonWeight*kMainScaleMiunes, ButtonHeight*kMainScaleMiunes);
    leftButton.backgroundColor = KColor_Gray;
    [leftButton setTitle:@"登录" forState:(UIControlStateNormal)];
    [leftButton setTitleColor:KColor_Main forState:(UIControlStateNormal)];
    [leftButton addTarget:self action:@selector(loginAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [_homeHeaderView addSubview:leftButton];

    UIButton *rightButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    rightButton.frame = CGRectMake(ButtonWeight*kMainScaleMiunes + 30, (SECTIONHEADERHEIGHT - ButtonHeight)*kMainScaleMiunes /2, ButtonWeight*kMainScaleMiunes, ButtonHeight*kMainScaleMiunes);
    rightButton.backgroundColor = KColor_Gray;
    [rightButton setTitle:@"星消息" forState:(UIControlStateNormal)];
    [rightButton setTitleColor:KColor_Main forState:(UIControlStateNormal)];
    [rightButton addTarget:self action:@selector(rightMessageAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [_homeHeaderView addSubview:rightButton];
    
    [self.view addSubview:self.tableView];

    
    
    
}





#pragma mark -- getData

- (void)HomeGetData {
    
    [HttpManager postAsynRequestWithUrl:KURLIndex_banner Parms:nil Success:^(NSDictionary *resultObject) {
        
    } Failure:^(NSError *requestErr) {
        
    }];
    
}

#pragma mark -- ScrollView delegate

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    self.historyY = scrollView.contentOffset.y;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat y = scrollView.contentOffset.y;
    if (self.tableView == scrollView) {
        
        CGFloat tableViewOrgionY = CGRectGetMinY(self.tableView.frame);

        
//        if (self.historyY < y) {
//            NSLog(@"down");
            if (SECTIONHEADERHEIGHT*kMainScaleMiunes < tableViewOrgionY && (SECTIONHEADERHEIGHT+WELCOMEHEADERHEIGHT)*kMainScaleMiunes >= tableViewOrgionY ){//仅在header出现在上部
                
                if (WELCOMEHEADERHEIGHT*kMainScaleMiunes >= y && y >0) {
                    
                    self.tableView.frame = CGRectMake(0, (WELCOMEHEADERHEIGHT + SECTIONHEADERHEIGHT)*kMainScaleMiunes - y, kMainWidth, kMainHeight - kTabbarHeight - (SECTIONHEADERHEIGHT + WELCOMEHEADERHEIGHT)*kMainScaleMiunes + y);
                    self.tableView.contentOffset = CGPointMake(0, y);
                    
                    self.welcomeView.frame = CGRectMake(0, -y, kMainWidth, WELCOMEHEADERHEIGHT*kMainScaleMiunes);
                    
                    if ( y > 0 ) {
                        self.welcomeView.alpha = 1 - y / WELCOMEHEADERHEIGHT;
                    }
                    
                    self.homeHeaderView.frame = CGRectMake(0, WELCOMEHEADERHEIGHT*kMainScaleMiunes-y, kMainWidth, SECTIONHEADERHEIGHT*kMainScaleMiunes);
                    
                }
            }
//        } else {
//            NSLog(@"up");
//        }
        
        

    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    CGFloat y = scrollView.contentOffset.y;
    
//    NSLog(@"EndDragging_y:%.2f",y);
    
    if (scrollView == self.tableView) {
        
        CGFloat tableViewOrgionY = CGRectGetMinY(self.tableView.frame);
//        NSLog(@"tableViewOrgionY:%.2f\nSection_H%.2f",tableViewOrgionY,SECTIONHEADERHEIGHT*kMainScaleMiunes);
        
        if (tableViewOrgionY >= SECTIONHEADERHEIGHT*kMainScaleMiunes && tableViewOrgionY <= (SECTIONHEADERHEIGHT + WELCOMEHEADERHEIGHT)*kMainScaleMiunes) {//此时header在上部
            
            
            if (kMainScaleMiunes*WELCOMEHEADERHEIGHT/2 >= y && y > 0) {//--UP 不超过一半则复原保留header
                
                [UIView animateWithDuration:.2f animations:^{
                    self.tableView.frame = CGRectMake(0, (WELCOMEHEADERHEIGHT + SECTIONHEADERHEIGHT)*kMainScaleMiunes, kMainWidth, kMainHeight - kTabbarHeight - (SECTIONHEADERHEIGHT + WELCOMEHEADERHEIGHT)*kMainScaleMiunes);
                    self.tableView.contentOffset = CGPointMake(0, 0);
                    
                    self.welcomeView.frame = CGRectMake(0, 0, kMainWidth, WELCOMEHEADERHEIGHT*kMainScaleMiunes);
                    self.welcomeView.alpha = 1 ;
                    
                    self.homeHeaderView.frame = CGRectMake(0, WELCOMEHEADERHEIGHT*kMainScaleMiunes, kMainWidth, SECTIONHEADERHEIGHT*kMainScaleMiunes);
                }];

                
            } else if (WELCOMEHEADERHEIGHT*kMainScaleMiunes >= y && y > WELCOMEHEADERHEIGHT*kMainScaleMiunes/2) {//--UP 超过一半则隐藏welcomeHeader
                
                [UIView animateWithDuration:.2f animations:^{
                    self.tableView.frame = CGRectMake(0,  SECTIONHEADERHEIGHT*kMainScaleMiunes, kMainWidth, kMainHeight - kTabbarHeight - (SECTIONHEADERHEIGHT)*kMainScaleMiunes);
                    self.tableView.contentOffset = CGPointMake(0, WELCOMEHEADERHEIGHT);
                    
                    self.welcomeView.frame = CGRectMake(0, -WELCOMEHEADERHEIGHT*kMainScaleMiunes, kMainWidth, WELCOMEHEADERHEIGHT*kMainScaleMiunes);
                    self.welcomeView.alpha = 0.2f;
                    
                    self.homeHeaderView.frame = CGRectMake(0, 0, kMainWidth, SECTIONHEADERHEIGHT*kMainScaleMiunes);
                }];

            }
        }
    }

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGFloat tableViewOrgionY = CGRectGetMinY(self.tableView.frame);
    NSLog(@"tableViewOrgionY:%.2f\nSection_H%.2f",tableViewOrgionY,SECTIONHEADERHEIGHT*kMainScaleMiunes);
    
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

- (void)loginAction:(UIButton *) sender {
    
}

- (void)rightMessageAction: (UIButton *) sender {
    
    
}
@end
