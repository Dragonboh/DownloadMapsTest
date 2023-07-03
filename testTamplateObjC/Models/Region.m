//
//  Region.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 02.07.2023.
//

#import "Region.h"

@implementation Region

- (id)initWithName:(NSString *)name type:(NSString *)type map:(NSString *)map translate:(NSString *)translate {
    self = [super init];
    if (self) {
        self.name = name;
        if (type) {
            if ([type isEqualToString:@"map"]) {
                self.map = true;
            } else {
                self.map = false;
            }
        } else {
            if (map) {
                self.map = true;
            } else {
                if ([map isEqualToString:@"yes"]) {
                    self.map = true;
                } else {
                    self.map = false;
                }
            }
        }
        
        self.regions = [NSMutableArray array];
    }
    
    return self;
}

@end
