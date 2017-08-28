//
//  HZNetFrameWorkTests.m
//  HZNetFrameWorkTests
//
//  Created by 吴华林 on 2017/8/25.
//  Copyright © 2017年 吴华林. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HZHTTPResponseModel.h"
@interface HZNetFrameWorkTests : XCTestCase

@end

@implementation HZNetFrameWorkTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
- (void)testResonseModelExample {
    NSString *str = @"{\"status\": 0,\"data\": {\"default_bots\": [{\"isFriend\": true,\"roomId\": \"!twieHPsdrBcyPvLzzh:gsfin.com.cn\",\"displayName\": \"报销助手\",\"botId\": \"@expense-bot:gsfin.com.cn\",\"desc\": \"需要报销怎么办？不用负责的流程，直接找我报销助手吧，我可以很快的帮你完成报销\"}]}}";
    HZHTTPResponseModel *model = [[HZHTTPResponseModel alloc] initWithResponseObject:str error:nil];
    NSLog(@"---222-->%@",model.object);
}
@end
