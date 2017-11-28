//
//  GSINetRequest.h
//  HZNetFrameWork
//
//  Created by 吴华林 on 2017/11/28.
//  Copyright © 2017年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma mark 请求方法
#define GET @"GET"
#define POST @"POST"
#define HEAD @"HEAD"
#define PUT  @"PUT"
#define PATCH @"PATCH"
#define DELETE @"DELETE"
#pragma mark 数据格式
typedef NS_ENUM(NSUInteger,GSNetDataSerializer) {
    GSdDefault,//默认数据格式
    GSNetXMl,//数据是xml 序列化的
    GSNetJSON//数据是JSON序列化的
};
@protocol GSINetRequest <NSObject>
@optional
/**
 基本的URL（一般为服务器地址）
 */
@property(nonatomic,copy,readonly)NSString *baseURL;

/**
 业务对应的path
 */
@property(nonatomic,copy,readonly)NSString *path;

/**
 请求的类型（GET,POST,HEAD,PUT,PATCH,DELETE）
 */
@property(nonatomic,copy,readonly)NSString *method;

/**
 需要携带的头部
 */
@property(nonatomic,copy,readonly)NSDictionary *headers;

/**
 需要携带的参数
 */
@property(nonatomic,copy,readonly)NSDictionary *parameter;
/**
 缓存的key
 */
@property(nonatomic,copy,readonly)NSString *cacheKey;

/**
 请求的唯一标示
 */
@property(nonatomic,copy,readonly)NSString *identifier;

/**
 是否刷新请求（如果这个设置为YES，就会取消当前网络请求，如果设置为NO就会忽略新的网络请求的，这里的网络请求，只对相同identifier 有效）
 */
@property(nonatomic,assign,readonly)BOOL refreshRequest;

/**
 是否缓存当前成功的结果
 */
@property(nonatomic,assign,readonly)BOOL cache;

/**
 请求参数序列化
 */
@property(nonatomic,assign,readonly)GSNetDataSerializer requestParameterSerializer;

/**
 返回的数据的类型
 */
@property(nonatomic,assign,readonly)GSNetDataSerializer responseDataSerializer;
/**
 当前请求超时时间
 */
@property(nonatomic,assign,readonly)NSUInteger timeoutDuration;

/**
 当请求失败尝试的次数，（如果设置了这个值那么当失败时候不会马上返回成功或者失败的结果，知道尝试的次数都结束或者有一次成功）
 */
@property(nonatomic,assign,readonly)NSUInteger retryTimes;

- (instancetype)initWithParameter:(NSDictionary *)parameter identifier:(NSString *)identifier;
@end
