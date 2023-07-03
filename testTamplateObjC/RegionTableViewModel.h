//
//  RegionTableViewModel.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//

#ifndef RegionTableViewModel_h
#define RegionTableViewModel_h

#import "Region.h"

@interface RegionTableViewModel : NSObject

@property (nonatomic, copy) NSArray<Region *> *regions;

- (id) initWithRegions: (NSArray *)regions;

@end
#endif /* RegionTableViewModel_h */
