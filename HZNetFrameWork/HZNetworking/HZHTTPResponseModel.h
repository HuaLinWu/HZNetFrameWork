//
//  HZHTTPResponseModel.h
//  HZNetFrameWork
//  响应Model
//  Created by 吴华林 on 2017/8/25.
//  Copyright © 2017年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HZHTTPResponseModel : NSObject

/**
 处理过后的数据类型，
 */
@property(nonatomic,readonly,strong)id object;

/**
 是否请求成功
 */
@property(nonatomic,readonly,assign)BOOL isSuccess;

/**
 需要给用户展示的信息
 */
@property(nonatomic,readonly,copy) NSString *message;

/**
 任务的唯一标示与HZHTTPRequestModel 的taskIdentifier 值一致的
 */
@property(nonatomic, readonly, assign) NSInteger taskIdentifier;

/**
 用网络请求返回的数据初始化

 @param responseObject 网络请求返回的数据
 @param error 网络请求返回的错误
 @return 返回一个HZHTTPResponseModel 对象
 */
- (instancetype)initWithResponseObject:(id)responseObject error:(NSError *)error taskIdentifier:(NSInteger)taskIdentifier;
@end
