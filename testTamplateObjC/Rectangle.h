//
//  Rectangle.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 01.07.2023.
//

#ifndef Rectangle_h
#define Rectangle_h

#import <Foundation/Foundation.h>

@interface Rectangle : NSObject {
    int height;
    int width;
}

- (void) setHeight: (int)newHeight;
- (void) setWidth: (int)newWidth;

- (void) setHeight: (int)newHeight
          andWidth: (int)newWidth;

- (int)height;

@end

#endif /* Rectangle_h */
