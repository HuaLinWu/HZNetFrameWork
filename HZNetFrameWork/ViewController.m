//
//  ViewController.m
//  HZNetFrameWork
//
//  Created by 吴华林 on 2017/8/25.
//  Copyright © 2017年 吴华林. All rights reserved.
//

#import "ViewController.h"
#import "HZHTTPRequestManager.h"
@interface ViewController ()
@property(nonatomic,strong)UISearchController *searchController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
   self.searchController.delegate = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.hidesNavigationBarDuringPresentation = YES;
    [self.view addSubview:_searchController.searchBar];
   self.definesPresentationContext = YES;
}

- (IBAction)sendRequest:(UIButton *)sender {
    
   HZHTTPRequestManager *requestManager = [HZHTTPRequestManager shareManager];
    NSMutableArray *requestModels = [[NSMutableArray alloc] init];
    for(int i =0;i <100;i++) {
        
        HZHTTPRequestModel *requestModel = [HZHTTPRequestModel GET:@"https://api.gsfin.com.cn/api/v1/rcs/meta/bots/@hualin.wu:gsfin.com.cn" parameters:@{@"access_token":@"MDAxYWxvY2F0aW9uIGdzZmluLmNvbS5jbgowMDEzaWRlbnRpZmllciBrZXkKMDAxMGNpZCBnZW4gPSAxCjAwMmFjaWQgdXNlcl9pZCA9IEBodWFsaW4ud3U6Z3NmaW4uY29tLmNuCjAwMTZjaWQgdHlwZSA9IGFjY2VzcwowMDIxY2lkIG5vbmNlID0gfn5EZiZxUUF6Yk4wdytjVwowMDJmc2lnbmF0dXJlIIB1FAUXfQf9hJDNK84rUtwpnvmZTDWaH3sV0sSJo4wPCg"} taskIdentifier:i];
        [requestModels addObject:requestModel];
    }
    [requestManager sendGroupRequestWithModels:requestModels complate:^(NSArray<HZHTTPResponseModel *> *responseModels) {
        for(HZHTTPResponseModel *responseModel in responseModels) {
         NSLog(@"----%li-->%@",(long)responseModel.taskIdentifier,responseModel.object);
        }
        
    }];
    
}
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
