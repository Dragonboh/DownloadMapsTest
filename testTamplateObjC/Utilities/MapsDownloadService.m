//
//  MapsDownloadService.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//


#import "MapsDownloadService.h"

@interface MapsDownloadService ()

@property NSURLSession *session;
@property (nonatomic, strong)NSOperationQueue *queue;
@property dispatch_semaphore_t semaphore;

@property NSDictionary<NSUUID *, NSOperation *> *dic;

@property (nonatomic, strong) void (^updateProgress)(float progress);

@end


//@interface  AsyncOperation: NSOperation <NSURLSessionDownloadDelegate>

@implementation MapsDownloadService

//- (void)dowbloadMapsWithURLString:(NSString *)stringURL {
//    
//    NSURL *url = [NSURL URLWithString:stringURL];
//    self.session = [NSURLSession sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration];
//    //sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration delegate:self delegateQueue:nil];
//    NSMutableArray *arr = [NSMutableArray array];
//    [arr removeObjectAtIndex:0];
//    NSOperation *temp = [NSBlockOperation blockOperationWithBlock: ^{
//        NSURLSessionDownloadTask *downloadTask = [self.session downloadTaskWithURL:url];
//        downloadTask.delegate = self;
////        [dateTask resume];
//    }];
//}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    dispatch_semaphore_signal(self.semaphore);
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    float progress = (float)totalBytesWritten / (float)totalBytesExpectedToWrite;
//    NSLog(@"%f", progress);
    self.updateProgress(progress);
//
//    [NSNotificationCenter post]
    // Update progress hud 
}

- (void)dowbloadMapsWithURLString:(NSString *)stringURL updateProgress:(void (^__strong)(float))updateProgress {
    NSURL *url = [NSURL URLWithString:stringURL];
    self.queue = [[NSOperationQueue alloc] init];
    self.updateProgress = updateProgress;
    [self.queue addOperationWithBlock:^{
        // Create a semaphore
        self.semaphore = dispatch_semaphore_create(0);

        // Create a URL session
        NSURLSession *session = [NSURLSession sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration delegate:self delegateQueue: self.queue];

        // Create a download task
        NSLog(@"%@", url);
        NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url];

        // Start the download task
        [downloadTask resume];

        // Wait for the semaphore to be signaled
        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    }];
}

@end
