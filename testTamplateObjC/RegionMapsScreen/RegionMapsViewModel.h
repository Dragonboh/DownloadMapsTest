//
//  RegionTableViewModel.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//

#ifndef RegionMapsViewModel_h
#define RegionMapsViewModel_h

#import "Region.h"
#import "DownloadMapCellModel.h"
#import "MapsFileManager.h"
#import "MapsDownloadService.h"

@interface RegionMapsViewModel : NSObject

@property (nonatomic, copy) NSArray<DownloadMapCellModel *> *regions;
@property (nonatomic, copy) NSString *title;

- (id)initWithRegion:(Region *)region
         fileManager:(MapsFileManager *)fileManager
     downloadManager:(MapsDownloadService *)downloadManager;

- (void)fetchData;
- (void)downloadButtonPressed:(NSIndexPath *)indexPath;

@end
#endif /* RegionMapsViewModel_h */
