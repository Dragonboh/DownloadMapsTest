//
//  Region.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 02.07.2023.
//

#ifndef Region_h
#define Region_h

#import <Foundation/Foundation.h>

@interface Region : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray<Region *> *maps;
//@property (nonatomic, copy) NSString *type;

//@property (nonatomic, copy) NSString *translate;
//
//@property (nonatomic, copy) NSString *name;
//@property (nonatomic, copy) NSString *lang;
//@property (nonatomic, copy) NSString *poly_extract;
//@property (nonatomic, copy) NSString *inner_download_prefix;
//@property (nonatomic, copy) NSString *join_map_files;

- (id)initWithName: (NSString *)name;

@end

#endif /* Region_h */
