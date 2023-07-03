//
//  SceneDelegate.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 28.06.2023.
//

#import <UIKit/UIKit.h>
#import "AppCoordinator.h"

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

@property (strong, nonatomic) UIWindow * window;
@property (strong, nonatomic) AppCoordinator * appCoordinator;

@end

