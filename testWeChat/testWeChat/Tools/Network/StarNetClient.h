//
//  StarNetClient.h
//  testWeChat
//
//  Created by Tesla_Chen on 2017/11/1.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface StarNetClient : AFHTTPSessionManager
+ (instancetype) sharedStatNetClient;
@end
