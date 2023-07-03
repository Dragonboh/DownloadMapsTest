//
//  RegionTableViewModel.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//

#ifndef RegionMapsViewModel_h
#define RegionMapsViewModel_h

#import "Region.h"

@interface RegionMapsViewModel : NSObject

@property (nonatomic, copy) NSArray<Region *> *regions;

- (id)initWithRegions:(NSArray *)regions;

@end
#endif /* RegionMapsViewModel_h */
