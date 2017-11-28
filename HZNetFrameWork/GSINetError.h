//
//  GSINetError.h
//  HZNetFrameWork
//
//  Created by 吴华林 on 2017/11/28.
//  Copyright © 2017年 吴华林. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GSINetError <NSObject>
@optional
@property(nonatomic,assign,readonly)NSUInteger code;
@property(nonatomic,copy,readonly)NSString *message;
- (instancetype)initWithError:(NSError *)error responseObject:(id)responseObject;
@end
