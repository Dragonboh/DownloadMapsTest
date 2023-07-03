//
//  Rectangle.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 01.07.2023.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"

@implementation Rectangle

- (void)setHeight:(int)newHeight {
    height = newHeight;
}

- (void)setHeight:(int)newHeight andWidth:(int)newWidth {
    width = newWidth;
    height = newHeight;
}

- (void)setWidth:(int)newWidth {
    width = newWidth;
}

- (int)height {
    return height;
}

@end
