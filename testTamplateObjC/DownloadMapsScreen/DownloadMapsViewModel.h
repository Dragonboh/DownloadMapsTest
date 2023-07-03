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

@interface DownloadMapsViewModel : NSObject

@property (strong, nonatomic) NSDictionary<NSString *, NSArray<DownloadMapCellModel *> *> *displayModel;
@property (weak, nonatomic) AppCoordinator *coordinator;

- (id)initWithParser: (XMLParser *)parser
         fileManager: (MapsFileManager *)fileManager;

- (void)fetchData;


- (void)didSelectRow:(NSInteger)row;

@end

#endif /* DownloadsMapsViewModel_h */
