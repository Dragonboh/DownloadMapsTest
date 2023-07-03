//
//  DownloadMapsViewModel.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//

#import <Foundation/Foundation.h>
#import "DownloadMapsViewModel.h"
#import "MapsDownloadService.h"

@interface DownloadMapsViewModel ()

@property (strong, nonatomic) XMLParser *parser;
@property (strong, nonatomic) MapsDownloadService *downloadService;
@property (strong, nonatomic) MapsFileManager *fileManager;
@property (strong, nonatomic) Region *region;

@end

@implementation DownloadMapsViewModel

- (id)initWithParser:(XMLParser *)parser
         fileManager:(MapsFileManager *)fileManager {
    self = [super self];
    if (self) {
        self.parser = parser;
        self.fileManager = fileManager;
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
    
    self.displayModel = [NSDictionary dictionaryWithObjectsAndKeys:cellModels, @"EUROPE", nil];
}

- (void)didSelectRow:(NSInteger)row {
    Region *region = [self.region.regions objectAtIndex:row];
    [self.coordinator goToRegion:region];
}

@end
