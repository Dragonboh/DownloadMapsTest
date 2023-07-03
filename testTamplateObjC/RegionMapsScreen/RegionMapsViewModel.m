//
//  RegionTableViewModel.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//

#import <Foundation/Foundation.h>
#import "RegionMapsViewModel.h"

@interface RegionMapsViewModel ()

@property (strong, nonatomic) Region *region;
@property (strong, nonatomic) MapsFileManager *fileManager;

@end

@implementation RegionMapsViewModel

- (id)initWithRegion:(Region *)region
         fileManager:(MapsFileManager *)fileManager {
    self = [super init];
    if (self) {
        self.region = region;
        self.title = region.name;
        self.fileManager = fileManager;
    }
    
    return self;
}

- (void)fetchData {
    NSMutableArray *cellModels = [NSMutableArray array];
    
    for (Region *reg in self.region.regions) {
        BOOL hasDownloadedMap = [self.fileManager hasDownloadedMapWithName:reg.name];
        BOOL hasRegions = reg.regions.count > 0 ? true : false;
        DownloadMapCellModel *cellModel = [[DownloadMapCellModel alloc] initWithName: reg.name
                                                                          hasRegions: hasRegions
                                                                    hasDownloadedMap: hasDownloadedMap];
        [cellModels addObject:cellModel];
    }
    
    self.regions = cellModels;
}

@end
