//
//  DownloadMapCellModel.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//

#ifndef DownloadMapCellModel_h
#define DownloadMapCellModel_h

#import <Foundation/Foundation.h>

@interface DownloadMapCellModel : NSObject

@property BOOL hasDownloadedMap;
@property (copy, nonatomic) NSString *name;
@property BOOL hasRegions;

- (id)initWithName:(NSString *)name
        hasRegions:(BOOL)hasRegions
  hasDownloadedMap:(BOOL)hasDownloadedMap;

@end


#endif /* DownloadMapCellModel_h */
