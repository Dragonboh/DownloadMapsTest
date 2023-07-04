//
//  DownloadMapCellModel.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//

#import "DownloadMapCellModel.h"

@implementation DownloadMapCellModel

- (id)initWithName: (NSString *)name
        hasRegions: (BOOL)hasRegions
  hasDownloadedMap: (BOOL)hasDownloadedMap {
    self = [super init];
    if (self) {
        self.name = name;
        self.hasRegions = hasRegions;
        self.hasDownloadedMap = hasDownloadedMap;
        self.progress = 0;
    }
    return self;
}

@end
