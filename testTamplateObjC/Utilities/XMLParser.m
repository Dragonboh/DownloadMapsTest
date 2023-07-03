//
//  XMLParser.m
//  testTamplateObjC
//
//  Created by Bogdan Pankevych on 02.07.2023.
//

#import "XMLParser.h"

@interface XMLParser ()

@property (nonatomic, strong) NSXMLParser *parser;
@property (nonatomic, strong) NSString *element;
@property (nonatomic, strong) Region *currentRegion;
@property (nonatomic, strong) NSMutableArray<Region *> *resultArray;
@property (nonatomic, strong) NSMutableArray<Region *> *tempArray;

@end

@implementation XMLParser

- (NSMutableArray<Region *> *)parseXML {
    self.resultArray = [NSMutableArray array];
    self.tempArray = [NSMutableArray array];
    
    NSURL *xmlPath = [[NSBundle mainBundle] URLForResource:@"regions" withExtension:@"xml"];
    
    self.parser = [[NSXMLParser alloc] initWithContentsOfURL:xmlPath];
    self.parser.delegate = self;
    [self.parser parse];
    
    return self.resultArray;
}

- (void)parser: (NSXMLParser *)parser
didStartElement: (NSString *)elementName
  namespaceURI: (NSString *)namespaceURI
 qualifiedName: (NSString *)qName
    attributes: (NSDictionary<NSString *,NSString *> *)attributeDict {
    if ([elementName isEqualToString:@"region"]) {
        self.currentRegion = [[Region alloc] initWithName: [attributeDict objectForKey:@"name"]
                                                     type: [attributeDict objectForKey:@"type"]
                                                      map: [attributeDict objectForKey:@"map"]
                                                translate: [attributeDict objectForKey:@"translate"]];
        [self.tempArray addObject:self.currentRegion];
    }
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    if (self.currentRegion) {
        if (self.tempArray.count > 1) {
            Region *reg = [self.tempArray lastObject];
            [self.tempArray removeLastObject];
            [[self.tempArray lastObject].regions addObject:reg];
        } else {
            [self.resultArray addObject:self.tempArray.firstObject];
            [self.tempArray removeAllObjects];
            self.currentRegion = nil;
        }
    }
}

@end
