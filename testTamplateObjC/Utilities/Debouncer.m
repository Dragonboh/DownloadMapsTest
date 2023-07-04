//
//  Debouncer.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 04.07.2023.
//

#import "Debouncer.h"

@implementation Debouncer

- (instancetype)initWithDelay:(double)delay block:(dispatch_block_t)block {
    self = [super init];
    if (self) {
        _block = [block copy];
        
        dispatch_queue_t queue = dispatch_get_main_queue();
        _source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        dispatch_source_set_timer(_source, DISPATCH_TIME_NOW, delay * NSEC_PER_SEC, 0.1 * NSEC_PER_SEC);
        dispatch_source_set_event_handler(_source, ^{
            block();
            dispatch_source_cancel(self.source);
        });
    }
    return self;
}

- (void)call {
    dispatch_resume(self.source);
}

@end
