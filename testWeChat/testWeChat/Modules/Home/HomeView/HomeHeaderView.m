//
//  HomeHeaderView.m
//  testWeChat
//
//  Created by Tesla_Chen on 2017/11/1.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "HomeHeaderView.h"
#import "HomeHeaderButton.h"

@interface HomeHeaderView ()

{
    HomeHeaderButton    *leftButton;
    HomeHeaderButton    *rightButton;
}


@end


@implementation HomeHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupHomeHeaderView];
    }
    return self;
}

#pragma mark -- Private instance Method

- (void)setupHomeHeaderView {
    
    leftButton = [HomeHeaderButton buttonWithType:(UIButtonTypeCustom)];
    [leftButton setLeftImage:[UIImage imageNamed:@"SatrGiftCardSelected"]];
    [leftButton setTitle:@"登录"];
    [self addSubview:leftButton];
    
    
    
    
    
}



@end
