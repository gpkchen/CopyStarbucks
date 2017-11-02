//
//  ScaleButton.m
//  testWeChat
//
//  Created by Tesla_Chen on 2017/11/2.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "ScaleButton.h"
#import <POP/POP.h>

@implementation ScaleButton

+ (instancetype)button {
    return [self buttonWithType:(UIButtonTypeCustom)];
}

//根据内容修改weight，搭配设置type为Coustom

- (CGSize)intrinsicContentSize
{
    CGSize s = [super intrinsicContentSize];
    
    return CGSizeMake(s.width + self.titleEdgeInsets.left + self.titleEdgeInsets.right,
                      s.height + self.titleEdgeInsets.top + self.titleEdgeInsets.bottom);
    
}


- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}



#pragma mark -- Animation

- (void)setup {
    
    [self addTarget:self action:@selector(scaleToSmall) forControlEvents:(UIControlEventTouchDown | UIControlEventTouchDragEnter)];
    [self addTarget:self action:@selector(scaleAnimation) forControlEvents:(UIControlEventTouchUpInside)];
    [self addTarget:self action:@selector(scaleToDefault) forControlEvents:(UIControlEventTouchDragExit)];
}


- (void)scaleToSmall {
    
    POPBasicAnimation *smallAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    smallAnimation.toValue = [NSValue valueWithCGSize:(CGSizeMake(0.94f, 0.94f))];
    [self.layer pop_addAnimation:smallAnimation forKey:@"layerScaleSmallAnimation"];
    
}

- (void)scaleAnimation {
    
    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    scaleAnimation.velocity = [NSValue valueWithCGSize:(CGSizeMake(3.0f, 3.0f))];
    scaleAnimation.toValue = [NSValue valueWithCGSize:(CGSizeMake(1.0f, 1.0f))];
    [self.layer pop_addAnimation:scaleAnimation forKey:@"layerScaleSpringAnimation"];
    
}

- (void)scaleToDefault {
    
    POPBasicAnimation *defaultAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    defaultAnimation.toValue = [NSValue valueWithCGSize:(CGSizeMake(1.0f, 1.0f))];
    [self.layer pop_addAnimation:defaultAnimation forKey:@"layerScaleDefaultAnimation"];
    
}


@end
