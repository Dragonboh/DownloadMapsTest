//
//  Region.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 02.07.2023.
//

#ifndef Region_h
#define Region_h

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MapType) {
    continent,
    map,
    srtm,
    hillshade,
    none
};

@interface Region : NSObject

@property (nonatomic, copy) NSString *name;
//@property (nonatomic, copy) NSString *type;
@property BOOL map;
@property (nonatomic, copy) NSString *translate;

@property (nonatomic, strong) NSMutableArray<Region *> *regions;
//@property MapType type;

- (id)initWithName:(NSString *)name
              type:(NSString *)type
               map:(NSString *)map
         translate:(NSString *)translate;

@end

#endif /* Region_h */
