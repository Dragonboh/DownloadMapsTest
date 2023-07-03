//
//  FileManager.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//

#ifndef FileManager_h
#define FileManager_h

#import <Foundation/Foundation.h>

@interface MapsFileManager : NSObject

- (BOOL)hasDownloadedMapWithName:(NSString *)mapName;

@end

#endif /* FileManager_h */
