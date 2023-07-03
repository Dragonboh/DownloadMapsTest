//
//  RegionTableViewModel.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//

#import <Foundation/Foundation.h>
#import "RegionTableViewModel.h"

@implementation RegionTableViewModel

- (id)initWithRegions:(NSArray *)regions {
    self = [super init];
    if (self) {
        self.regions = regions;
    }
    
    return self;
}

@end
