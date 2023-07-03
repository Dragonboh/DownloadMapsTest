//
//  Region.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 02.07.2023.
//

#import <Foundation/Foundation.h>
#import "Region.h"

@implementation Region
//@synthesize name;

- (id)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
        self.maps = [NSMutableArray array];
    }
    
    return self;
}

@end
