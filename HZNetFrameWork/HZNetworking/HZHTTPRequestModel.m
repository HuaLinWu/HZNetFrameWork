//
//  HZHTTPRequestModel.m
//  HZNetFrameWork
//
//  Created by 吴华林 on 2017/8/25.
//  Copyright © 2017年 吴华林. All rights reserved.
//

#import "HZHTTPRequestModel.h"
@interface HZHTTPRequestModel()
@property(nonatomic, copy) NSString *httpMethod;
@property(nonatomic, copy) NSString *urlString;
@property(nonatomic, assign) NSInteger taskIdentifier;
@property(nonatomic, copy) NSDictionary *bodyDataDict;
@property(nonatomic, copy) NSDictionary *parameters;
@end
@implementation HZHTTPRequestModel

+ (instancetype)GET:(NSString *)URLString
         parameters:(nullable NSDictionary *)parameters
     taskIdentifier:(NSInteger)taskIdentifier {
    
   HZHTTPRequestModel *instance = [[self alloc] initWithHttpMethod:@"GET" urlString:URLString parameters:parameters constructingBody:nil taskIdentifier:taskIdentifier];
   return instance;
}

+ (instancetype)HEAD:(NSString *)URLString
          parameters:(nullable NSDictionary *)parameters
      taskIdentifier:(NSInteger)taskIdentifier {
    
    HZHTTPRequestModel *instance = [[self alloc] initWithHttpMethod:@"HEAD" urlString:URLString parameters:parameters constructingBody:nil taskIdentifier:taskIdentifier];
    return instance;
}

+ (instancetype)POST:(NSString *)URLString
          parameters:(nullable NSDictionary *)parameters
    constructingBody:(nullable NSDictionary<NSString *, NSData *> *)bodyDataDict
      taskIdentifier:(NSInteger)taskIdentifier {
    
    HZHTTPRequestModel *instance = [[self alloc] initWithHttpMethod:@"POST" urlString:URLString parameters:parameters constructingBody:bodyDataDict taskIdentifier:taskIdentifier];
    return instance;
}

+ (instancetype)PUT:(NSString *)URLString
         parameters:(nullable NSDictionary *)parameters
     taskIdentifier:(NSInteger)taskIdentifier {
    
    HZHTTPRequestModel *instance = [[self alloc] initWithHttpMethod:@"PUT" urlString:URLString parameters:parameters constructingBody:nil taskIdentifier:taskIdentifier];
    return instance;
}
+ (instancetype)PATCH:(NSString *)URLString
           parameters:(nullable NSDictionary *)parameters
       taskIdentifier:(NSInteger)taskIdentifier {
    
    HZHTTPRequestModel *instance = [[self alloc] initWithHttpMethod:@"PATCH" urlString:URLString parameters:parameters constructingBody:nil taskIdentifier:taskIdentifier];
    return instance;
}
+ (instancetype)DELETE:(NSString *)URLString
            parameters:(nullable NSDictionary *)parameters
        taskIdentifier:(NSInteger)taskIdentifier {
    
    HZHTTPRequestModel *instance = [[self alloc] initWithHttpMethod:@"DELETE" urlString:URLString parameters:parameters constructingBody:nil taskIdentifier:taskIdentifier];
    return instance;
}
#pragma mark private_method
- (instancetype)initWithHttpMethod:(NSString *)httpMethod
                         urlString:(NSString *)urlString
                        parameters:(NSDictionary *)parameters
                  constructingBody:( NSDictionary *)bodyDataDict
                    taskIdentifier:(NSInteger)taskIdentifier {
    self = [self init];
    if(self) {
        _httpMethod = httpMethod;
        _urlString = urlString;
        _parameters = parameters;
        _bodyDataDict = bodyDataDict;
        _taskIdentifier = taskIdentifier;
    }
    return self;
}
@end
