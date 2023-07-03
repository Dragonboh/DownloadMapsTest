//
//  XMLParser.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 02.07.2023.
//

#ifndef XMLParser_h
#define XMLParser_h

#import <Foundation/Foundation.h>
#import "Region.h"

@interface XMLParser: NSObject <NSXMLParserDelegate>

- (NSMutableArray<Region *> *)parseXML;

@end

#endif /* XMLParser_h */
