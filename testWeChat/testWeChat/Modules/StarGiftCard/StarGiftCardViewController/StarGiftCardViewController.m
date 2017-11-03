//
//  StarGiftCardViewController.m
//  testWeChat
//
//  Created by Tesla_Chen on 2017/10/31.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "StarGiftCardViewController.h"

@interface StarGiftCardViewController ()

@property (nonatomic, strong)ScaleButton *joinToClub;

@end

@implementation StarGiftCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];

}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self SetStarCardMainView];
    
}


#pragma mark -- SetMainView

- (void)SetStarCardMainView {
    
    self.joinToClub = [ScaleButton buttonWithType:(UIButtonTypeCustom)];
    [self.joinToClub setFrame:(CGRectMake(120, 100, 160, 30))];
    [self.joinToClub setBackgroundColor:KColor_Gray_66];
    [self.joinToClub setTitle:@"加入星享俱乐部" forState:(UIControlStateNormal)];
    [self.joinToClub addTarget:self action:@selector(joinToClubButtonAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.joinToClub];

    
}

#pragma mark -- Pravite instance Method

- (void)joinToClubButtonAction {
    NSLog(@"++++");
}


@end
