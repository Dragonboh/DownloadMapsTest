//
//  XMLParser.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 02.07.2023.
//

#import "XMLParser.h"
#import "Region.h"

@interface XMLParser ()

@property NSXMLParser *parser;

@property NSString *element;

@property Region *currentRegion;
@property NSMutableArray *arr;
@property NSMutableArray<Region *> *arr2;

@end

@implementation XMLParser

- (NSMutableArray *)parseXML {
    self.arr = [NSMutableArray array];
    self.arr2 = [NSMutableArray array];
    
    NSURL *xmlPath = [[NSBundle mainBundle] URLForResource:@"regions" withExtension:@"xml"];
    
    self.parser = [[NSXMLParser alloc] initWithContentsOfURL:xmlPath];
    self.parser.delegate = self;
    [self.parser parse];
    
    return self.arr;
}

- (void)parser: (NSXMLParser *)parser
didStartElement: (NSString *)elementName
  namespaceURI: (NSString *)namespaceURI
 qualifiedName: (NSString *)qName
    attributes: (NSDictionary<NSString *,NSString *> *)attributeDict {
    if ([elementName isEqualToString:@"region"]) {
        self.currentRegion = [[Region alloc] initWithName:[attributeDict objectForKey:@"name"]];
//        self.currentRegion.name = [attributeDict objectForKey:@"name"];
        [self.arr2 addObject:self.currentRegion];
    }
    
    NSLog(@"blablabla");
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    if (self.currentRegion) {
        if (self.arr2.count > 1) {
            Region *reg = [self.arr2 lastObject];
            [self.arr2 removeLastObject];
            [[self.arr2 lastObject].maps addObject:reg];
        } else {
            NSLog(@"blablabla");
            [self.arr addObject:self.arr2.firstObject];
            [self.arr2 removeAllObjects];
            self.currentRegion = nil;
        }
        NSLog(@"blablabla");
    }
}

@end
