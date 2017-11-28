//
//  GSNetError.m
//  HZNetFrameWork
//
//  Created by 吴华林 on 2017/11/28.
//  Copyright © 2017年 吴华林. All rights reserved.
//

#import "GSBaseNetError.h"
@interface GSBaseNetError()
@property(nonatomic,assign)NSUInteger code;
@property(nonatomic,copy)NSString *message;
@end
@implementation GSBaseNetError
- (instancetype)initWithError:(NSError *)error responseObject:(id)responseObject {
    self = [super init];
    if(self) {
        
    }
    return self;
}
@end
