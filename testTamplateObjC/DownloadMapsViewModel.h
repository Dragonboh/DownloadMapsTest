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

@interface DownloadMapsViewModel : NSObject

@property (nonatomic, strong) NSArray<Region *> *regions;

- (id)initWithParser: (XMLParser *)parser;

- (void)fetchData;

@end

#endif /* DownloadsMapsViewModel_h */
