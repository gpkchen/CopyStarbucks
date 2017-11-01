//
//  StarNetClient.m
//  testWeChat
//
//  Created by Tesla_Chen on 2017/11/1.
//  Copyright © 2017年 Telsa_Chen. All rights reserved.
//

#import "StarNetClient.h"

@implementation StarNetClient
+ (instancetype) sharedStatNetClient {
    
    static StarNetClient *statNetClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        statNetClient = [[StarNetClient alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        statNetClient.securityPolicy            = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        statNetClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/json", @"text/javascript", @"text/html", nil];


    });
    
    return statNetClient;
}


- (instancetype)initWithBaseURL:(NSURL *)_url
{
    self = [super initWithBaseURL:_url];
    if (self)
    {
        [self initialHttp:nil respone:nil];
    }
    return self;
}

- (void)initialHttp:(AFHTTPRequestSerializer*)request respone:(AFHTTPResponseSerializer*)respone
{
    AFHTTPRequestSerializer* request_form   = [AFHTTPRequestSerializer serializer];
    request_form.timeoutInterval            = 30;
    self.requestSerializer                  = request_form;
    
    AFJSONResponseSerializer* response_json = [AFJSONResponseSerializer serializer];
    self.responseSerializer                 = response_json;
}

@end
