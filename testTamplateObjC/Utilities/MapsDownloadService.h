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

- (void)dowbloadMapsWithURL:(NSURL *)url;

@end

#endif /* MapsDownloadService_h */
