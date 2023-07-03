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

@interface DownloadMapsViewModel : NSObject

@property (nonatomic, strong) NSDictionary<NSString *, NSArray<DownloadMapCellModel *> *> *displayModel;

- (id)initWithParser: (XMLParser *)parser
         fileManager: (MapsFileManager *)fileManager;

- (void)fetchData;

@end

#endif /* DownloadsMapsViewModel_h */
