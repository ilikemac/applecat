//
//  ViewController.m
//  gitTest
//
//  Created by 이지용 on 2016. 3. 29..
//  Copyright © 2016년 Pushdream. All rights reserved.
//

#import "ViewController.h"
#import <Reachability.h>
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    //11231231234234t1234e312123s123123123134t12313
    [super viewDidLoad];
    NSLog(@"test");
    NSLog(@"TEST2");
    [Reachability dealloc];
    

    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"http://example.com/download.zip"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);
    }];
    [downloadTask resume];
    
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // Do any additional setup after loading the view, typically from a nib.
    //GIT TEST
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
