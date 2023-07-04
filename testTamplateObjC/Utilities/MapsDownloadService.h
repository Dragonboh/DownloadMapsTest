//
//  MapsDownloadService.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//

#ifndef MapsDownloadService_h
#define MapsDownloadService_h
#import <Foundation/Foundation.h>

@interface MapsDownloadService : NSObject <NSURLSessionDownloadDelegate>
//- (void)dowbloadMapsWithURLString:(NSString *)stringURL;
                   
- (void)dowbloadMapsWithURLString:(NSString *)stringURL
                   updateProgress:(void (^)(float progress))updateProgress;
                       //completion:(void (^)(NSString *stringURL))completion;

@end

#endif /* MapsDownloadService_h */
