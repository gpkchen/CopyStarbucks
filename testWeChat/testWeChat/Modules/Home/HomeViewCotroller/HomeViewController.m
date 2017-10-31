//
//  HomeViewController.m
//  testWeChat
//
//  Created by Tesla_Chen on 2017/10/31.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"



static NSString *HOMECELLREUSEID = @"HOMECELLREUSEID";


@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) UITableView * tableView;

@end

@implementation HomeViewController

#pragma mark -- Controller LiftCircle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
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
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[HomeCell class] forCellReuseIdentifier:HOMECELLREUSEID];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:(CGRectZero)];
    [self.view addSubview:self.tableView];
    
    
}


#pragma mark -- TableView Delegate And Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeCell *homeCell = [tableView dequeueReusableCellWithIdentifier:HOMECELLREUSEID forIndexPath:indexPath];
    [homeCell setBackgroundColor:[UIColor redColor]];
    
    return homeCell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld",indexPath.row);
}




@end

