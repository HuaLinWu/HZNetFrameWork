//
//  GSNetRequest.m
//  HZNetFrameWork
//
//  Created by 吴华林 on 2017/11/28.
//  Copyright © 2017年 吴华林. All rights reserved.
//

#import "GSBaseNetRequest.h"
@interface GSBaseNetRequest()
@property(nonatomic,copy)NSString *baseURL;
@property(nonatomic,copy)NSString *path;
@property(nonatomic,copy)NSString *method;
@property(nonatomic,copy)NSDictionary *headers;
@property(nonatomic,copy)NSDictionary *parameter;
@property(nonatomic,copy)NSString *cacheKey;
@property(nonatomic,copy)NSString *identifier;
@property(nonatomic,assign)BOOL refreshRequest;
@property(nonatomic,assign)BOOL cache;
@property(nonatomic,assign)NSUInteger timeoutDuration;
@property(nonatomic,assign)NSUInteger retryTimes;
@end
@implementation GSBaseNetRequest

- (instancetype)initWithParameter:(NSDictionary *)parameter identifier:(NSString *)identifier {
    self = [super init];
    if(self) {
        
    }
    return self;
}
@end
