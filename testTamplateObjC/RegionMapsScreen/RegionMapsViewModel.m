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
@property (strong, nonatomic) MapsDownloadService *downloadManager;

@end

@implementation RegionMapsViewModel

- (id)initWithRegion:(Region *)region
         fileManager:(MapsFileManager *)fileManager
     downloadManager:(MapsDownloadService *)downloadManager {
    
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

- (void)downloadButtonPressed:(NSIndexPath *)indexPath {

    NSString *stringURL = @"https://download.osmand.net/download.php?standard=yes&file=France_corse_europe_2.obf.zip";
//    NSArray<DownloadMapCellModel *> *cellViewNodels = [self.displayModel objectForKey:@"EUROPE"];
//    DownloadMapCellModel *cellToUpdate = [cellViewNodels objectAtIndex:indexPath.row];
//    
//    [self.downloadManager dowbloadMapsWithURLString:stringURL
//                                          indexPath:indexPath
//                                     updateProgress:^(float progress) {
//        NSLog(@"%f", progress);
//        if ((progress - cellToUpdate.progress) > 0.2 || progress == 1) {
//            cellToUpdate.progress = progress;
//            dispatch_async(dispatch_get_main_queue(), ^{
//                self.updateUI(indexPath);
//            });
//        }
//    }];
}

@end
