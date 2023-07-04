//
//  Debouncer.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 04.07.2023.
//

#import <Foundation/Foundation.h>


@interface Debouncer : NSObject

@property (nonatomic, strong) dispatch_block_t block;
@property (nonatomic, strong) dispatch_source_t source;

- (instancetype)initWithDelay:(double)delay block:(dispatch_block_t)block;
- (void)call;

@end

