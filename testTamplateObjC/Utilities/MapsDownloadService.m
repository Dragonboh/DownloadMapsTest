//
//  MapsDownloadService.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//


#import "MapsDownloadService.h"

@interface MapsDownloadService ()
@property NSURLSession *session;
@end

@implementation MapsDownloadService

- (void)dowbloadMapsWithURL:(NSURL *)url {
    self.session = [NSURLSession sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration delegate:self delegateQueue:nil];
    NSURLSessionDownloadTask *downloadTask = [self.session downloadTaskWithURL:url];
    [downloadTask resume];
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
//    float progress = totalBytesWritten / totalBytesExpectedToWrite;
    
    // Update progress hud 
}

@end
