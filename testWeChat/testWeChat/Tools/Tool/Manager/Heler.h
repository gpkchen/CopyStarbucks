//
//  Heler.h
//  testWeChat
//
//  Created by Tesla_Chen on 2017/11/3.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Heler : NSObject



/**
 获取当前时间 YYYY-MM-dd 年月日

 @return 返回字符串
 */
+ (NSString *)getCurrentTimeYMD;



/**
 获取当前时间 HH—MM-SS  时分秒

 @return 返回字符串
 */
+ (NSString *)getCurrentTimeHMS;

@end
