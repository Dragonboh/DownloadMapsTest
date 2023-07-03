//
//  AppCoordinator.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 04.07.2023.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Region.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppCoordinator : NSObject

- (id)initWithWindow:(UIWindow *)window;
- (void)start;

- (void)goToRegion:(Region *)region;

@end

NS_ASSUME_NONNULL_END
