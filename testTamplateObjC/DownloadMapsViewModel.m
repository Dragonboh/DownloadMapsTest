//
//  DownloadMapsViewModel.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 03.07.2023.
//

#import <Foundation/Foundation.h>
#import "DownloadMapsViewModel.h"

@interface DownloadMapsViewModel ()

@property (strong, nonatomic) XMLParser *parser;

@end

@implementation DownloadMapsViewModel

- (id)initWithParser:(XMLParser *)parser {
    self = [super self];
    if (self) {
        self.parser = parser;
    }
    return self;
}

- (void)fetchData {
    self.regions = [self.parser parseXML];
}


@end
