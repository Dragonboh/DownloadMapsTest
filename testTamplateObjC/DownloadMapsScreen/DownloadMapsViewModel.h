//
//  DownloadsMapsViewModel.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//

#ifndef DownloadsMapsViewModel_h
#define DownloadsMapsViewModel_h

#import "XMLParser.h"
#import "Region.h"
#import "DownloadMapCellModel.h"
#import "MapsFileManager.h"
#import "AppCoordinator.h"
#import "MapsDownloadService.h"

@interface DownloadMapsViewModel : NSObject

@property (strong, nonatomic) NSDictionary<NSString *, NSArray<DownloadMapCellModel *> *> *displayModel;
@property (weak, nonatomic) AppCoordinator *coordinator;
@property (nonatomic, strong) void (^updateUI)(NSIndexPath *indexPath);
@property (nonatomic, strong) NSMutableArray<DownloadMapCellModel *> *regions;

- (instancetype)initWithParser:(XMLParser *)parser
                   fileManager:(MapsFileManager *)fileManager
               downloadManager:(MapsDownloadService *)downloadmanager;

- (void)fetchData;
- (void)didSelectRow:(NSInteger)row;
- (void)downloadButtonPressed:(NSIndexPath *)indexPath;

@end

#endif /* DownloadsMapsViewModel_h */
