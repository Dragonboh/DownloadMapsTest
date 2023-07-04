//
//  DownloadMapsViewModel.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//

#import <Foundation/Foundation.h>
#import "DownloadMapsViewModel.h"

@interface DownloadMapsViewModel ()

@property (strong, nonatomic) XMLParser *parser;
@property (strong, nonatomic) MapsDownloadService *downloadManager;
@property (strong, nonatomic) MapsFileManager *fileManager;
@property (strong, nonatomic) Region *region;

@end

@implementation DownloadMapsViewModel

- (instancetype)initWithParser:(XMLParser *)parser
                   fileManager:(MapsFileManager *)fileManager
               downloadManager:(MapsDownloadService *)downloadmanager {
    self = [super self];
    if (self) {
        self.parser = parser;
        self.fileManager = fileManager;
        self.downloadManager = downloadmanager;
        self.displayModel = [NSDictionary dictionary];
    }
    return self;
}

- (void)fetchData {
    // I took regions inside Europe for better visualisation on TableView
    self.region = [self.parser parseXML].firstObject;
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
    self.displayModel = [NSDictionary dictionaryWithObjectsAndKeys:cellModels, @"EUROPE", nil];
}

- (void)didSelectRow:(NSInteger)row {
    Region *region = [self.region.regions objectAtIndex:row];
    if (region.regions.count > 0) {
        [self.coordinator goToRegion:region];
    }
}

- (void)downloadButtonPressed:(NSIndexPath *)indexPath {

    NSString *stringURL = @"https://download.osmand.net/download.php?standard=yes&file=France_corse_europe_2.obf.zip";
    NSArray<DownloadMapCellModel *> *cellViewNodels = [self.displayModel objectForKey:@"EUROPE"];
    DownloadMapCellModel *cellToUpdate = [cellViewNodels objectAtIndex:indexPath.row];
    
    [self.downloadManager dowbloadMapsWithURLString:stringURL updateProgress:^(float progress) {
        NSLog(@"%f", progress);
        if ((progress - cellToUpdate.progress) > 0.2 || progress == 1) {
            cellToUpdate.progress = progress;
            dispatch_async(dispatch_get_main_queue(), ^{
                self.updateUI(indexPath);
            });
        }
    }]; 
}

@end
