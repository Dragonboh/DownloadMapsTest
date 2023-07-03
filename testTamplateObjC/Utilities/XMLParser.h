//
//  XMLParser.h
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 02.07.2023.
//

#ifndef XMLParser_h
#define XMLParser_h

#import <Foundation/Foundation.h>

@interface XMLParser: NSObject <NSXMLParserDelegate>

- (NSMutableArray *)parseXML;

@end

#endif /* XMLParser_h */
