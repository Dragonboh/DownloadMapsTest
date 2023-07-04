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
@property NSMutableArray<void (^)(float progress)> *arr;

@end

@implementation MapsDownloadService

- (instancetype)init {
    self = [super init];
    if (self) {
        self.queue = [[NSOperationQueue alloc] init];
        self.queue.maxConcurrentOperationCount = 1;
        self.arr = [NSMutableArray array];
    }
    return self;
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    [self.arr removeObjectAtIndex:0];
    dispatch_semaphore_signal(self.semaphore);
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    float progress = (float)totalBytesWritten / (float)totalBytesExpectedToWrite;
    [self.arr objectAtIndex:0](progress);
}

- (void)dowbloadMapsWithURLString:(NSString *)stringURL
                        indexPath:(NSIndexPath *)indexPath
                   updateProgress:(void (^__strong)(float))updateProgress {
    NSURL *url = [NSURL URLWithString: stringURL];
    [self.arr addObject:updateProgress];
    
    [self.queue addOperationWithBlock:^{
        self.semaphore = dispatch_semaphore_create(0);
        NSURLSession *session = [NSURLSession sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration delegate:self delegateQueue: nil];
        NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url];
        [downloadTask resume];
        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    }];
}

@end
