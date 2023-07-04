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
                   
- (void)dowbloadMapsWithURLString:(NSString *)stringURL
                        indexPath:(NSIndexPath *)indexPath
                   updateProgress:(void (^)(float progress))updateProgress;

- (instancetype)init;

@end

#endif /* MapsDownloadService_h */
