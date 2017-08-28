//
//  HZHTTPRequestModel.h
//  HZNetFrameWork
//  请求Model
//  Created by 吴华林 on 2017/8/25.
//  Copyright © 2017年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZHTTPRequestModel : NSObject
@property(nonatomic, readonly, copy) NSString *httpMethod;
@property(nonatomic, readonly, copy) NSString *urlString;
@property(nonatomic, readonly, assign) NSInteger taskIdentifier;
@property(nonatomic, readonly, copy) NSDictionary<NSString *, NSData *> *bodyDataDict; ;
@property(nonatomic, readonly, copy) NSDictionary *parameters;

+ (instancetype)GET:(NSString *)URLString
         parameters:(nullable NSDictionary *)parameters
     taskIdentifier:(NSInteger)taskIdentifier;

+ (instancetype)HEAD:(NSString *)URLString
          parameters:(nullable NSDictionary *)parameters
      taskIdentifier:(NSInteger)taskIdentifier;

+ (instancetype)POST:(NSString *)URLString
                             parameters:(nullable NSDictionary *)parameters
                        constructingBody:(nullable NSDictionary<NSString *, NSData *> *)bodyDataDict
                         taskIdentifier:(NSInteger)taskIdentifier;

+ (instancetype)PUT:(NSString *)URLString
                            parameters:(nullable NSDictionary *)parameters
                        taskIdentifier:(NSInteger)taskIdentifier;
+ (instancetype)PATCH:(NSString *)URLString
                              parameters:(nullable NSDictionary *)parameters
                          taskIdentifier:(NSInteger)taskIdentifier;
+ (instancetype)DELETE:(NSString *)URLString
            parameters:(nullable NSDictionary *)parameters
        taskIdentifier:(NSInteger)taskIdentifier;
@end
